class ParentProfileModel {
  final String email;
  final String name;
  final String phone;
  final List<String> products;
  final List<String> orderSeller;

  ParentProfileModel({
    required this.email,
    required this.phone,
    required this.name,
    required this.orderSeller,
    required this.products,
  });

  static fromJson(Map<String, dynamic> json) {
    var firebaseData = [];

    // Convert List<dynamic> to List<String> for products
    firebaseData = json['productIDs'] ?? [];
    List<String> productIDs = [];
    for (var id in firebaseData) productIDs.add(id.toString().trim());

    // Convert List<dynamic> to List<String> for sellerBuyerIDs
    firebaseData = json['sellerBuyerIDs'] ?? [];
    List<String> orderSellerIDs = [];
    for (var id in firebaseData) orderSellerIDs.add(id.toString().trim());

    return ParentProfileModel(
      phone: json['phone'],
      email: json['email'],
      name: json['name'],
      orderSeller: orderSellerIDs,
      products: productIDs,
    );
  }

  toJson() {
    return {
      'email': email,
      'phone': phone,
      'name': name,
      'orderSellerIDs': orderSeller,
      'productIDs': products,
    };
  }
}
