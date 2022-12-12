class ChildProfileModel {
  final String name;
  final String schoolName;
  final String grade;
  final String display;
  final List<String> orderBuyer;
  final List<String> wishListIDs;
  final String parentID;

  ChildProfileModel({
    required this.name,
    required this.display,
    required this.schoolName,
    required this.grade,
    required this.orderBuyer,
    required this.wishListIDs,
    required this.parentID
  });

  static ChildProfileModel fromJson(Map<String, dynamic> json, String id) {
    var firebaseData = [];
    // Convert List<dynamic> to List<String> for orderBuyerIDs
    firebaseData = json['orderBuyerIDs'] ?? [];
    List<String> orderBuyerIDs = [];
    for (var id in firebaseData) orderBuyerIDs.add(id.toString().trim());

    // Convert List<dynamic> to List<String> for wishlist
    firebaseData = json['wishlistIDs'] ?? [];
    List<String> favIDs = [];
    for (var id in firebaseData) favIDs.add(id.toString().trim());

    return ChildProfileModel(
        name: json['name'],
        schoolName: json['schoolName'],
        grade: json['grade'],
        display: json['display'],
        orderBuyer: orderBuyerIDs,
        wishListIDs: favIDs,
         parentID: json['parentID']);
  }

  toJson() {
    return {
      'name': name,
      'schoolName': schoolName,
      'grade': grade,
      'display': display,
      'orderBuyer': orderBuyer,
      'wishlistIDs': wishListIDs,
      'parentID':parentID
    };
  }
}
