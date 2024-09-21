import 'package:easy_birthday/core/colors.dart';
import 'package:easy_birthday/core/global_vars.dart';
import 'package:easy_birthday/core/text_styles.dart';
import 'package:easy_birthday/i18n/strings.g.dart';
import 'package:easy_birthday/models/category_model/category_enum.dart';
import 'package:easy_birthday/models/category_model/category_model.dart';
import 'package:easy_birthday/screens/home/inner/add_category/add_text.dart';
import 'package:easy_birthday/widgets/dialogs/general_dialog.dart';
import 'package:flutter/material.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';

class OwnerHomeScreen extends StatelessWidget {
  final Function(CategoryModel category, String text) onDoneEditText;
  const OwnerHomeScreen({super.key, required this.onDoneEditText});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final category = globalEvent!.categories[index];
        return Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              leading: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                child: Text(
                  category.titleAppear!,
                  style: AppTextStyle()
                      .description
                      .copyWith(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              trailing: IconButton(
                onPressed: () async {
                  final editPress = await showDialog(
                    context: context,
                    builder: (context) => GeneralDialog(
                      title: category.titleAppear!,
                      child: SingleChildScrollView(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: Column(
                            children: [
                              kheasydevDivider(black: true),
                              Expanded(child: getCategoryWidget(category)),
                            ],
                          ),
                        ),
                      ),
                      okButtonText: t.edit,
                      cancelButtonText: t.exit,
                    ),
                  );
                  if (editPress) {
                    switch (category.categoryType) {
                      case CategoryEnum.text:
                        KheasydevNavigatePage().push(
                            context,
                            AddTextScreen(
                                category: category,
                                onDone: (text) =>
                                    onDoneEditText.call(category, text),
                                userText: category.text));
                      case CategoryEnum.pictures:
                        Text("pictures");
                      case CategoryEnum.videos:
                        Text("videos");
                      case CategoryEnum.quizGame:
                        Text("quizGame");
                    }
                    ;
                  }
                },
                icon: Icon(Icons.remove_red_eye_outlined),
              ),
            ));
      },
      separatorBuilder: (context, index) => const SizedBox(height: 24),
      itemCount: globalEvent!.categories.length,
    );
  }

  Widget getCategoryWidget(CategoryModel category) {
    return switch (category.categoryType) {
      CategoryEnum.text => Scrollbar(
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Text(
                category.text!,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      CategoryEnum.pictures => Text("pictures"),
      CategoryEnum.videos => Text("videos"),
      CategoryEnum.quizGame => Text("quizGame"),
    };
  }
}
