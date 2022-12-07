// Model for Firebase
// ignore_for_file: curly_braces_in_flow_control_structures

class UserProfileModel {
  final String email;
  final String name;
  final String schoolName;
  final String grade;
  final String display;
  final String phone;
  final String dob; //what willbe the data type of date
  final List<String> products;
  final List<String> orderSeller;
  final List<String> orderBuyer;
  final List<String> wishListIDs;
  String rating = "0";

  UserProfileModel(
      {required this.email,
      required this.phone,
      required this.name,
      required this.display,
      required this.schoolName,
      required this.grade,
      required this.dob,
      required this.orderBuyer,
      required this.orderSeller,
      required this.products,
      required this.wishListIDs,
      required this.rating});

  static fromJson(Map<String, dynamic> json) {
    var firebaseData = [];

    // Convert List<dynamic> to List<String> for products
    firebaseData = json['productIDs'] ?? [];
    List<String> productIDs = [];
    for (var id in firebaseData) productIDs.add(id.toString().trim());

    // Convert List<dynamic> to List<String> for orderBuyerIDs
    firebaseData = json['orderBuyerIDs'] ?? [];
    List<String> orderBuyerIDs = [];
    for (var id in firebaseData) orderBuyerIDs.add(id.toString().trim());

    // Convert List<dynamic> to List<String> for sellerBuyerIDs
    firebaseData = json['sellerBuyerIDs'] ?? [];
    List<String> orderSellerIDs = [];
    for (var id in firebaseData) orderSellerIDs.add(id.toString().trim());

    // Convert List<dynamic> to List<String> for wishlist
    firebaseData = json['wishlistIDs'] ?? [];
    List<String> favIDs = [];
    for (var id in firebaseData) favIDs.add(id.toString().trim());

    return UserProfileModel(
        phone: json['phone'],
        email: json['email'],
        name: json['name'],
        schoolName: json['schoolName'],
        grade: json['grade'],
        display: json['display'],
        dob: json['dob'],
        orderBuyer: orderBuyerIDs,
        orderSeller: orderSellerIDs,
        products: productIDs,
        wishListIDs: favIDs,
        rating: json['rating']);
  }

  toJson() {
    return {
      'email': email,
      'phone': phone,
      'name': name,
      'schoolName': schoolName,
      'grade': grade,
      'display': display,
      'orderBuyerIDs': orderBuyer,
      'orderSellerIDs': orderSeller,
      'wishlistIDs': wishListIDs,
      'productIDs': products,
      'dob': dob,
      'rating': rating
    };
  }
}
