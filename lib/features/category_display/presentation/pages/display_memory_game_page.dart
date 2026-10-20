import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/confetti_widget.dart';
import 'package:easy_birthday/core/widgets/general/app_network_image.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/empty_category_view.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class DisplayMemoryGame extends StatefulWidget {
  final CategoryModel category;
  final void Function(int score) onDone;
  const DisplayMemoryGame({
    super.key,
    required this.category,
    required this.onDone,
  });

  @override
  State<DisplayMemoryGame> createState() => _DisplayMemoryGameState();
}

class _DisplayMemoryGameState extends State<DisplayMemoryGame> {
  // cardFlipped[i] == true means card i is showing its image (FlipCard front).
  List<bool> cardFlipped = [];
  List<String> images = [];
  final List<int> selectedCards = [];
  final List<int> matchedCards = [];
  List<GlobalKey<FlipCardState>> cardKeys = [];
  int score = 0;
  static const int canWrong = 5;
  int wrongFlips = 0;
  bool gameStarted = false;
  bool isInitialFlip = true;

  int get _pairCount => images.length ~/ 2;
  bool get _hasWon => score >= _pairCount;

  bool get _isEmpty =>
      widget.category.memoryGame == null ||
      widget.category.memoryGame!.imagesUrls.isEmpty;

  @override
  void initState() {
    super.initState();
    if (_isEmpty) return;
    images = [
      ...widget.category.memoryGame!.imagesUrls,
      ...widget.category.memoryGame!.imagesUrls,
    ];
    score = widget.category.memoryGame!.score;
    images.shuffle();
    cardKeys = List.generate(images.length, (_) => GlobalKey<FlipCardState>());
    _showAllCardsTemporarily();
  }

  void _showAllCardsTemporarily() {
    // FlipCard starts on its front (image) side, so all cards are visible.
    cardFlipped = List.generate(images.length, (_) => true);
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      setState(() {
        for (final key in cardKeys) {
          key.currentState?.toggleCard();
        }
        cardFlipped = List.generate(images.length, (_) => false);
        gameStarted = true;
        isInitialFlip = false;
      });
    });
  }

  bool _canSelect(int index) =>
      gameStarted &&
      !isInitialFlip &&
      wrongFlips < canWrong &&
      selectedCards.length < 2 &&
      !matchedCards.contains(index) &&
      !cardFlipped[index];

  // Flips are driven manually (flipOnTouch: false) so the visual side of a
  // card can never drift from cardFlipped.
  void onCardTapped(int index) {
    if (!_canSelect(index)) return;

    cardKeys[index].currentState?.toggleCard();
    setState(() {
      cardFlipped[index] = true;
      selectedCards.add(index);
    });

    if (selectedCards.length == 2) {
      setState(() => gameStarted = false);
      final onDone = widget.onDone;

      Future.delayed(const Duration(seconds: 1), () {
        final [first, second] = selectedCards;
        final bool isMatch = images[first] == images[second];
        // The result is applied even if the page was closed meanwhile, so
        // leaving right after the last pair / mistake still saves the game.
        if (isMatch) {
          matchedCards.addAll(selectedCards);
          score++;
        } else {
          cardFlipped[first] = false;
          cardFlipped[second] = false;
          wrongFlips++;
        }
        selectedCards.clear();
        gameStarted = true;
        if (mounted) {
          if (!isMatch) {
            cardKeys[first].currentState?.toggleCard();
            cardKeys[second].currentState?.toggleCard();
          }
          setState(() {});
        }
        if (wrongFlips >= canWrong || _hasWon) onDone(score);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isEmpty) return EmptyCategoryView(category: widget.category);
    return Scaffold(
      appBar: appAppBar(title: t.memory_game),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              scoreAndWrongDisplay(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: widget.category.memoryGame!.lock
                      ? Center(
                          // Scrolls instead of overflowing in landscape.
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  t.memory_game_lock_title,
                                  style: AppTextStyle().bigTitle,
                                ),
                                Text(
                                  t.memory_game_lock_description(
                                    name: SessionService().partner?.name ?? '',
                                  ),
                                  style: AppTextStyle().title,
                                ),
                              ],
                            ),
                          ),
                        )
                      : GridView.builder(
                          itemCount: images.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 8.0,
                                crossAxisSpacing: 8.0,
                              ),
                          itemBuilder: (context, index) {
                            final bool isMatched = matchedCards.contains(index);
                            final bool showFront =
                                wrongFlips >= canWrong || cardFlipped[index];

                            return GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () => onCardTapped(index),
                              child: FlipCard(
                                key: cardKeys[index],
                                flipOnTouch: false,
                                direction: FlipDirection.HORIZONTAL,
                                front: Container(
                                  decoration: BoxDecoration(
                                    color: isMatched
                                        ? Colors.green
                                        : Colors.lightBlueAccent,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Center(child: cachedImage(index)),
                                ),
                                back: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Center(
                                    child: showFront
                                        ? cachedImage(index)
                                        : const Text(
                                            "❓",
                                            style: TextStyle(
                                              fontSize: 24,
                                              color: Colors.white,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ),
              if (_hasWon)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    t.you_win(context: SessionService().gender),
                    style: const TextStyle(fontSize: 60, color: Colors.green),
                    // Already a 60px banner; scaled up it would leave the
                    // grid no room in landscape.
                    textScaler: TextScaler.noScaling,
                  ),
                ),
              if (wrongFlips >= canWrong)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    t.game_over,
                    style: const TextStyle(fontSize: 30, color: Colors.red),
                  ),
                ),
            ],
          ),
          if (_hasWon) const ScreenConfettiWidget(),
        ],
      ),
    );
  }

  Widget cachedImage(int index) {
    return Padding(
      padding: const EdgeInsets.all(8),
      // Grid thumbnails: decode at a bounded size, not full resolution.
      child: AppNetworkImage(url: images[index], memCacheWidth: 400),
    );
  }

  Widget scoreAndWrongDisplay() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _StatChip(
            icon: Icons.star,
            text: "${t.score}: $score",
            color: Colors.green,
            background: Colors.greenAccent.shade100,
            shadow: Colors.greenAccent,
          ),
          _StatChip(
            icon: Icons.close,
            text: "${t.num_mistakes}: $wrongFlips / $canWrong",
            color: Colors.red,
            background: const Color.fromARGB(255, 255, 184, 177),
            shadow: Colors.redAccent,
          ),
        ],
      ),
    );
  }
}

/// Score / mistakes counter above the grid.
class _StatChip extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Color background;
  final Color shadow;

  const _StatChip({
    required this.icon,
    required this.text,
    required this.color,
    required this.background,
    required this.shadow,
  });

  @override
  Widget build(BuildContext context) {
    // Shrinks instead of overflowing on narrow phones / long labels.
    return Flexible(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: shadow.withValues(alpha: 0.4),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(2, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
