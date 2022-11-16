import 'package:flutter/material.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/home_screen.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/productsPage.dart';

class SubHeading extends StatelessWidget {
  const SubHeading({
    Key? key,
    required this.leading,
    required this.trailing,
  }) : super(key: key);

  final String leading;
  final String trailing;
  @override
  Widget build(BuildContext context) {
    List<Product> products = [
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

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(leading,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(74, 78, 105, 1.0),
            )),
        InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductsPage(
                          title: "Nearby Products",
                          products: products,
                        )),
              );
            },
            child: Text(trailing))
      ],
    );
  }
}
