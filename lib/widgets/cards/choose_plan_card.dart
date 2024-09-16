import 'package:easy_birthday/core/text_styles.dart';
import 'package:flutter/material.dart';

class ChoosePlanCard extends StatelessWidget {
  final String title;
  final String price;
  final List<String> features;
  final bool isSelected;

  const ChoosePlanCard({
    Key? key,
    required this.title,
    required this.price,
    required this.features,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title,
            style: AppTextStyle().bigTitle.copyWith(
                  color: isSelected ? Colors.white : Colors.black,
                )),
        SizedBox(height: 8.0),
        Text("$price₪",
            style: AppTextStyle().title.copyWith(
                  color: isSelected ? Colors.white : Colors.black,
                )),
        SizedBox(height: 16.0),
        ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => futuresList(index),
            separatorBuilder: (context, index) => SizedBox(height: 12),
            itemCount: features.length),
        Spacer(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pinkAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
          onPressed: () {},
          child: Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Padding futuresList(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Icon(
              Icons.check,
              color: isSelected ? Colors.pink : Colors.grey,
            ),
          ),
          SizedBox(width: 8.0),
          Expanded(
            flex: 8,
            child: Text(
              features[index],
              style: AppTextStyle().smallDescription.copyWith(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
