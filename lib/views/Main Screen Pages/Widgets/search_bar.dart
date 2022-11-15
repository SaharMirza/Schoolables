import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * 0.75,
      height: 2 * (screenHeight * 0.04 - screenWidth * 0.02),
      child: TextField(
        decoration: InputDecoration(
          // labelStyle: TextStyle(fontSize: screenWidth * 0.05),
          prefixIcon: Icon(Icons.search_outlined),
          filled: true,
          fillColor: Color.fromRGBO(242, 233, 228, 1.0),
          labelText: "What are you looking for?",
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
