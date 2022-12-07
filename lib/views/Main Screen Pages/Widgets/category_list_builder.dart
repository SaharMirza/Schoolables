import 'package:flutter/material.dart';
import 'package:flutterdemo/provider/categories_provider.dart';
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
    });
  }
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final catgeories = context.watch<CategoriesProvider>().categories;

    List<Categories> Category = [
      Categories(name: "Books", image: "assets/images/book.gif"),
      Categories(name: "Stationary", image: "assets/images/stationary.gif"),
      Categories(name: "Bags", image: "assets/images/bag.gif"),
    ];

    List<Product> products = [
      Product(name: "O'Levels Math", image: "", price: "500", isFav: false),
      Product(name: "O'Levels Science", image: "", price: "500", isFav: false),
      Product(name: "O'Levels English", image: "", price: "500", isFav: false),
      Product(name: "O'Levels ", image: "", price: "500", isFav: false),
      Product(name: "O'Levels Physics", image: "", price: "500", isFav: false),
      Product(
          name: "O'Levels Chemistry", image: "", price: "500", isFav: false),
      Product(name: "O'Levels Bio", image: "", price: "500", isFav: false),
      Product(name: "O'Levels Eco", image: "", price: "500", isFav: false),
      Product(name: "O'Levels Computer", image: "", price: "500", isFav: false),
    ];

    void booklist(index) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductsPage(
                  title: Category[index].name,
                  products: products,
                )),
      );
    }

    void stationary(index) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductsPage(
                  title: Category[index].name,
                  products: products,
                )),
      );
    }

    void bags(index) {
      //book api call save in list
      //passlist to other page
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductsPage(
                  title: Category[index].name,
                  products: products,
                )),
      );
    }

    return context.watch<CategoriesProvider>().isCategoriesFetching
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: catgeories.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (catgeories[index].catName == "Books") {
                      booklist(index);
                    }
                    if (catgeories[index].catName == "Stationary") {
                      stationary(index);
                    }
                    if (catgeories[index].catName == "Bags") {
                      bags(index);
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
                      Text(catgeories[index].catName),
                    ],
                  ),
                ),
              );
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
