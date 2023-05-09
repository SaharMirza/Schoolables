import 'package:flutter/material.dart';
import 'package:flutterdemo/models/product_model.dart';
import 'package:flutterdemo/utils.dart';

import 'Widgets/search_list_view.dart';

class SearchPage extends StatefulWidget {
  List<ProductModel> searchList;

  SearchPage({Key? key, required this.searchList}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<ProductModel> newList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //newList = widget.searchList;
    newList = [];
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    String val = '';
    final textController = TextEditingController();

    return Scaffold(
      body: (Column(
        children: [
          const HeaderBar(title: "Search"),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          SizedBox(
            width: screenWidth * 0.9,
            child: TextField(
              autofocus: true,
              onChanged: (value) {
                val = value;
                if (val != '') {
                  newList = widget.searchList
                      .where(((products) => (products.title
                          .toLowerCase()
                          .contains(value.toLowerCase()))))
                      .toList();
                } else {
                  newList = [];
                }
                setState(() {});
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search_outlined),
                filled: true,
                fillColor: const Color.fromRGBO(242, 233, 228, 1.0),
                labelText: "What are you looking for?",
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(242, 233, 228, 1.0)),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          Expanded(child: SearchListView(newList: newList)),
        ],
      )),
    );
  }
}
