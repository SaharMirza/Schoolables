import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:flutterdemo/utils.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/filter_widget.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/map_widget.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/my_profile.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/search_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutterdemo/views/locations.dart' as locations;

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: LatLng(0, 0),
          zoom: 2,
        ),
        markers: _markers.values.toSet(),
      ),
    );
  }
}

//
// class Container2 extends StatelessWidget {
//   Container2({ required this.screenHeight,
//     required this.screenWidth,
//     Key? key
//   }) : super(key: key);
//
//   final double screenWidth, screenHeight;
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Container(
//       height: screenHeight * 0.18,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.symmetric(
//             vertical: 15, horizontal: 20),
//         itemBuilder: (context, index) => Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: BookLocationCard(
//               screenWidth: screenWidth, title: 'Karwan-e-urdu'),
//         ),
//         itemCount: 2,
//       ),
//     );
//   }
// }
//
// class Container1 extends StatelessWidget {
//   Container1({required this.screenHeight, required this.screenWidth, Key? key})
//       : super(key: key);
//
//   final double screenWidth, screenHeight;
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Container(
//       width: screenWidth * 0.80,
//       height: screenWidth * 0.23,
//       color: Colors.purple,
//       child: ListTile(
//         leading: Padding(
//           padding: EdgeInsets.only(top: 5),
//           child: Icon(
//             Icons.info_outline,
//             size: 35,
//           ),
//         ),
//         subtitle: Text(
//           'You can go through book by scrolling the cards'
//               'horizontally and get the location of each book using locate button',
//           textAlign: TextAlign.start,
//           softWrap: true,
//           style: MyStyles.googleTextSubtitleListTile(screenHeight*0.020),
//         ),
//       ),
//     );
//   }
// }
// class BookLocationCard extends StatelessWidget {
//   final double screenWidth;
//   final String title;
//
//   const BookLocationCard({
//     Key? key,
//     required this.screenWidth,
//     required this.title,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: screenWidth * 0.45,
//       height: 100,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(
//           color: Colors.grey,
//           width: 2,
//         ),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Text(title, style: MyStyles.googleTextListTile(16)),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: MyColors.buttonColor,
//                   foregroundColor: Colors.white,
//                   textStyle: const TextStyle(fontWeight: FontWeight.bold),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(32.0)),
//                   minimumSize: const Size(30, 40),
//                 ),
//                 child: Text('Locate'),
//               ),
//               ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: MyColors.buttonColor,
//                   foregroundColor: Colors.white,
//                   textStyle: const TextStyle(fontWeight: FontWeight.bold),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(32.0)),
//                   minimumSize: const Size(30, 40),
//                 ),
//                 child: Text('View'),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
