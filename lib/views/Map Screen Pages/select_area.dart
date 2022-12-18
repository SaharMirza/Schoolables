// import 'package:flutter/material.dart';
// import 'package:flutterdemo/Entities/location_entity.dart';
// import 'package:flutterdemo/constants/colors.dart';
// import 'package:flutterdemo/provider/location_provider.dart';
// import 'package:flutterdemo/views/Map%20Screen%20Pages/map_screen_demo.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
//
// class selectArea extends StatefulWidget {
//   const selectArea({Key? key}) : super(key: key);
//
//   @override
//   State<selectArea> createState() => _selectAreaState();
// }
//
// class _selectAreaState extends State<selectArea> {
//   var areaList = ['Select your area'];
//   List<Location> locationList=[];
//   late TextEditingController product_controller;
//   var dropdownValue='Select your area';
//   int selectedIndex = 0;
//
//
//   Future getLocations() async {
//
//     await Provider.of<LocationProvider>(context, listen: false).getLocation();
//     //await context.read<LocationProvider>().getLocation();
//     locationList = Provider.of<LocationProvider>(context, listen: false).locationList;
//     //locationList = context.watch<LocationProvider>().locationList;
//     for (var area in locationList) {
//       areaList.add(area.areaName);
//     }
//
//     void dispose(){
//       product_controller.dispose();
//       super.dispose();
//     }
//
//   void initState(){
//     super.initState();
//     product_controller=TextEditingController();
//     getLocations();
//   }
//
// }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     final double screenHeight = MediaQuery.of(context).size.height;
//     final double screenWidth = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//         body: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: screenHeight*0.8,
//                     height: screenHeight*0.6,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                       color: MyColors.startColor,
//                     ),
//                     child: DropdownButton(
//                       menuMaxHeight: screenHeight * 0.2,
//                       isExpanded: true,
//                       dropdownColor: Color(0xffDADBC6),
//                       value: dropdownValue,
//                       borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                       icon: const Icon(Icons.arrow_downward_sharp),
//                       underline: DecoratedBox(
//                         decoration: BoxDecoration(color: Color(0xffDADBC6)),
//                       ),
//                       items: areaList.map((String items) {
//                         return DropdownMenuItem(
//                           value: items,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(items),
//                           ),
//                         );
//                       }).toList(),
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           selectedIndex = areaList.indexOf(newValue!);
//                           dropdownValue = newValue!;
//                         });
//                       },
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       TextButton(
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => MapDemo(
//                             selectedLocation: locationList[selectedIndex - 1]),
//                       ),
//                 );
//               },
//               child: const Text(
//                       'Continue',
//                 style: TextStyle(color: Colors.black),
//               ),
//             ),
//                TextButton(onPressed: (){
//                  Navigator.pop(context);
//                }, child: Text('Cancel', style: TextStyle(color: Colors.black),))
//                     ],
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// //
// // class DropDown extends StatefulWidget {
// //   const DropDown({Key? key}) : super(key: key);
// //
// //   @override
// //   State<DropDown> createState() => _DropDownState();
// // }
// //
// // class _DropDownState extends State<DropDown> {
// //
// //   var areaList = ['Select your area'];
// //   List<Location> locationList = [];
// //   late TextEditingController product_controller;
// //   var dropdownValue = 'Select your area';
// //   int selectedIndex = 0;
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final double screenHeight = MediaQuery.of(context).size.height;
// //     final double screenWidth = MediaQuery.of(context).size.width;
// //
// //     return Container(
// //       width: screenHeight*0.8,
// //       height: screenHeight*0.6,
// //       decoration: BoxDecoration(
// //         borderRadius: BorderRadius.all(Radius.circular(20.0)),
// //         color: MyColors.startColor,
// //       ),
// //       child: DropdownButton(
// //         menuMaxHeight: screenHeight * 0.2,
// //         isExpanded: true,
// //         dropdownColor: Color(0xffDADBC6),
// //         value: dropdownValue,
// //         borderRadius: BorderRadius.all(Radius.circular(20.0)),
// //         icon: const Icon(Icons.arrow_downward_sharp),
// //         underline: DecoratedBox(
// //           decoration: BoxDecoration(color: Color(0xffDADBC6)),
// //         ),
// //         items: areaList.map((String items) {
// //           return DropdownMenuItem(
// //             value: items,
// //             child: Padding(
// //               padding: const EdgeInsets.all(8.0),
// //               child: Text(items),
// //             ),
// //           );
// //         }).toList(),
// //         onChanged: (String? newValue) {
// //           setState(() {
// //             selectedIndex = areaList.indexOf(newValue!);
// //             dropdownValue = newValue!;
// //           });
// //         },
// //       ),
// //     );
// //   }
// // }
