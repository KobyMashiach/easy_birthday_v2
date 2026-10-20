import 'package:easy_birthday/features/category_display/presentation/widgets/display_screens_top.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:flutter/material.dart';

/// [DisplayScreensTop] above a [body] that fills the rest of the page.
///
/// The header is ~250 high, so when the page is short (phone in landscape)
/// it scrolls away with the body instead of leaving the body no room. On
/// taller pages it stays fixed above the body, as designed.
class DisplayScreenLayout extends StatelessWidget {
  final CategoryModel category;
  final bool bottomSpace;

  /// Fills the remaining height; may contain its own scroll view.
  final Widget body;

  const DisplayScreenLayout({
    super.key,
    required this.category,
    required this.body,
    this.bottomSpace = true,
  });

  /// Below this height the header and the body can't both fit.
  static const double _minFixedHeaderHeight = 450;
  static const double _maxHeaderFraction = 0.65;

  @override
  Widget build(BuildContext context) {
    final top = DisplayScreensTop(category: category, bottomSpace: bottomSpace);
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxHeight >= _minFixedHeaderHeight) {
          return Column(
            children: [
              // A very long title at a large text size could still push the
              // body off the page: past this cap the header scrolls itself.
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: constraints.maxHeight * _maxHeaderFraction,
                ),
                child: SingleChildScrollView(primary: false, child: top),
              ),
              Expanded(child: body),
            ],
          );
        }
        return NestedScrollView(
          headerSliverBuilder: (context, _) => [SliverToBoxAdapter(child: top)],
          body: body,
        );
      },
    );
  }
}
