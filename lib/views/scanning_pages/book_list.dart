import 'package:flutter/material.dart';
import 'package:flutterdemo/models/SyllabusBook.dart';
import 'package:flutterdemo/provider/scanned_list_provider.dart';
import 'package:flutterdemo/utils.dart';
import 'package:flutterdemo/views/scanning_pages/syllabus_list.dart';

import 'package:provider/provider.dart';

import '../main_pages/Widgets/search_bar.dart';

class BookList extends StatefulWidget {
  const BookList({super.key});

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const HeaderBar(title: "BookList"),
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
                    syllabusListTile(syllabusItem: context.read<ScannedListProvider>().results[index]),
                itemCount: context.read<ScannedListProvider>().results.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
