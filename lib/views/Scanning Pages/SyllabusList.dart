import 'package:flutter/material.dart';

import 'package:flutterdemo/Classes/ScannedList.dart';
import 'package:flutterdemo/Classes/SyllabusBook.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/my_profile.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/search_bar.dart';
import 'package:flutterdemo/views/Scanning%20Pages/BookPrices.dart';
import 'package:google_fonts/google_fonts.dart';

class SyllabusList extends StatefulWidget {
  const SyllabusList({super.key, required this.scannedList});

  final ScannedList scannedList;

  @override
  State<SyllabusList> createState() => _SyllabusListState();
}

class _SyllabusListState extends State<SyllabusList> {
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
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "${widget.scannedList.school_name} Grade ${widget.scannedList.grade}",
          style: MyStyles.googleSecondTitleText(
              screenWidth * 0.02 + screenHeight * 0.02),
        ),
        elevation: 2,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              iconSize: 50,
              onPressed: (() {}),
              icon: ProfileIcon(
                img:
                    "https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/user-profile-icon.png",
                radius: screenWidth * 0.03 + screenHeight * 0.01,
              )
              // Icon(Icons.account_circle_outlined)
              ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            //search bar
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
            child: Text(
              widget.syllabusItem.book_name,
              style: GoogleFonts.poppins(
                color: MyColors.textColor,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.arrow_forward_ios, color: MyColors.subtitleColor),
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
