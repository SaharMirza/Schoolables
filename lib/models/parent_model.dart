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
    firebaseData = json['products'] ?? [];
    List<String> products = [];
    for (var id in firebaseData) products.add(id.toString().trim());

    // Convert List<dynamic> to List<String> for sellerBuyerIDs
    firebaseData = json['sellerBuyerIDs'] ?? [];
    List<String> orderSeller = [];
    for (var id in firebaseData) orderSeller.add(id.toString().trim());

    return ParentProfileModel(
      phone: json['phone'],
      email: json['email'],
      name: json['name'],
      orderSeller: orderSeller,
      products: products,
    );
  }

  toJson() {
    return {
      'email': email,
      'phone': phone,
      'name': name,
      'orderSeller': orderSeller,
      'products': products,
    };
  }
}
