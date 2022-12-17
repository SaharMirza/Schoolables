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
  final  List<String> biddingIDs;
  final List<String> sellingbiddingIDs;
  String rating = "0";
    late final String id;

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
      required this.rating,
      required this.biddingIDs,
      required this.sellingbiddingIDs});

  static fromJson(Map<String, dynamic> json) {
    var firebaseData = [];

    // Convert List<dynamic> to List<String> for products
    firebaseData = json['products'] ?? [];
    List<String> products = [];
    for (var id in firebaseData) products.add(id.toString().trim());

    // Convert List<dynamic> to List<String> for orderBuyer
    firebaseData = json['orderBuyer'] ?? [];
    List<String> orderBuyer = [];
    for (var id in firebaseData) orderBuyer.add(id.toString().trim());

    // Convert List<dynamic> to List<String> for sellerBuyerIDs
    firebaseData = json['orderSeller'] ?? [];
    List<String> orderSeller = [];
    for (var id in firebaseData) orderSeller.add(id.toString().trim());

    // Convert List<dynamic> to List<String> for wishlist
    firebaseData = json['wishlistIDs'] ?? [];
    List<String> favIDs = [];
    for (var id in firebaseData) favIDs.add(id.toString().trim());

     // Convert List<dynamic> to List<String> for wishlist
    firebaseData = json['biddingIDs'] ?? [];
    List<String> bidIDs = [];
    for (var id in firebaseData) bidIDs.add(id.toString().trim());
    
     // Convert List<dynamic> to List<String> for wishlist
    firebaseData = json['sellingbiddingIDs'] ?? [];
    List<String> sellbidIDs = [];
    for (var id in firebaseData) sellbidIDs.add(id.toString().trim());

    return UserProfileModel(
        phone: json['phone'],
        email: json['email'],
        name: json['name'],
        schoolName: json['schoolName'],
        grade: json['grade'],
        display: json['display'],
        dob: json['dob'],
        orderBuyer: orderBuyer,
        orderSeller: orderSeller,
        products: products,
        wishListIDs: favIDs,
        biddingIDs: bidIDs,
        rating: json['rating'], 
        sellingbiddingIDs: sellbidIDs);
  }

  toJson() {
    return {
      'email': email,
      'phone': phone,
      'name': name,
      'schoolName': schoolName,
      'grade': grade,
      'display': display,
      'orderBuyer': orderBuyer,
      'orderSeller': orderSeller,
      'wishlistIDs': wishListIDs,
      "biddingIDs" : biddingIDs,
      'products': products,
      'dob': dob,
      'rating': rating,
      "sellingbiddingIDs":sellingbiddingIDs
    };
  }
}
