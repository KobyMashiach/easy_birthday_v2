import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/models/text_items_model/text_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';

class CapsuleExpandedTextCard extends StatefulWidget {
  const CapsuleExpandedTextCard({
    Key? key,
    required this.isExpanded,
    required this.onTap,
    required this.onTextChoosen,
    required this.textItems,
    required this.textChoose,
    this.titleSize,
    this.isNumbers,
  }) : super(key: key);

  final bool isExpanded;
  final TextItemModel textItems;
  final VoidCallback onTap;
  final Function(String value) onTextChoosen;
  final bool textChoose;
  final double? titleSize;
  final bool? isNumbers;

  @override
  State<CapsuleExpandedTextCard> createState() =>
      _CapsuleExpandedTextCardState();
}

class _CapsuleExpandedTextCardState extends State<CapsuleExpandedTextCard>
    with SingleTickerProviderStateMixin {
  Widget _buildHorizontalListViews({required Function(String) onTextChoosen}) {
    final values = widget.textItems.items;
    final scrollController = ScrollController();
    return Scrollbar(
      thumbVisibility: true,
      trackVisibility: true,
      controller: scrollController,
      child: ListView.separated(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: values.length,
        separatorBuilder: (context, index) => kheasydevVerticalDivider(
            black: true, padding: EdgeInsets.symmetric(vertical: 24)),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              onTextChoosen.call(values[index]);
              widget.onTap();
            },
            child: Container(
              constraints:
                  BoxConstraints(minWidth: widget.isNumbers != true ? 100 : 30),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Center(
                child: Text(values[index],
                    style: const TextStyle(color: Colors.white)),
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
                topLeft: widget.isExpanded ? Radius.circular(30) : Radius.zero,
                bottomLeft:
                    widget.isExpanded ? Radius.circular(30) : Radius.zero,
                topRight: const Radius.circular(30),
                bottomRight: const Radius.circular(30),
              ),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                color: AppColors.primaryColor,
                height: 80,
                width: widget.isExpanded
                    ? MediaQuery.of(context).size.width - 24
                    : titleSize,
                child: Row(
                  children: [
                    SizedBox(
                      width: titleSize,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.textItems.text,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          Spacer(),
                          if (!widget.isExpanded)
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: widget.textChoose
                                  ? Icon(
                                      Icons.check,
                                      color: Colors.greenAccent,
                                    )
                                  : Icon(Icons.arrow_forward),
                            ),
                          if (widget.isExpanded)
                            kheasydevVerticalDivider(black: true)
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: widget.isExpanded
                          ? Container(
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
                                child: _buildHorizontalListViews(
                                    onTextChoosen: widget.onTextChoosen),
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
