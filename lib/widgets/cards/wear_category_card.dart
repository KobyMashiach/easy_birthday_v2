import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:flutter/material.dart';

class WearCategoryCard extends StatefulWidget {
  final CategoryModel category;
  final VoidCallback onLockPress;
  const WearCategoryCard(
      {super.key, required this.category, required this.onLockPress});

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

  void toggleLock() {
    setState(() {
      lock = !lock;
    });
    widget.onLockPress.call();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        widget.category.titleAppear!,
        style: AppTextStyle().watchDescription,
      ),
      trailing: IconButton(
          onPressed: toggleLock,
          icon: Icon(lock ? Icons.lock_outline : Icons.lock_open)),
    );
  }
}
