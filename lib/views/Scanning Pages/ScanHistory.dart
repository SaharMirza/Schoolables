import 'package:flutter/material.dart';
import 'package:flutterdemo/Classes/ScannedList.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:flutterdemo/utils.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/Bottom_Nav_bar.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/search_bar.dart';
import 'package:flutterdemo/views/Scanning%20Pages/CameraScreen.dart';
import 'package:flutterdemo/views/Scanning%20Pages/SyllabusList.dart';
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

    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: screenHeight * 0.9,
        child: Center(
            child: Column(
              children: [
                HeaderBar(title: "Scanned Lists"),
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
                        scanListTile(scanItem: scannedList[index]),
                    itemCount: scannedList.length,
                  ),
                ),

                // button
                  // child: ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.of(context).push(
                  //       MaterialPageRoute(
                  //         builder: (context) => const CameraScreen(),
                  //       ),
                  //     );
                  //   },
                  //   style: ButtonStyle(
                  //     backgroundColor:
                  //         MaterialStateProperty.all<Color>(MyColors.buttonColor),
                  //     foregroundColor: MaterialStateProperty.all<Color>(
                  //         MyColors.buttonTextColor),
                  //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  //       RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(10.0),
                  //         side: BorderSide(color: MyColors.buttonColor),
                  //       ),
                  //     ),
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(vertical: 5),
                  //     child: Text(
                  //       'Scan New List',
                  //       style: GoogleFonts.poppins(
                  //         color: MyColors.buttonTextColor,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const Buttons(ButtonName: "Scan New List"),
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
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Text(
            widget.scanItem.school_name,
            style: GoogleFonts.poppins(
              color: MyColors.textColor,
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
        ),
        subtitle: Padding(
          padding:
              const EdgeInsets.only(top: 5, bottom: 10, left: 10, right: 10),
          child: Text(
            "Grade ${widget.scanItem.grade}",
            style: GoogleFonts.poppins(
              color: MyColors.subtitleColor,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
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
