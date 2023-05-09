import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterdemo/Entities/location_entity.dart';
import '../Models/location_model.dart';

class LocationProvider extends ChangeNotifier {
  List<Location> locationList = [];

  Future getLocation() async {
    locationList.clear();
    await FirebaseFirestore.instance
        .collection("locations")
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        // print(LocationModel.fromJson(doc.data() as Map<String, dynamic>).toString());
        print(doc.id);
        LocationModel locations =
        LocationModel.fromJson(doc.data() as Map<String, dynamic>);
        LatitudeLongitude latlong = LatitudeLongitude(
            lat: locations.areaLocation.lat, lng: locations.areaLocation.lng);
        List<Area> area = locations.areas.map((e) => Area(
            coords: LatitudeLongitude(lat: e.coords.lat, lng: e.coords.lng),
          name: e.name,
          id: e.id,
        )).toList();
        Location location = Location(
            areaName: locations.areaName,
            areaLocation: latlong,
            areas: area
        );
        locationList.add(location);
        print('This is my list: $locationList');
      }
    });
    notifyListeners();
  }
 
  // Future<String> addLocation(String pid,List ) async {
  //   // print("/////// ////////// " + images[0]);
  //   // String productid = await _productsRepository.addProduct(product);
  //   String productid = await _productsRepository.addProduct(product);
  //   product.id = productid;
  //   userProducts.add(product);
  //   notifyListeners();
  //   return productid;
  // }


}
