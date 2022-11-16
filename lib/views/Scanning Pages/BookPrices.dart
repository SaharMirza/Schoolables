import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterdemo/constants/fonts.dart';
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
      image: 'images/image-placeholder.png',
      price: '200',
      isFav: false,
    ),
    Product(
      name: 'Karwaan-e-Urdu',
      image: 'images/image-placeholder.png',
      price: '250',
      isFav: false,
    ),
    Product(
      name: 'Karwaan-e-Urdu',
      image: 'images/image-placeholder.png',
      price: '300',
      isFav: false,
    ),
    Product(
      name: 'Karwaan-e-Urdu',
      image: 'images/image-placeholder.png',
      price: '250',
      isFav: false,
    ),
    Product(
      name: 'Karwaan-e-Urdu',
      image: 'images/image-placeholder.png',
      price: '300',
      isFav: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.bookname,
          style: MyStyles.googleSecondTitleText(
              screenWidth * 0.02 + screenHeight * 0.02),
        ),
        elevation: 2,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              iconSize: 50,
              onPressed: (() {}),
              icon: ProfileIcon(
                img:
                    "https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/user-profile-icon.png",
                radius: screenWidth * 0.03 + screenHeight * 0.01,
              )
              // Icon(Icons.account_circle_outlined)
              ),
        ],
      ),
      body: Center(
        child: Column(children: [
          //search bar
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SearchfilterMapWidget(
                screenHeight: screenHeight, screenWidth: screenWidth),
          ),

          //grid view books
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(15),
              itemCount: books.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.all(5),
                child: ProductCard(
                  name: books[index].name,
                  price: books[index].price,
                  image: books[index].image,
                  isFav: books[index].isFav,
                ),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
