import 'dart:io';
import "../imports.dart";
// import 'package:practice/Models/product_model.dart';
// import 'package:practice/Repository/products_repository.dart';

class ProductsProvider with ChangeNotifier {
  //CategoriesProvider(this._categoriesRepository);

  List<ProductModel> products = [];
  List<Product> userProducts = [];
  List<Product> nearbyProducts = [];
  String psellerID = "";
  List<String> downloadUrls = [];

  final ProductsRepository _productsRepository = FirebaseProductsRepository();

  bool isProductsFetching = false;
  bool isProductFetching = false;
  bool isAddingProduct =false;

  void loadNearbyProducts(List<String> products) async {
    isProductFetching = true;
    notifyListeners();
    nearbyProducts = [];
    for (var id in products) {
      print("productID$id");
      if (id == "") continue;
      Product product = await _productsRepository.getProduct(id);
      product.id = id;
      nearbyProducts.add(product);
    }
    isProductFetching = false;
    notifyListeners();
  }

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
  }

  void loadUserProducts(List<String> products) async {
    isProductFetching = true;
    notifyListeners();
    userProducts = [];
    for (var id in products) {
      print("productID$id");
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

  Future<List<String>> getDownloadUrls(List<File> finalImages) async {
    downloadUrls = await _productsRepository.getDownloadUrls(finalImages);
    return downloadUrls;
  }

  Future<String> addProduct(Product product) async {
    isAddingProduct =true;
    String productid = await _productsRepository.addProduct(product);
    product.id = productid;
    userProducts.add(product);
    notifyListeners();
    isAddingProduct=false;
    return productid;
  }

  Future<void> updateProduct(Product product) async {
    await _productsRepository.updateProduct(product);
    fetchProducts();
  }
}
