
import 'package:flutter/material.dart';
import 'package:furniture_app/models/Product.dart';
import 'package:furniture_app/screens/details/details_screen.dart';
import 'package:furniture_app/screens/home/components/product_card.dart';
import 'package:furniture_app/size_config.dart';

class RecommendProducts extends StatelessWidget {
  const RecommendProducts({
    Key? key,
    required this.products,
  }) : super(key: key);

  // Because our API provide us list of products
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: EdgeInsets.all(defaultSize! * 2), //20
      child: GridView.builder(
        // We just turm off grid view scrolling
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        // just for demo
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: SizeConfig.orientation == Orientation.portrait? 2 : 4,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.639,
        ),
        itemBuilder: (context, index) => ProductCard(
          product: products[index], 
          press: (){ 
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(
                  product: products[index]
                )
              )
            );
          }
        ),
      ),
    );
  }
}