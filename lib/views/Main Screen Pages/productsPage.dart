import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/product_card.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/search_bar.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key, required this.title, required this.products})
      : super(key: key);
  final String title;
  final List products;

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          HeaderBar(title: widget.title),
          MainBody(screenHeight, screenWidth),
        ],
      ),
    );
  }

  SizedBox MainBody(double screenHeight, double screenWidth) {
    return SizedBox(
      height: screenHeight * 0.88,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SearchfilterMapWidget(
                  screenWidth: screenWidth, screenHeight: screenHeight),
              SizedBox(height: screenHeight * 0.04),
              ProdutGridView(screenWidth, screenHeight),
            ],
          ),
        ),
      ),
    );
  }

  GridView ProdutGridView(double screenWidth, double screenHeight) {
    return GridView.count(
        childAspectRatio: screenWidth / (screenHeight * 0.8),
        shrinkWrap: true,
        crossAxisCount: 2,
        children: [
          for (var i = 0; i < widget.products.length; i++)
            ProductCard(
                name: widget.products[i].name,
                price: widget.products[i].price,
                image: widget.products[i].image,
                isFav: widget.products[i].isFav),
        ]);
  }
}
