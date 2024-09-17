import 'package:easy_birthday/core/colors.dart';
import 'package:flutter/material.dart';

class CapsuleExpandedTextCard extends StatefulWidget {
  final int index;
  final bool isExpanded;
  final VoidCallback onTap;

  const CapsuleExpandedTextCard({
    Key? key,
    required this.index,
    required this.isExpanded,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CapsuleExpandedTextCard> createState() =>
      _CapsuleExpandedTextCardState();
}

class _CapsuleExpandedTextCardState extends State<CapsuleExpandedTextCard>
    with SingleTickerProviderStateMixin {
  ListView _buildHorizontalListViews() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, i) {
        return Container(
          width: 100,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          color: Colors.blue,
          child: Center(
            child: Text('Item $i', style: const TextStyle(color: Colors.white)),
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
                    : 100,
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Title ${widget.index}',
                          style: const TextStyle(color: Colors.white),
                        ),
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
                                key: ValueKey<int>(widget.index),
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
