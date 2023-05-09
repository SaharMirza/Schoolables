class Location{
  String areaName;
  LatitudeLongitude areaLocation;
  List<Area> areas;

  Location({
    required this.areaName,
    required this.areaLocation,
    required this.areas
  });
}

class Area{
  //String address;
  //List<String> id;
  String id;
  String name;
  //String phone;
  LatitudeLongitude coords;

  Area({
    required this.coords,
    //required this.address,
    required this.id,
    required this.name,
    //required this.phone,
  });

}

class LatitudeLongitude{
  double lat;
  double lng;

  LatitudeLongitude({
    required this.lat,
    required this.lng,
  });
}
