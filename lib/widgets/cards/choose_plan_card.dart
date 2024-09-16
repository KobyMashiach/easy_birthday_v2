import 'package:flutter/material.dart';

class ChoosePlanListView extends StatelessWidget {
  final String title;
  final String price;
  final List<String> features;
  final bool isSelected;

  const ChoosePlanListView({
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
        Text(
          title,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          price,
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
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
          Icon(
            Icons.check,
            color: isSelected ? Colors.pink : Colors.grey,
          ),
          SizedBox(width: 8.0),
          Text(
            features[index],
            style: TextStyle(
              fontSize: 16.0,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
