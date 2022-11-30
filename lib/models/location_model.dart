class LocationModel{
  String areaName;
  LatitudeLongitudeModel areaLocation;
  List< ProductLocationModel> products;

  LocationModel({
    required this.areaName,
    required this.areaLocation,
    required this.products
  });

  static LocationModel fromJson(Map<String, dynamic> json) {
    return LocationModel(
        areaName: json['area_name'],
        areaLocation: LatitudeLongitudeModel.fromJson(json['coords'] as Map<String, dynamic>),
        products: (json['produts'] as List).map((e) =>  ProductLocationModel.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}

class ProductLocationModel{
  String ProductID;
  LatitudeLongitudeModel coords;

   ProductLocationModel({
    required this.coords,
    required this.ProductID,
  });

  static  ProductLocationModel fromJson(Map<String, dynamic> json) {
    return  ProductLocationModel(
        coords: LatitudeLongitudeModel.fromJson(json['coords'] as Map<String, dynamic>),
        ProductID: json['ProductID'],
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