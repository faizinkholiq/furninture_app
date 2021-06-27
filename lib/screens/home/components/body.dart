import 'package:flutter/material.dart';
import 'package:furniture_app/components/title_text.dart';
import 'package:furniture_app/models/Categories.dart';
import 'package:furniture_app/models/Product.dart';
import 'package:furniture_app/screens/home/components/categories.dart';
import 'package:furniture_app/screens/home/components/recommend_products.dart';
import 'package:furniture_app/services/fetchCategories.dart';
import 'package:furniture_app/services/fetchProducts.dart';
import 'package:furniture_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    // It enables scrolling
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(defaultSize! * 2), //20
              child: TitleText(title: "Browse by Categories"),
            ),
            FutureBuilder(
              future: fetchCategories(),
              builder: (context, snapshot){
                return snapshot.hasData
                      ? Categories(categories: snapshot.data as List<Category>,)
                      : Center(child: Image.asset("assets/ripple.gif"));
              },
            ),
            Divider(height: 5),
            Padding(
              padding: EdgeInsets.all(defaultSize * 2), //20
              child: TitleText(title: "Recommends For You"),
            ),
            // Right Now product is our demo product
            FutureBuilder(
              future: fetchProducts(),
              builder: (context, snapshot) {
                return snapshot.hasData
                      ? RecommendProducts(products: snapshot.data as List<Product>,)
                      : Center(child: Image.asset('assets/ripple.gif'));
              }
            )
          ],
        ),
      ),
    );
  }
}