import 'package:flutter/cupertino.dart';
import 'package:flutterdemo/Repository/products_repository.dart';
import 'package:flutterdemo/models/product_model.dart';
// import 'package:practice/Models/product_model.dart';
// import 'package:practice/Repository/products_repository.dart';

class ProductsProvider with ChangeNotifier {
  //CategoriesProvider(this._categoriesRepository);

  List<ProductModel> products = [];

  final ProductsRepository _productsRepository = FirebaseProductsRepository();

// ProductModel get ProductModel => products;
  bool isProductsFetching = false;

  void fetchProducts() async {
    isProductsFetching = true;
    notifyListeners();
    products = await _productsRepository.fetchProductsList();
    isProductsFetching = false;
    notifyListeners();
  }

  void addProduct(
      String title,
      String sellerID,
      List<String> images,
      // List<String> bidingID,
      String category,
      String subCategory,
      String condition,
      int price) async {
    await _productsRepository.addProduct(title, sellerID, images, 
        category, subCategory, condition, price);
  }
}
