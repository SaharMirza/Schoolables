import 'package:flutter/material.dart';
import 'package:flutterdemo/provider/student_provider.dart';
import 'package:flutterdemo/utils.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/product_card.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/search_bar.dart';
import 'package:provider/provider.dart';

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
    for(int i=0;i<widget.products.length;i++){
      print(widget.products[i].title);
    }
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            HeaderBar(title: widget.title),
            MainBody(screenHeight, screenWidth),
          ],
        ),
      ),
    );
  }

  SizedBox MainBody(double screenHeight, double screenWidth) {
    return SizedBox(
      height: screenHeight * 0.85,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SearchfilterMapWidget(
                  screenWidth: screenWidth * 0.9, screenHeight: screenHeight),
              SizedBox(height: screenHeight * 0.01),
              SizedBox(child: ProdutGridView(screenWidth, screenHeight)),
            ],
          ),
        ),
      ),
    );
  }

  GridView ProdutGridView(double screenWidth, double screenHeight) {
    final userProfile = context.watch<UserProvider>().userProfile;
    bool getFav(ID) {
      bool fav = false;
      for (int i = 0; i < userProfile.wishListIDs.length; i++) {
        if (ID == userProfile.wishListIDs[i]) {
          fav = true;
        }
      }
      return fav;
    }

    return GridView.count(
        childAspectRatio: screenWidth / (screenHeight * 0.8),
        shrinkWrap: true,
        crossAxisCount: 2,
        children: [
          for (var i = 0; i < widget.products.length; i++)
            ProductCard(
                pid: widget.products[i].id,
                name: widget.products[i].title,
                price: widget.products[i].price.toString(),
                image: "",
                isFav: getFav(widget.products[i].id)),
        ]);
  }
}
