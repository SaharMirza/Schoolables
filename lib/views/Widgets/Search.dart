import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/models/product_model.dart';
import 'package:flutterdemo/provider/product_provider.dart';
import 'package:flutterdemo/utils.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Product%20Pages/product_detail.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/product_card.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/text_widget.dart';
import 'package:flutterdemo/views/Scanning%20Pages/scan_history.dart';
import 'package:flutterdemo/views/Scanning%20Pages/syllabus_list.dart';
import 'package:provider/provider.dart';

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
  newList=[];
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    String val='';
    final textController = TextEditingController();

    return Scaffold(
      body: (
      Column(
        children: [
          const HeaderBar(title: "Search"),
          SizedBox(height: screenHeight*0.03,),
          SizedBox(
            width: screenWidth*0.9,
            child: TextField(
              autofocus: true,
              onChanged: (value) {
                val = value;
                if(val!='' ) {
                  newList = widget.searchList
                      .where(((products) =>
                  (products.title
                      .toLowerCase()
                      .contains(value.toLowerCase()))))
                      .toList();
                }
                else{
                  newList=[];
                }
                setState(() {});
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search_outlined),
                filled: true,
                fillColor: const Color.fromRGBO(242, 233, 228, 1.0),
                labelText: "What are you looking for?",
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  const BorderSide(color: Color.fromRGBO(242, 233, 228, 1.0)),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
          ),
    SizedBox(height:screenHeight*0.01 ,),
          Expanded(
                      child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      itemBuilder: (context, index) =>
                          searchListTile(product: newList[index]),
                      itemCount: newList.length,
                    ),
                  ),
        ],
      )),
    );
  }
}

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
            icon: Icon(Icons.arrow_forward_ios, color: MyColors.subtitleColor),
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
