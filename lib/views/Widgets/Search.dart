import 'package:flutter/material.dart';
import 'package:flutterdemo/models/products.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/product_card.dart';

class SearchPage extends StatefulWidget {
  List<Product> searchList;
  SearchPage({Key? key, required this.searchList}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Product> newList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newList = widget.searchList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // The search area here
          title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                onChanged: (value) {
                  newList = widget.searchList
                      .where(((products) => (products.name.toLowerCase().contains(value.toLowerCase()))))
                      .toList();
                  setState(() {});
            },
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search...',
                border: InputBorder.none),
          ),
        ),
      )),
      body: Column(
        children: [
          for (var i = 0; i < newList.length; i++)
        Text(newList[i].name)
        ],
      ),
    );
  }
}