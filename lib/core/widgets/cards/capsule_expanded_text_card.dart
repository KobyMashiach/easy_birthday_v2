import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/features/event/data/models/text_item_model.dart';
import 'package:flutter/material.dart';
import 'package:easy_birthday/core/widgets/design_kit/design_kit.dart';

class CapsuleExpandedTextCard extends StatefulWidget {
  const CapsuleExpandedTextCard({
    super.key,
    required this.isExpanded,
    required this.onTap,
    required this.onTextChosen,
    required this.textItems,
    required this.textChoose,
    this.titleSize,
    this.isNumbers,
    this.displayResult = false,
    this.currentValue,
  });

  final bool isExpanded;
  final TextItemModel textItems;
  final VoidCallback onTap;
  final ValueChanged<String> onTextChosen;
  final bool textChoose;
  final double? titleSize;
  final bool? isNumbers;
  final bool displayResult;
  final String? currentValue;

  @override
  State<CapsuleExpandedTextCard> createState() =>
      _CapsuleExpandedTextCardState();
}

class _CapsuleExpandedTextCardState extends State<CapsuleExpandedTextCard> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildHorizontalListViews() {
    final values = widget.textItems.items;
    return Scrollbar(
      thumbVisibility: true,
      trackVisibility: true,
      controller: _scrollController,
      child: ListView.separated(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: values.length,
        separatorBuilder: (context, index) => kheasydevVerticalDivider(
          black: true,
          padding: const EdgeInsets.symmetric(vertical: 24),
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              widget.onTextChosen(values[index]);
              widget.onTap();
            },
            child: Container(
              constraints: BoxConstraints(
                minWidth: widget.isNumbers != true ? 100 : 30,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Center(
                child: Text(
                  values[index],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final titleSize = widget.titleSize ?? 150;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: widget.onTap,
          child: AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: widget.isExpanded
                    ? const Radius.circular(30)
                    : Radius.zero,
                bottomLeft: widget.isExpanded
                    ? const Radius.circular(30)
                    : Radius.zero,
                topRight: const Radius.circular(30),
                bottomRight: const Radius.circular(30),
              ),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                color: AppColors.primaryColor,
                height: 80,
                width: widget.isExpanded
                    ? MediaQuery.sizeOf(context).width - 24
                    : titleSize,
                child: Row(
                  children: [
                    SizedBox(
                      width: titleSize,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.textItems.text,
                                style: const TextStyle(color: Colors.white),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          if (!widget.isExpanded)
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: widget.textChoose
                                  ? widget.displayResult
                                        ? ConstrainedBox(
                                            constraints: BoxConstraints(
                                              maxWidth: titleSize / 2,
                                            ),
                                            child: Text(
                                              widget.currentValue ?? '',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        : const Icon(
                                            Icons.check,
                                            color: Colors.greenAccent,
                                          )
                                  : const Icon(Icons.arrow_forward),
                            ),
                          if (widget.isExpanded)
                            kheasydevVerticalDivider(black: true),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: widget.isExpanded
                          ? SizedBox(
                              height: 100,
                              child: TweenAnimationBuilder<Offset>(
                                duration: const Duration(milliseconds: 300),
                                tween: Tween<Offset>(
                                  begin: const Offset(-1, 0),
                                  end: const Offset(0, 0),
                                ),
                                curve: Curves.easeInOut,
                                builder: (context, offset, child) {
                                  return FractionalTranslation(
                                    translation: offset,
                                    child: child,
                                  );
                                },
                                child: _buildHorizontalListViews(),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
