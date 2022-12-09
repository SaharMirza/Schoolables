import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:flutterdemo/utils.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/category_list_builder.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/my_profile.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/product_card.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/search_bar.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/home_screen.dart';

class BookPrices extends StatefulWidget {
  const BookPrices({super.key, required this.bookname});

  final String bookname;

  @override
  State<BookPrices> createState() => _BookPricesState();
}

class _BookPricesState extends State<BookPrices> {
  List<Product> books = [
    Product(
      name: 'Karwaan-e-Urdu',
      image: 'assets/images/image-placeholder.png',
      price: '200',
      isFav: false,
    ),
    Product(
      name: 'Karwaan-e-Urdu',
      image: 'assets/images/image-placeholder.png',
      price: '250',
      isFav: false,
    ),
    Product(
      name: 'Karwaan-e-Urdu',
      image: 'assets/images/image-placeholder.png',
      price: '300',
      isFav: false,
    ),
    Product(
      name: 'Karwaan-e-Urdu',
      image: 'assets/images/image-placeholder.png',
      price: '250',
      isFav: false,
    ),
    Product(
      name: 'Karwaan-e-Urdu',
      image: 'assets/images/image-placeholder.png',
      price: '300',
      isFav: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<Product> product = [
      Product(name: "O'Levels Math", image: "", price: "500", isFav: false),
      Product(name: "O'Levels Science", image: "", price: "500", isFav: false),
      Product(name: "O'Levels English", image: "", price: "500", isFav: false),
      Product(name: "O'Levels ", image: "", price: "500", isFav: false),
      Product(name: "O'Levels Physics", image: "", price: "500", isFav: false),
      Product(
          name: "O'Levels Chemistry", image: "", price: "500", isFav: false),
      Product(name: "O'Levels Bio", image: "", price: "500", isFav: false),
      Product(name: "O'Levels Eco", image: "", price: "500", isFav: false),
      Product(name: "O'Levels Computer", image: "", price: "500", isFav: false),
    ];

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderBar(title: widget.bookname),
            SizedBox(
              height: screenHeight * 0.85,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      SearchfilterMapWidget(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth * 0.9),
                      GridView.count(
                          childAspectRatio: screenWidth / (screenHeight * 0.8),
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          // children: [
                          //   for (var i = 0; i < 6; i++)
                          //     ProductCard(
                          //       pid:product[i].id,
                          //         name: product[i].name,
                          //         price: product[i].price,
                          //         image: product[i].image,
                          //         isFav: product[i].isFav),
                          // ]
                          ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
