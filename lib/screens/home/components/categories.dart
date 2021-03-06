
import 'package:flutter/material.dart';
import 'package:furniture_app/models/Categories.dart';
import 'package:furniture_app/screens/home/components/category_dart.dart';

class Categories extends StatelessWidget {
  final List<Category> categories;
  
  const Categories({
    Key? key,
    required this.categories
  }) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length, 
          (index) => CategoryCard(
            category: categories[index],
          )
        )
      )
    );
  }
}
