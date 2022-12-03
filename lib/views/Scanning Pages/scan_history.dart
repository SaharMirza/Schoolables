import 'package:flutter/material.dart';
import 'package:flutterdemo/Classes/ScannedList.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:flutterdemo/utils.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/bottom_nav_bar.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/search_bar.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/text_widget.dart';
import 'package:flutterdemo/views/Scanning%20Pages/camera_screen.dart';
import 'package:flutterdemo/views/Scanning%20Pages/syllabus_list.dart';
import 'package:flutterdemo/views/Widgets/buttons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Main Screen Pages/Widgets/my_profile.dart';

class ScanHistory extends StatefulWidget {
  const ScanHistory({super.key});

  @override
  State<ScanHistory> createState() => _ScanHistoryState();
}

class _ScanHistoryState extends State<ScanHistory> {
  List<ScannedList> scannedList = [
    ScannedList(school_name: "Beacon House", grade: '10'),
    ScannedList(school_name: "Beacon House", grade: '10'),
    ScannedList(school_name: "Beacon House", grade: '10'),
    ScannedList(school_name: "Beacon House", grade: '10'),
    ScannedList(school_name: "Beacon House", grade: '10'),
    ScannedList(school_name: "Beacon House", grade: '10'),
    ScannedList(school_name: "Beacon House", grade: '10'),
    ScannedList(school_name: "Beacon House", grade: '10'),
    ScannedList(school_name: "Beacon House", grade: '10'),
  ];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: screenHeight * 0.9,
        child: Center(
          child: Column(
            children: [
              HeaderBar(title: "Scanned Lists"),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 0, left: 10, right: 10),
                child: SearchBar(
                  width: screenWidth * 0.9,
                  screenHeight: screenHeight,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  itemBuilder: (context, index) =>
                      scanListTile(scanItem: scannedList[index]),
                  itemCount: scannedList.length,
                ),
              ),
            Buttons(ButtonName: "Scan New List", functionToComply: () {  },),
            ],
          ),
        ),
      ),
    );
  }
}

//list tile

class scanListTile extends StatefulWidget {
  const scanListTile({super.key, required this.scanItem});

  final ScannedList scanItem;

  @override
  State<scanListTile> createState() => _scanListTileState();
}

class _scanListTileState extends State<scanListTile> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        onTap: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SyllabusList(scannedList: widget.scanItem),
            ),
          );
        },
        title: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: ListtitleText(
            text: widget.scanItem.school_name,
            align: TextAlign.left,
            size: screenHeight * 0.022,
          ),
        ),
        subtitle: Padding(
          padding:
              const EdgeInsets.only(top: 5, bottom: 10, left: 10, right: 10),
          child: SubtitleListTileText(
            text: "Grade ${widget.scanItem.grade}",
            align: TextAlign.left,
            size: screenHeight * 0.019,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.arrow_forward_ios, color: MyColors.subtitleColor),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) =>
                      SyllabusList(scannedList: widget.scanItem)),
            );
          },
        ),
      ),
    );
  }
}
