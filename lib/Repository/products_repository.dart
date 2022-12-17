import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutterdemo/Entities/products_entity.dart';
import 'package:flutterdemo/models/product_model.dart';
// import 'package:practice/Models/category_model.dart';
// import 'package:practice/Models/product_model.dart';

abstract class ProductsRepository {
  Future<List<ProductModel>> fetchProductsList();
  addProduct(Product product);
  // addProduct(String sellerID, String title, int price, List images,
  //     String category, String subCategory, String condition);

  getProduct(String id);

  Future<List<String>> getDownloadUrls(List<File> finalImages);
}

class FirebaseProductsRepository implements ProductsRepository {
  final db = FirebaseFirestore.instance;
  final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<List<String>> getDownloadUrls(List<File> finalImages) async {
    final List<String> downloadUrls = [];
    print(finalImages.length);
    try {
      for (File i in finalImages) {
        final folderRef = storageRef.child("images/${i.path}");
        final uploadTask = await folderRef.putFile(i);
        downloadUrls.add(await folderRef.getDownloadURL());
      }
    } on FirebaseException catch (e) {
      print(e);
    }

    print(downloadUrls);

    return downloadUrls;
  }

  @override
  Future<Product> getProduct(String id) async {
    var doc = await db.collection("products").doc(id).get();
    ProductModel productModel =
        ProductModel.fromJson(doc.data() as Map<String, dynamic>, doc.id);
    print(productModel.toJson());
    Product product = Product(
        sellerID: productModel.sellerID,
        title: productModel.title,
        price: productModel.price,
        images: productModel.images,
        category: productModel.category,
        subCategory: productModel.subCategory,
        condition: productModel.condition);
    return product;
  }

  @override
  Future<List<ProductModel>> fetchProductsList() async {
    List<ProductModel> products = [];
    await db.collection("products").get().then((event) {
      products =
          event.docs.map((e) => ProductModel.fromJson(e.data(), e.id)).toList();
    });
    return products;
  }

  // @override
  // Future<String> addProduct(
  //     String sellerID,
  //     String title,
  //     int price,
  //     List images,
  //     String category,
  //     String subCategory,
  //     String condition) async {
  //   print("!!!!!!!!!!!!!!!!!!!!!!! "+images[0]);
  //   var newRef = await db.collection("products").add(
  //         ProductModel(
  //                 id: "",
  //                 sellerID: sellerID,
  //                 title: title,
  //                 price: price,
  //                 images: images,
  //                 category: category,
  //                 subCategory: subCategory,
  //                 condition: condition)
  //             .toJson(),
  //       );
  //   // product.id = newRef.id;

  //   return newRef.id;
  // }

  @override
  Future<String> addProduct(Product product) async {
    var newRef = await db.collection("products").add(
          ProductModel(
                  id: "",
                  sellerID: product.sellerID,
                  title: product.title,
                  price: product.price,
                  images: product.images,
                  category: product.category,
                  subCategory: product.subCategory,
                  condition: product.condition)
              .toJson(),
        );
    // product.id = newRef.id;

    return newRef.id;
  }

  // //add product
  // @override
  // addProduct(String title, String sellerID, List<String> images,
  //     String category, String subCategory, String condition, int price) async {
  //   final data = ProductModel(
  //           sellerID: sellerID,
  //           title: title,
  //           price: price,
  //           images: images,
  //           category: category,
  //           subCategory: subCategory,
  //           condition: condition,
  //           id: '')
  //       .toJson();
  //   await db
  //       .collection("products")
  //       .add(data)
  //       .then(
  //         (_) => print('Added'),
  //       )
  //       .catchError(
  //         (error) => print('Add failed: $error'),
  //       );
  // }
}
