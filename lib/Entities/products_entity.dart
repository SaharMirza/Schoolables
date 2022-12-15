class Product {
  Product({
    required this.sellerID,
    // required this.bidingID,
    required this.title,
    required this.price,
    required this.images,
    required this.category,
    required this.subCategory,
    required this.condition,
  });

  String sellerID;
  String title;
  String category;
  String subCategory;
  String condition;
  int price;
  List<String> images;
  // final List<String> bidingID;

  late final String id;
}
