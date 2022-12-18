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
  Future<List<ProductModel>> fetchProductsByName(String result);
  void saveScanList(List<String> result, String schoolName);
}

class FirebaseScannedListRepository implements ScannedListRepository {
  final db = FirebaseFirestore.instance;

// fetches scanlist on scan history page according to current user logged in's school.
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

    return scannedLists;
  }

// fetches products from database according to scanlist items
  @override
  Future<List<ProductModel>> fetchProductsByName(String result) async {
    List<ProductModel> scannedProducts = [];
    ProductModel productModel;
    var doc = await db
        .collection("products")
        .where("title", isEqualTo: result)
        .get()
        .then(
      (event) {
        scannedProducts = event.docs
            .map((e) => ProductModel.fromJson(e.data(), e.id))
            .toList();
      },
    );
    print(scannedProducts);
    return scannedProducts;
  }

// saves the scan list array into scannedlist db according to school name
  @override
  void saveScanList(List<String> result, String schoolName) async {
    List<ScannedList> scanlist = [];

    var doc = await db
        .collection("scannedlist")
        .where("school_name", isEqualTo: schoolName)
        .get()
        .then((value) {
      scanlist =
          value.docs.map((e) => ScannedList.fromJson(e.data(), e.id)).toList();
    });

    await db
        .collection("scannedlist")
        .doc(scanlist[0].id)
        .update({"scannedItems": result}).then((value) => print("Bid Updated"));
  }
}
