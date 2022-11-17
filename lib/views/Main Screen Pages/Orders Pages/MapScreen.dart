import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';
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
            HeaderBar(title: "Books"),
            SizedBox(height: screenHeight * 0.03),
            Row(
              children: [
                Expanded(
                  child:
                      SearchBar(screenHeight: screenHeight, width: screenWidth),
                ),
                const SizedBox(
                  width: 7,
                ),
                const FilterWidget(),
                const SizedBox(width: 7),
                const MapWidget(),
                const SizedBox(
                  width: 7,
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: Container(
                height: screenHeight * 0.8,
                width: screenWidth,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/map_image.png'),
                      fit: BoxFit.fill),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: screenWidth * 0.80,
                      height: screenWidth * 0.2,
                      color: Colors.black26,
                      child: const ListTile(
                        leading: Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Icon(Icons.info_outline, size: 35,),
                        ),
                        subtitle: Text(
                          'You can go through book by scrolling the cards'
                          'horizontally and get the location of each book using locate button',
                          textAlign: TextAlign.start,
                          softWrap: true,
                        ),
                      ),
                    ),

                    Container(
                      height: screenHeight * 0.18,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        itemBuilder: (context, index) =>
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: BookLocationCard(screenWidth: screenWidth, title: 'Karwan-e-urdu'),
                            ),
                        itemCount: 2,
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookLocationCard extends StatelessWidget {
  final double screenWidth;
  final String title;

  const BookLocationCard({Key? key, required this.screenWidth, required this.title,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.45,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {  },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  minimumSize: const Size(30, 40),
                ),
                child: Text('Locate'),
              ),
              ElevatedButton(
                onPressed: () {  },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  minimumSize: const Size(30, 40),
                ),
                child: Text('View'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

