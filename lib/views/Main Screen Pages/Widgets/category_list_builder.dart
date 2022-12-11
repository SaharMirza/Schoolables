import 'package:flutter/material.dart';
import 'package:flutterdemo/models/product_model.dart';
import 'package:flutterdemo/provider/categories_provider.dart';
import 'package:flutterdemo/provider/product_provider.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/productsPage.dart';
import 'package:provider/provider.dart';

class CatergoryListBuilder extends StatefulWidget {
  const CatergoryListBuilder({
    Key? key,
  }) : super(key: key);

  @override
  State<CatergoryListBuilder> createState() => _CatergoryListBuilderState();
}

class _CatergoryListBuilderState extends State<CatergoryListBuilder> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<CategoriesProvider>().fetchCategories();
      // context.read<ProductsProvider>().fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final categories = context.watch<CategoriesProvider>().categories;
    final product = context.read<ProductsProvider>().products;
    List<ProductModel> booksList = [];
    List<ProductModel> bagsList = [];
    List<ProductModel> stationaryList = [];

    for (int i = 0; i < product.length; i++) {
      //if product cat name = books
      if (product[i].category == "Books") {
        booksList.add(product[i]);
      }
      //if product cat name = bags
      else if (product[i].category == "bags") {
        bagsList.add(product[i]);
      }
      //if product cat name = stationary
      else if (product[i].category == "Stationary") {
        stationaryList.add(product[i]);
      } else {
        print("product is in none of the categories");
      }
    }

    List<Categories> Category = [
      Categories(name: "Books", image: "assets/images/book.gif"),
      Categories(name: "Stationary", image: "assets/images/stationary.gif"),
      Categories(name: "bags", image: "assets/images/bag.gif"),
    ];

    void booklist(index) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductsPage(
                  title: Category[index].name,
                  products: booksList,
                )),
      );
    }

    void stationary(index) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductsPage(
                  title: Category[index].name,
                  products: stationaryList,
                )),
      );
    }

    void bags(index) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductsPage(
                  title: Category[index].name,
                  products: bagsList,
                )),
      );
    }

    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: categories[index].parentID == "0"
                  ? ElevatedButton(
                      onPressed: () {
                        if (categories[index].catName == "Books") {
                          if (product.isNotEmpty) {
                            booklist(index);
                          } else
                            print("wait");
                        }
                        if (categories[index].catName == "Stationary") {
                          if (product.isNotEmpty) {
                            stationary(index);
                          } else
                            print("wait");
                        }
                        if (categories[index].catName == "bags") {
                          if (product.isNotEmpty) {
                            bags(index);
                          } else
                            print("wait");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 8,
                        backgroundColor: Colors.white,
                        textStyle: const TextStyle(
                          fontSize: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.network(
                            Category[index].image,
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.1,
                          ),
                          Text(categories[index].catName),
                        ],
                      ),
                    )
                  : null);
        });
  }
}

class Categories {
  final String name;
  final String image;

  Categories({
    required this.name,
    required this.image,
  });
}

class Product {
  final String name;
  final String image;
  final String price;
  bool isFav;

  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.isFav,
  });
}
