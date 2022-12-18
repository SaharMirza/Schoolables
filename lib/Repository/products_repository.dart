import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutterdemo/Entities/products_entity.dart';
import 'package:flutterdemo/models/product_model.dart';

abstract class ProductsRepository {
  Future<List<ProductModel>> fetchProductsList();

  addProduct(Product product);

  getProduct(String id);

  Future<void> updateProduct(Product product);

  Future<List<String>> getDownloadUrls(List<File> finalImages);
  Future<List<ProductModel>> fetchScannedProducts(List<String> scannedList);
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
    await db.collection("products").get().then(
      (event) {
        products = event.docs
            .map((e) => ProductModel.fromJson(e.data(), e.id))
            .toList();
      },
    );
    return products;
  }

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
  Future<void> updateProduct(Product product) async {
    print("save changes repo");
    await db.collection('products').doc(product.id).update({
      "category": product.category,
      "condition": product.condition,
      "images": product.images,
      "price": product.price,
      "sellerID": product.sellerID,
      "subCategory": product.subCategory,
      "title": product.title
    }).then((value) {
      print("Product updated");
    }).catchError((error) => print("Failed to updated Task: $error"));
  }

// Fetches the products from firebase according to user scanned list.
  @override
  Future<List<ProductModel>> fetchScannedProducts(
      List<String> scannedList) async {
    List<ProductModel> scannedProducts = [];

    for (String i in scannedList) {
      await db.collection("products").where('title', isEqualTo: i).get().then(
        (event) {
          scannedProducts = event.docs
              .map((e) => ProductModel.fromJson(e.data(), e.id))
              .toList();
        },
      );
    }
    return scannedProducts;
  }


}
