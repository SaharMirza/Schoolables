import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Seller_Products extends StatefulWidget {
  const Seller_Products({super.key});

  @override
  State<Seller_Products> createState() => _Seller_ProductsState();
}

class _Seller_ProductsState extends State<Seller_Products> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Seller"),
    );
  }
}