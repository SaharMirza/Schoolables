import 'package:flutter/material.dart';

import 'package:flutterdemo/models/ScannedList.dart';
import 'package:flutterdemo/models/SyllabusBook.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/utils.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/search_bar.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/text_widget.dart';
import 'package:flutterdemo/views/Scanning%20Pages/book_prices.dart';

class SyllabusList extends StatefulWidget {
  const SyllabusList({super.key, required this.scannedList});

  final ScannedList scannedList;

  @override
  State<SyllabusList> createState() => _SyllabusListState();
}

class _SyllabusListState extends State<SyllabusList> {

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const HeaderBar(title: "Scanned Lists"),
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

//list tile

class syllabusListTile extends StatefulWidget {
  const syllabusListTile({super.key, required this.syllabusItem});

  final SyllabusBook syllabusItem;

  @override
  State<syllabusListTile> createState() => _syllabusListTileState();
}

class _syllabusListTileState extends State<syllabusListTile> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: 80,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ListTile(
          leading: Image.asset(
            widget.syllabusItem.image,
            width: 45,
            height: 45,
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child:
            ListtitleText(
              text: widget.syllabusItem.book_name,
              align: TextAlign.left,
              size: screenHeight * 0.022,
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.arrow_forward_ios, color: MyColors.subtitleColor),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                        BookPrices(bookname: widget.syllabusItem.book_name)),
              );
            },
          ),
        ),
      ),
    );
  }
}
