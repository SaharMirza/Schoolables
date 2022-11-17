import 'package:flutter/material.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/filter_widget.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/map_widget.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/my_profile.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/search_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:10, left: 8),


              child: Row(
                children: [
                  NavigateBackWidget(
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                  Text('Books',
                    style:
                    GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 59, 59, 61),
                        fontSize: screenHeight * 0.030,
                        fontWeight: FontWeight.bold
                    ),
          ),
        ],),
            ),
            SizedBox(height: screenHeight*0.03),
            Row(
                children: [
                  Expanded(child:SearchBar(screenHeight: screenHeight, width: screenWidth),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  const FilterWidget(),
                  SizedBox(width: 7),
                  const MapWidget(),
                  SizedBox(
                    width: 7,
                  ),
                ],
              ),
            SizedBox(height:screenHeight*0.02),
            
            Expanded(
              child: Container(
                height: screenHeight*0.8,
                width: screenWidth,
                decoration: BoxDecoration(
                  image:DecorationImage(
                    image: AssetImage('images/map_image.png'),
                  fit: BoxFit.fill
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


