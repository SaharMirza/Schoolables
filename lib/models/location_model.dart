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
    return LocationModel(
      areaName: json['area_name'],
      //areaLocation: LatitudeLongitudeModel.fromJson(json['coords'] as Map<String, dynamic>),
      //areas: (json['areas'] as List).map((e) => AreaModel.fromJson(e as Map<String, dynamic>)).toList(),
      areaLocation: LatitudeLongitudeModel(lat: 24.25, lng:67.50),
      areas:[AreaModel(coords: LatitudeLongitudeModel(lat: 24.25, lng: 37.50),
          address: "xyz", id: "abc", name: "abc", phone: "phone")]
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

class AreaModel{
  String address;
  String id;
  String name;
  String phone;
  LatitudeLongitudeModel coords;

  AreaModel({
    required this.coords,
    required this.address,
    required this.id,
    required this.name,
    required this.phone,
  });

  static AreaModel fromJson(Map<String, dynamic> json) {
    return AreaModel(
      coords: LatitudeLongitudeModel.fromJson(json['coords'] as Map<String, dynamic>),
      address: json['address'],
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
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
    return LatitudeLongitudeModel(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );
  }

}