import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/core/utils/general_functions.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/widgets/animations/staggered_entrance.dart';
import 'package:easy_birthday/core/widgets/dialogs/general_dialog.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/core/widgets/general/app_network_image.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/confetti_widget.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/display_screen_layout.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/gift_box.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// The surprise starts as a wrapped gift; opening it shakes the box, pops
/// the lid and reveals the owner's texts and pictures one by one.
class DisplayBirthdaySurprise extends StatefulWidget {
  const DisplayBirthdaySurprise({super.key, required this.category});

  final CategoryModel category;

  @override
  State<DisplayBirthdaySurprise> createState() =>
      _DisplayBirthdaySurpriseState();
}

class _DisplayBirthdaySurpriseState extends State<DisplayBirthdaySurprise>
    with TickerProviderStateMixin {
  late final List<Widget> items = surpriseMapToWidgets(
    widget.category.surpriseMap,
  );

  /// URL of each item that is a network image (null for texts), so images can
  /// be shown cached and opened full size.
  late final List<String?> _imageUrls = items.map(_networkImageUrl).toList();

  late final AnimationController _open;
  late final AnimationController _wiggle;
  bool _revealed = false;

  @override
  void initState() {
    super.initState();
    _open = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );
    _wiggle = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..repeat();
  }

  @override
  void dispose() {
    _open.dispose();
    _wiggle.dispose();
    super.dispose();
  }

  static String? _networkImageUrl(Widget item) {
    if (item is! Image) return null;
    // Images built with a cache size wrap their provider in a ResizeImage.
    final ImageProvider provider = switch (item.image) {
      ResizeImage(:final imageProvider) => imageProvider,
      final ImageProvider image => image,
    };
    return provider is NetworkImage ? provider.url : null;
  }

  Future<void> _openGift() async {
    if (_open.isAnimating || _revealed) return;
    _wiggle.stop();
    HapticFeedback.mediumImpact();
    await _open.forward();
    HapticFeedback.heavyImpact();
    if (mounted) setState(() => _revealed = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: widget.category.displayTitle),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: DisplayScreenLayout(
              category: widget.category,
              body: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: _revealed ? _contents() : _gift(),
              ),
            ),
          ),
          if (_revealed) const ScreenConfettiWidget(),
        ],
      ),
    );
  }

  Widget _gift() {
    return GestureDetector(
      key: const ValueKey('gift'),
      behavior: HitTestBehavior.opaque,
      onTap: _openGift,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AnimatedBuilder(
                animation: Listenable.merge([_open, _wiggle]),
                builder: (context, _) =>
                    GiftBox(open: _open.value, wiggle: _wiggle.value),
              ),
              const SizedBox(height: 12),
              Text(
                t.tap_to_open_gift(context: SessionService().gender),
                textAlign: TextAlign.center,
                style: AppTextStyle().description,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contents() {
    return ListView.separated(
      key: const ValueKey('contents'),
      itemBuilder: (context, index) {
        final String? path = _imageUrls[index];
        return StaggeredEntrance(
          index: index,
          fromScale: 0.8,
          child: GestureDetector(
            onTap: path != null ? () => _showImageDialog(path) : null,
            child: Center(
              child: path != null
                  ? DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(color: Colors.black26, blurRadius: 8),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: imageCacheDisplay(path),
                      ),
                    )
                  : items[index],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemCount: items.length,
    );
  }

  // Shown 200 high (also in the dialog); don't decode at full resolution.
  Widget imageCacheDisplay(String mediaUrl) =>
      AppNetworkImage(url: mediaUrl, height: 200, memCacheHeight: 600);

  void _showImageDialog(String mediaUrl) {
    final Size screenSize = MediaQuery.sizeOf(context);
    showDialog(
      context: context,
      builder: (context) {
        return generalDialog(
          title: "",
          noButtons: true,
          child: Container(
            width: screenSize.width,
            height: screenSize.height * 0.7,
            padding: const EdgeInsets.all(12),
            child: imageCacheDisplay(mediaUrl),
          ),
        );
      },
    );
  }
}
