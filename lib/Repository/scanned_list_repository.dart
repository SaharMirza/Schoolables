import 'package:flutter/material.dart';
import 'package:flutterdemo/models/scanned_List.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

import '../Entities/products_entity.dart';
import '../models/product_model.dart';
import '../provider/student_provider.dart';

abstract class ScannedListRepository {
  Future<List<ScannedList>> fetchScannedListAccordingToSchoolName(
      String schoolName);
  Future<List<ProductModel>> fetchScannedProducts(List<String> result);
}

class FirebaseScannedListRepository implements ScannedListRepository {
  final db = FirebaseFirestore.instance;

  @override
  Future<List<ScannedList>> fetchScannedListAccordingToSchoolName(
      String schoolName) async {
    List<ScannedList> scannedLists = [];

    await db
        .collection("scannedlist")
        .where("school_name", isEqualTo: schoolName)
        .get()
        .then(
      (event) {
        scannedLists = event.docs
            .map((e) => ScannedList.fromJson(e.data(), e.id))
            .toList();
      },
    );

    print("books fetched" + scannedLists.toString());
    return scannedLists;
  }

  @override
  Future<List<ProductModel>> fetchScannedProducts(List<String> result) async {
    List<ProductModel> scannedProducts = [];

    for (String i in result) {
      ProductModel productModel;
      var doc = await db
          .collection("products")
          .where("title", isEqualTo: i)
          .get()
          .then(
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
