import 'package:flutter/cupertino.dart';
import 'package:flutterdemo/Repository/categories_repository.dart';
import 'package:flutterdemo/models/category_model.dart';

class CategoriesProvider with ChangeNotifier {
  //CategoriesProvider(this._categoriesRepository);

  List<CategoryModel> categories = [];

  final CategoriesRepository _categoriesRepository=FirebaseCategoriesRepository();

  bool isCategoriesFetching = false;

  void fetchCategories() async {
    isCategoriesFetching = true;
    notifyListeners();
    categories = await _categoriesRepository.fetchCategoriesList();
    isCategoriesFetching = false;
    notifyListeners();
  }
}
