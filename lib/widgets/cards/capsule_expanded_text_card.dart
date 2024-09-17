import 'package:easy_birthday/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';

class CapsuleExpandedTextCard extends StatefulWidget {
  final bool isExpanded;
  final VoidCallback onTap;
  final MapEntry<String, List<String>> items;

  const CapsuleExpandedTextCard({
    Key? key,
    required this.isExpanded,
    required this.onTap,
    required this.items,
  }) : super(key: key);

  @override
  State<CapsuleExpandedTextCard> createState() =>
      _CapsuleExpandedTextCardState();
}

class _CapsuleExpandedTextCardState extends State<CapsuleExpandedTextCard>
    with SingleTickerProviderStateMixin {
  ListView _buildHorizontalListViews() {
    final values = widget.items.value;
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: values.length,
      separatorBuilder: (context, index) => kheasydevVerticalDivider(
          black: true, padding: EdgeInsets.symmetric(vertical: 24)),
      itemBuilder: (context, index) {
        return Container(
          constraints: BoxConstraints(minWidth: 100),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: Center(
            child: Text(values[index],
                style: const TextStyle(color: Colors.white)),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                    : 150,
                child: Row(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.items.key,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          Spacer(),
                          if (!widget.isExpanded)
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(Icons.arrow_forward),
                            ),
                          if (widget.isExpanded)
                            kheasydevVerticalDivider(black: true)
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: widget.isExpanded
                          ? ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                              child: Container(
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
