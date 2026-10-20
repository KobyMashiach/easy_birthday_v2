import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:flutter/material.dart';

class WearCategoryCard extends StatefulWidget {
  final CategoryModel category;
  final ValueChanged<bool> onLockChanged;
  const WearCategoryCard({
    super.key,
    required this.category,
    required this.onLockChanged,
  });

  @override
  State<WearCategoryCard> createState() => _WearCategoryCardState();
}

class _WearCategoryCardState extends State<WearCategoryCard> {
  late bool lock;

  @override
  void initState() {
    super.initState();
    lock = widget.category.lock;
  }

  @override
  void didUpdateWidget(WearCategoryCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Every bloc emit carries the saved value, so this also undoes the
    // optimistic toggle when saving failed.
    lock = widget.category.lock;
  }

  void toggleLock() {
    setState(() {
      lock = !lock;
    });
    widget.onLockChanged(lock);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        widget.category.displayTitle,
        style: AppTextStyle().watchDescription,
      ),
      trailing: IconButton(
        onPressed: toggleLock,
        icon: Icon(lock ? Icons.lock_outline : Icons.lock_open),
      ),
    );
  }
}
