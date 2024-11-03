import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/widgets/design/general/confetti_widget.dart';
import 'package:easy_birthday/widgets/general/appbar.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class DisplayMemoryGame extends StatefulWidget {
  final CategoryModel category;
  final Function(int score) onDone;
  const DisplayMemoryGame(
      {super.key, required this.category, required this.onDone});

  @override
  State<DisplayMemoryGame> createState() => _DisplayMemoryGameState();
}

class _DisplayMemoryGameState extends State<DisplayMemoryGame> {
  List<bool> cardFlipped = List.generate(12, (index) => false);
  List<String> images = [];
  List<int> selectedCards = [];
  List<int> matchedCards = [];
  List<GlobalKey<FlipCardState>> cardKeys =
      List.generate(12, (_) => GlobalKey<FlipCardState>());
  int score = 0;
  final int canWrong = 5;
  int wrongFlips = 0;
  bool gameStarted = false;
  bool isInitialFlip = true;

  @override
  void initState() {
    super.initState();
    images = [
      ...widget.category.memoryGame!.imagesUrls,
      ...widget.category.memoryGame!.imagesUrls
    ];
    score = widget.category.memoryGame!.score;
    images.shuffle();
    _showAllCardsTemporarily();
  }

  void _showAllCardsTemporarily() {
    setState(() {
      cardFlipped = List.generate(images.length, (_) => true);
    });
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        for (var key in cardKeys) {
          key.currentState?.toggleCard();
        }
        cardFlipped = List.generate(images.length, (_) => false);
        gameStarted = true;
        isInitialFlip = false;
      });
    });
  }

  void onCardTapped(int index) {
    if (!gameStarted ||
        isInitialFlip ||
        wrongFlips >= canWrong ||
        selectedCards.length >= 2 ||
        matchedCards.contains(index) ||
        cardFlipped[index]) {
      return;
    }

    setState(() {
      cardFlipped[index] = true;
      selectedCards.add(index);
    });

    if (selectedCards.length == 2) {
      gameStarted = false;

      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          if (images[selectedCards[0]] == images[selectedCards[1]]) {
            matchedCards.addAll(selectedCards);
            score++;
          } else {
            cardFlipped[selectedCards[0]] = false;
            cardFlipped[selectedCards[1]] = false;
            cardKeys[selectedCards[0]].currentState?.toggleCard();
            cardKeys[selectedCards[1]].currentState?.toggleCard();
            wrongFlips++;
          }
          selectedCards.clear();

          gameStarted = true;
        });
        if (wrongFlips >= canWrong || score == 6) {
          widget.onDone.call(score);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                t.memory_game_lock_title,
                                style: AppTextStyle().bigTitle,
                              ),
                              Text(
                                t.memory_game_lock_description(
                                    name: globalPartnerUser!.name),
                                style: AppTextStyle().title,
                              ),
                            ],
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
                            bool isMatched = matchedCards.contains(index);
                            bool showFront =
                                wrongFlips >= canWrong || cardFlipped[index];

                            return FlipCard(
                              key: cardKeys[index],
                              flipOnTouch: !isInitialFlip &&
                                  !isMatched &&
                                  wrongFlips < canWrong,
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
                                              color: Colors.white),
                                        ),
                                ),
                              ),
                              onFlip: () => onCardTapped(index),
                            );
                          },
                        ),
                ),
              ),
              if (score == 6)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    t.you_win(context: globalGender),
                    style: const TextStyle(fontSize: 60, color: Colors.green),
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
          if (score == 6) const ScreenConfettiWidget(),
        ],
      ),
    );
  }

  Widget cachedImage(int index) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: CachedNetworkImage(
        imageUrl: images[index],
        fit: BoxFit.cover,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => Container(
          color: Colors.grey,
          child: const Icon(
            Icons.image_not_supported,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Padding scoreAndWrongDisplay() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.greenAccent.shade100,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.greenAccent.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(2, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.green, size: 24),
                  const SizedBox(width: 8),
                  Text(
                    "${t.score}: $score",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 184, 177),
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.redAccent.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(2, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.close, color: Colors.red, size: 24),
                  const SizedBox(width: 8),
                  Text(
                    "${t.num_mistakes}: $canWrong / $wrongFlips",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
