import 'package:flutter/material.dart';
import 'package:flutterdemo/models/products.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Product%20Pages/productsPage.dart';
// import 'package:flutterdemo/views/Main%20Screen%20Pages/Product%20Pages/productsPage.dart';

class SubHeading extends StatelessWidget {
  const SubHeading({
    Key? key,
    required this.leading,
    required this.trailing,
    required this.products
  }) : super(key: key);

  final String leading;
  final String trailing;
  final List products;
  @override
  Widget build(BuildContext context) {
    
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
                          title: leading,
                          products: products,
                        )),
              );
            },
            child: Text(trailing))
      ],
    );
  }
}
