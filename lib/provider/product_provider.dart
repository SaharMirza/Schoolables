import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterdemo/Entities/products_entity.dart';
import 'package:flutterdemo/Repository/products_repository.dart';
import 'package:flutterdemo/models/product_model.dart';
// import 'package:practice/Models/product_model.dart';
// import 'package:practice/Repository/products_repository.dart';

class ProductsProvider with ChangeNotifier {
  //CategoriesProvider(this._categoriesRepository);

  List<ProductModel> products = [];
  List<Product> userProducts = [];
  Product product = Product(
      sellerID: "",
      title: "",
      price: 0,
      images: [],
      category: "",
      subCategory: "",
      condition: "");
  String psellerID = "";

  final ProductsRepository _productsRepository = FirebaseProductsRepository();

  bool isProductsFetching = false;
  bool isProductFetching = false;

  Future<Product> getProductByID(id) async {
    var doc =
        await FirebaseFirestore.instance.collection("products").doc(id).get();
    ProductModel productModel =
        ProductModel.fromJson(doc.data() as Map<String, dynamic>, doc.id);

    Product product = Product(
        sellerID: productModel.sellerID,
        title: productModel.title,
        price: productModel.price,
        images: productModel.images,
        category: productModel.category,
        subCategory: productModel.subCategory,
        condition: productModel.condition);
    return product;
    // psellerID = productModel.sellerID;
    // return psellerID;
  }

  void loadUserProducts(List<String> products) async {
    isProductFetching = true;
    notifyListeners();
    userProducts = [];
    for (var id in products) {
      print("productID" + id);
      if (id == "") continue;
      Product product = await _productsRepository.getProduct(id);
      product.id = id;
      userProducts.add(product);
    }
    isProductFetching = false;
    notifyListeners();
  }

  void fetchProducts() async {
    isProductsFetching = true;
    notifyListeners();
    products = await _productsRepository.fetchProductsList();
    isProductsFetching = false;
    notifyListeners();
  }

  Future<String> addProduct(Product product) async {
    String productid = await _productsRepository.addProduct(product);
    product.id = productid;
    userProducts.add(product);
    notifyListeners();
    return productid;
  }
}
