// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutterdemo/models/child_model.dart';
// import 'package:flutterdemo/models/location_model.dart';
//
// abstract class LocationRepository {
//   Future<List<LocationModel>> fetchLocationList();
//   addLocation(String areaName, LatitudeLongitudeModel areaLocation, List<AreaModel> areas);
// }
//
// class FirebaselocationRepository implements LocationRepository {
//   final db = FirebaseFirestore.instance;
//
//   @override
//   Future<List<LocationModel>> fetchLocationList() async {
//     List<LocationModel> locations = [];
//     await db.collection("locations").get().then((event) {
//       locations = event.docs
//           .map((e) => LocationModel.fromJson(e.data(), e.id))
//           .toList();
//     });
//     return locations;
//   }
//
//   //add location
//   @override
//   addLocation(String areaName, LatitudeLongitudeModel areaLocation,
//       List<AreaModel> areas) async {
//     final data = LocationModel(
//             areaName: areaName, areaLocation: areaLocation, areas: areas)
//         .toJson();
//     await db
//         .collection("locations")
//         .add(data)
//         .then(
//           (_) => print('Added'),
//         )
//         .catchError(
//           (error) => print('Add failed: $error'),
//         );
//   }
// }
