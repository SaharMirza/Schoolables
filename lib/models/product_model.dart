// Item Model Class
// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:schoolablesmodel/Models/bidding_model.dart';

class ProductModel {
  final String sellerID;
  final String title;
  final String category;
  final List<String> condition;
  final int price;
  final List<String> images;
  final List<BiddingModel> biding;
  
  
  ProductModel({
    required this.sellerID,
    required  this.biding,
    required this.title,
    required this.price,
    required this.images,
    required this.category,
    this.condition = const ['1', '2', '3', '4','5','6','7','8','9','10'],
  });

  static fromJson(Map<String, dynamic> json) {
    // Convert List<dynamic> to List<String> for colors
    List<String> conditionList = ['not selected'];
    List<String> imageList = [];

    if (json['conditions'] != null) {
      var conditions = json['conditions'] as List<dynamic>;
      for (var id in conditions) conditionList.add(id.toString().trim());
      }

    if (json['images'] != null) {
      var images = json['images'] as List<dynamic>;
      for (var id in images) imageList.add(id.toString().trim());
    }
    return ProductModel(
      title: json['title'],
      price: json['price'] ?? 0,
      images: imageList,
      category: json['category'],
      condition: conditionList,  
      sellerID: json['sellerID'] ?? "404",
      biding:json["biding"]

    );
  }

  toJson() {
    return {
      'title': title,
      'price': price,
      'image': images,
      'category': category,
      'condition': condition,
      'sellerID': sellerID,
      "biding":biding
    };
  }
}