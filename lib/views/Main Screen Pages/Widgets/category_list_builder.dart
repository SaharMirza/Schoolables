import 'package:flutter/material.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/productsPage.dart';

class CatergoryListBuilder extends StatelessWidget {
  const CatergoryListBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

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
      Product(name: "O'Levels Chemistry", image: "", price: "500", isFav: false),
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

    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: Category.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                if (Category[index].name == "Books") {
                  booklist(index);
                }
                if (Category[index].name == "Stationary") {
                  stationary(index);
                }
                if (Category[index].name == "Bags") {
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
                  Image.asset(
                    Category[index].image,
                    height: screenHeight * 0.2,
                    width: screenWidth * 0.1,
                  ),
                  Text(Category[index].name),
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
