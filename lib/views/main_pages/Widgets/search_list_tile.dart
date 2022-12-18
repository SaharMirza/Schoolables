import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/models/product_model.dart';
import 'package:flutterdemo/provider/product_provider.dart';
import 'package:provider/provider.dart';

import '../product_pages/product_detail.dart';
import 'text_widget.dart';

class searchListTile extends StatefulWidget {
  const searchListTile({super.key, required this.product});

  final ProductModel product;

  @override
  State<searchListTile> createState() => _searchListTileState();
}

class _searchListTileState extends State<searchListTile> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final products = context.watch<ProductsProvider>().products;

    return GestureDetector(
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ListTile(
          onTap: (() async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductDetail(product: widget.product),
              ),
            );
          }),
          title: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: ListtitleText(
              text: widget.product.title,
              align: TextAlign.left,
              size: screenHeight * 0.022,
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.arrow_forward_ios, color: MyColors.subtitleColor),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => ProductDetail(product: widget.product)),
              );
            },
          ),
        ),
      ),
    );
  }
}
