class StudentUserProfileModel {
  final String email;
  final String name;
  final String phone;
  final String schoolName;
  final String grade;
  final String display;
  final String dob;//what willbe the data type of date
  final List<String> products;
  List<String> orderSeller = [];
  List<String> orderBuyer = [];
  final List<String> wishListIDs; 
   String rating="0";

  StudentUserProfileModel({
    required this.dob,
    required this.email,
    required this.name,
    required this.phone,
    required this.display,
    required this.schoolName,
    required this.grade,
    required this.orderBuyer,
    required this.orderSeller,
    required this.products,
    required this.wishListIDs,
    required this.rating
  });

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


    return StudentUserProfileModel(
      dob: json['dob'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      schoolName: json['schoolName'],
      grade: json['grade'],
      display: json['display'],
      orderBuyer: orderBuyerIDs,
      orderSeller: orderSellerIDs,
      products: productIDs,
      wishListIDs: favIDs,
      rating: json['rating']
    );
  }

  toJson() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'schoolName': schoolName,
      'grade': grade,
      'display': display,
      'orderBuyerIDs': orderBuyer,
      'orderSellerIDs': orderSeller,
      'wishlistIDs': wishListIDs,
      'productIDs': products,
      'dob':dob,
      'rating':rating
    };
  }
}
