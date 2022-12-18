import 'package:flutter/material.dart';
import 'package:flutterdemo/models/product_model.dart';

import 'search_list_tile.dart';

class SearchListView extends StatelessWidget {
  SearchListView({Key? key, required this.newList}) : super(key: key);

  List<ProductModel> newList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
          vertical: 15, horizontal: 20),
      itemBuilder: (context, index) =>
          searchListTile(product: newList[index]),
      itemCount: newList.length,
    );
  }
}