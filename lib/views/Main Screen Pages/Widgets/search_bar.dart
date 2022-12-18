import 'package:flutter/material.dart';
import 'package:flutterdemo/provider/product_provider.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/filter_widget.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/map_widget.dart';
import 'package:flutterdemo/views/Widgets/Search.dart';
import 'package:flutterdemo/models/product_model.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.width,
    required this.screenHeight,
  }) : super(key: key);

  final double width;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    final product = context.read<ProductsProvider>().products;
    List<ProductModel> products = [];
    for (int i = 0; i < product.length; i++) {
      products.add(product[i]);
    }

    return SizedBox(
      width: width,
      // height: 2 * (screenHeight * 0.04 - width * 0.02),
      height: 50,
      child: TextField(
        autofocus: false,
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => SearchPage(
                    searchList: products,
                  )));
        },
        decoration: InputDecoration(
          // labelStyle: TextStyle(fontSize: screenWidth * 0.05),
          prefixIcon: const Icon(Icons.search_outlined),
          filled: true,
          fillColor: const Color.fromRGBO(242, 233, 228, 1.0),
          labelText: "What are you looking for?",
          labelStyle: const TextStyle(fontSize: 15),
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromRGBO(242, 233, 228, 1.0)),
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      ),
    );
  }
}

class SearchfilterMapWidget extends StatelessWidget {
  const SearchfilterMapWidget({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SearchBar(width: screenWidth * 0.8, screenHeight: screenHeight),
        // FilterWidget(),
        const MapWidget()
      ],
    );
  }
}

class SearchfilterWidget extends StatelessWidget {
  const SearchfilterWidget({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SearchBar(width: screenWidth * 0.76, screenHeight: screenHeight),
        const FilterWidget(),
        // MapWidget()
      ],
    );
  }
}
