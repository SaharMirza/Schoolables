import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:flutterdemo/utils.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/Bottom_Nav_bar.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/search_bar.dart';
import 'package:flutterdemo/views/Widgets/buttons.dart';

import 'ScannedList.dart';

class ScanningList extends StatefulWidget {
  const ScanningList({super.key});

  @override
  State<ScanningList> createState() => _ScanningListState();
}

class _ScanningListState extends State<ScanningList> {
  List<ScannedList> scannedList = [
    ScannedList(school_name: "Beacon House Syllabus List", grade: "Grade: 8"),
    ScannedList(
      school_name: "Beacon House Syllabus List",
      grade: "Grade: 10",
    ),
    ScannedList(
      school_name: "City School Syllabus List",
      grade: "Grade: 5",
    ),
  ];


  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          HeaderBar(title: "Scanned List"),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          SearchBar(width: screenWidth, screenHeight: screenHeight),
          SizedBox(height: 10),
          Flexible(
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: scannedList.length,
              separatorBuilder: (context, int index) =>
                  SizedBox(height: screenHeight * 0.01),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListCard(
                    scannedList: scannedList[index],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          const Buttons(ButtonName: "Scan New List"),
          //const BottomNavBar(),
        ],

      ),
    );
  }
}

class ListCard extends StatelessWidget {
  final ScannedList scannedList;

  const ListCard({super.key, required this.scannedList});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight*0.1,
      width: screenWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: const Offset(
              0,
              5.0,
            ),
            blurRadius: 2.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        scannedList.school_name,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      scannedList.grade,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 10,
              ),
              InkWell(
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
