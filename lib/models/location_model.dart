class LocationModel{

  String areaName;
  LatitudeLongitudeModel areaLocation;
  List<AreaModel> areas;

  LocationModel({
    required this.areaName,
    required this.areaLocation,
    required this.areas
  });

  static LocationModel fromJson(Map<String, dynamic> json) {
    print(json);
    return LocationModel(
      areaName: json['area_name'],
      areas: (json['areas'] as List).map((e) => AreaModel.fromJson(e as Map<String, dynamic>)).toList(),
      //areaLocation: LatitudeLongitudeModel(lat: 24.25, lng:67.50),
      areaLocation: LatitudeLongitudeModel.fromJson((json['coords']??{"lng": 67.0, "lat": 24.0}) as Map<String, dynamic>),

      //areas:[AreaModel(coords: LatitudeLongitudeModel(lat: 24.25, lng: 37.50),
       //   address: "xyz", id: "abc", name: "abc", phone: "phone")]
    );
  }

  toJson(){
    return {
      'area_name' : areaName,
      'coords' : areaLocation,
      'areas': areas
    };
  }
}
// class ProductModel{
//   String id;
//   String name;
//
//
//}
//
class AreaModel{
  // String address;
  List<String> id;
  //String name;
  // String phone;
  LatitudeLongitudeModel coords;

  AreaModel({
    required this.coords,
    // required this.address,
    required this.id,
    //required this.name,
    // required this.phone,
  });

  static AreaModel fromJson(Map<String, dynamic> json) {
    var firebaseData=[];
    firebaseData = json['products'] ?? [];
    List<String> products = [];
    for (var id in firebaseData) products.add(id.toString().trim());

    return AreaModel(
      coords: LatitudeLongitudeModel.fromJson(json['coords'] as Map<String, dynamic>),
      //address: json['address'],
      id: products,
      // name: json['name'],
      // phone: json['phone'],
    );
  }
}

class LatitudeLongitudeModel{
  double lat;
  double lng;

  LatitudeLongitudeModel({
    required this.lat,
    required this.lng,
  });

  static LatitudeLongitudeModel fromJson(Map<String, dynamic> json) {
   // print(json);
    return LatitudeLongitudeModel(
      lat: (json['lat']??0) as double,
      lng: (json['lng']??0) as double,
    );
  }

}