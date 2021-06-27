import 'package:flutter/material.dart';
import 'package:furniture_app/components/title_text.dart';
import 'package:furniture_app/models/Categories.dart';
import 'package:furniture_app/screens/home/components/category_dart.dart';
import 'package:furniture_app/services/fetchCategories.dart';
import 'package:furniture_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    // It enables scrolling
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(defaultSize! * 2), //20
            child: TitleText(title: "Browse by Categories"),
          ),
          FutureBuilder(
            future: fetchCategories(),
            builder: (context, snapshot) => snapshot.hasData
                  ? Center(child: Image.asset("assets/ripple.gif"))
                  : Center(child: Image.asset("assets/ripple.gif")),
          )
        ],
      ),
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
    required this.categories
  }) : super(key: key);

  final List<Category> categories;

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
