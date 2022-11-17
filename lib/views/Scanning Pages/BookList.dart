import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterdemo/Classes/SyllabusBook.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:flutterdemo/utils.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Profile%20Pages/edit_details.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/my_profile.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/search_bar.dart';
import 'package:flutterdemo/views/Scanning%20Pages/SyllabusList.dart';

class BookList extends StatefulWidget {
  const BookList({super.key});

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  List<SyllabusBook> syllabusBooks = [
    SyllabusBook(
      book_name: "Cambridge Check Point English Book 3",
      image: "images/image-placeholder.png",
    ),
    SyllabusBook(
      book_name: "Karwaan-e-Urdu 8",
      image: "images/image-placeholder.png",
    ),
    SyllabusBook(
      book_name: "Graph Book MVP-29",
      image: "images/image-placeholder.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            HeaderBar(title: "BookList"),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 0, left: 10, right: 10),
              child: SearchBar(
                width: screenWidth * 0.9,
                screenHeight: screenHeight,
              ),
            ),
            // list
            Expanded(
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                itemBuilder: (context, index) =>
                    syllabusListTile(syllabusItem: syllabusBooks[index]),
                itemCount: syllabusBooks.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
