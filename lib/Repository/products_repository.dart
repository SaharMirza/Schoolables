import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterdemo/models/product_model.dart';
// import 'package:practice/Models/category_model.dart';
// import 'package:practice/Models/product_model.dart';

abstract class ProductsRepository {
  Future<List<ProductModel>> fetchProductsList();
  addProduct(
      String title,
      String sellerID,
      List<String> images,
      List<String> bidingID,
      String category,
      String subCategory,
      String condition,
      int price);
}

class FirebaseProductsRepository implements ProductsRepository {
  final db = FirebaseFirestore.instance;

  @override
  Future<List<ProductModel>> fetchProductsList() async {
    List<ProductModel> products = [];
    await db.collection("products").get().then((event) {
      products =
          event.docs.map((e) => ProductModel.fromJson(e.data(), e.id)).toList();
    });
    return products;
  }

  //add product
  @override
  addProduct(
      String title,
      String sellerID,
      List<String> images,
      List<String> bidingID,
      String category,
      String subCategory,
      String condition,
      int price) async{
    final data = ProductModel(
            sellerID: sellerID,
            bidingID: bidingID,
            title: title,
            price: price,
            images: images,
            category: category,
            subCategory: subCategory,
            condition: condition, id: '')
        .toJson();
  await db
        .collection("products")
        .add(data)
        .then(
          (_) => print('Added'),
        )
        .catchError(
          (error) => print('Add failed: $error'),
        );
  }
}
