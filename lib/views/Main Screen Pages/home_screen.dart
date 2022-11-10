import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/category_list_builder.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/product_card.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/sub_heading.dart';
import 'Widgets/filter_widget.dart';
import 'Widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [
    Product(name: "O'Levels Math", image: "", price: "500", isFav: false),
    Product(name: "O'Levels Science", image: "", price: "500", isFav: false),
    Product(name: "O'Levels English", image: "", price: "500", isFav: false),
    Product(name: "O'Levels ", image: "", price: "500", isFav: false),
    Product(name: "O'Levels Physics", image: "", price: "500", isFav: false),
    Product(name: "O'Levels Chemistry", image: "", price: "500", isFav: false),
    Product(name: "O'Levels Bio", image: "", price: "500", isFav: false),
    Product(name: "O'Levels Eco", image: "", price: "500", isFav: false),
    Product(name: "O'Levels Computer", image: "", price: "500", isFav: false),
  ];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Hi Tooba!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(74, 78, 105, 1.0),
              )),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //searchbar
              SearchBar(screenWidth: screenWidth, screenHeight: screenHeight),
              //filtericon
              const FilterWidget()
            ],
          ),
          const SizedBox(height: 30.0),
          const CategoryContainer(),
          const SizedBox(height: 20.0),
          const SubHeading(
            leading: 'Nearby Products',
            trailing: 'See all',
          ),
          const SizedBox(height: 10.0),
          GridView.count(
              childAspectRatio: screenWidth / (screenHeight * 0.8),
              shrinkWrap: true,
              crossAxisCount: 2,
              children: [
                for (var i = 0; i < 6; i++)
                  ProductCard(
                      name: products[i].name,
                      price: products[i].price,
                      image: products[i].image,
                      isFav: products[i].isFav),
              ]),
        ],
      ),
    );
  }
}

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SubHeading(leading: "Categories", trailing: ''),
        Container(
            alignment: Alignment.center,
            height: 50,
            child: const CatergoryListBuilder())
      ],
    );
  }
}

class Product {
  final String name;
  final String image;
  final String price;
  bool isFav;

  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.isFav,
  });
}
