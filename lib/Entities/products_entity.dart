class Product {
  Product({
    required this.sellerID,
    required this.title,
    required this.price,
    required this.images,
    required this.category,
    required this.subCategory,
    required this.condition,
    id
  });

  String sellerID;
  String title;
  String category;
  String subCategory;
  String condition;
  int price;
  List images;

  late String id;
}
