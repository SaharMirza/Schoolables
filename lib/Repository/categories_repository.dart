import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterdemo/models/category_model.dart';
// import 'package:practice/Models/category_model.dart';

abstract class CategoriesRepository {
  Future<List<CategoryModel>> fetchCategoriesList();
}

class FirebaseCategoriesRepository implements CategoriesRepository {
  final db = FirebaseFirestore.instance;

  @override
  Future<List<CategoryModel>> fetchCategoriesList() async {
    List<CategoryModel> categories = [];
    await db.collection("categories").get().then((event) {
      categories = event.docs.map((e) => CategoryModel.fromJson(e.data(), e.id)).toList();
    });

    return categories;
  }
}