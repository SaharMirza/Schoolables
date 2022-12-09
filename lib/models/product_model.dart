// import 'package:practice/Models/bidding_model.dart';

class ProductModel {
  final String sellerID;
  final String title;
  final String category;
  final String subCategory;
  final String condition;
  final int price;
  final List<String> images;
  final List<String> bidingID;
  final String id;

  ProductModel({
    required this.id,
    required this.sellerID,
    required this.bidingID,
    required this.title,
    required this.price,
    required this.images,
    required this.category,
    required this.subCategory,
    required this.condition,
  });

  static ProductModel fromJson(Map<String, dynamic> json, String id) {
    // Convert List<dynamic> to List<String> for colors
    // List<String> conditionList = ['not selected'];
    List<String> imageList = [];
    List<String> bidingList = [];

    // if (json['conditions'] != null) {
    //   var conditions = json['conditions'] as List<dynamic>;
    //   for (var id in conditions) conditionList.add(id.toString().trim());
    // }

    if (json['images'] != null) {
      var images = json['images'] as List<dynamic>;
      for (var id in images) imageList.add(id.toString().trim());
    }
    if (json['bidding'] != null) {
      var biding = json['bidding'] as List<dynamic>;
      for (var id in biding) bidingList.add(id.toString().trim());
    }
    return ProductModel(
        title: json['title'],
        price: json['price'] ?? 0,
        images: imageList,
        category: json['category'],
        subCategory: json['subCategory'],
        condition: json['condition'],
        sellerID: json['sellerID'] ?? "404",
        bidingID:bidingList,
        id:id
        );
  }

  toJson() {
    return {
      'title': title,
      'price': price,
      'images': images,
      'category': category,
      'condition': condition,
      'sellerID': sellerID,
      'subCategory':subCategory,
      "bidding": bidingID
    };
  }
}
