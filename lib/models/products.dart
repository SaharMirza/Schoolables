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

 List<Product> products = [
    Product(name: "O'Levels Math", image: "assets/images/math.png", price: "500", isFav: false),
    Product(name: "O'Levels Science", image: "assets/images/science.jpg", price: "500", isFav: false),
    Product(name: "O'Levels English", image: "assets/images/english.png", price: "500", isFav: false),
    Product(name: "O'Levels ", image: "assets/images/maths.jpg", price: "500", isFav: false),
    Product(name: "O'Levels Physics", image: "assets/images/physics.png", price: "500", isFav: false),
    Product(name: "O'Levels Chemistry", image: "assets/images/science.png", price: "500", isFav: false),
    Product(name: "O'Levels Bio", image: "assets/images/bio.png", price: "500", isFav: false),
    Product(name: "O'Levels Eco", image: "assets/images/karwaneurdu.webp", price: "500", isFav: false),
    Product(name: "O'Levels Computer", image: "assets/images/karwaneurdu.webp", price: "500", isFav: false),
  ];