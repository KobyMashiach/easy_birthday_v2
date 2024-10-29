import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CategoryModelDataSource {
  static const _boxKey = CategoryModel.hiveKey;

  static Future initialise() async {
    if (!Hive.isBoxOpen(_boxKey)) {
      await Hive.openBox<CategoryModel>(_boxKey);
    }
  }

  Future addNewCategory({required CategoryModel category}) async {
    final box = Hive.box<CategoryModel>(_boxKey);
    await box.add(category);
  }

  Future updateCategory({required CategoryModel category}) async {
    final box = Hive.box<CategoryModel>(_boxKey);
    box.clear();
    await box.add(category);
  }

  CategoryModel? getCategory() {
    final box = Hive.box<CategoryModel>(_boxKey);
    final categorys = box.values.map((e) => e).toList();

    return categorys.isNotEmpty ? categorys.first : null;
  }

  Future clearCategory() async {
    final box = Hive.box<CategoryModel>(_boxKey);
    await box.clear();
  }
}
