class Product {
  Product({
    required this.sellerID,
    required this.bidingID,
    required this.title,
    required this.price,
    required this.images,
    required this.category,
    required this.subCategory,
    required this.condition,
  });

  final String sellerID;
  final String title;
  final String category;
  final String subCategory;
  final String condition;
  final int price;
  final List<String> images;
  final List<String> bidingID;

  late final String id;
}
