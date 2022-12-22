import '../../../imports.dart';

class ProductCard extends StatefulWidget {
  ProductCard({
    Key? key,
    required this.pid,
    required this.name,
    required this.price,
    required this.image,
    required this.isFav,
  }) : super(key: key);

  final String name;
  final String pid;
  final String price;
  final String image;
  bool isFav;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final products = context.watch<ProductsProvider>().products;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    void addFav(id) {
      // Add to users wishlist list
      context.read<UserProvider>().addFavItem(id);
    }

    void removeFav(id) {
      // // Remove from users wishlist list
      context.read<UserProvider>().removeFavItem(id);
    }

    getProduct(pID) {
      for (int i = 0; i < products.length; i++) {
        if (products[i].id == pID) return products[i];
      }
    }

    print(widget.image);

    return InkWell(
      onTap: (() async {
        ProductModel? product = getProduct(widget.pid);
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetail(
              product: product,
            ),
          ),
        );
      }),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: screenHeight * 0.23,
                    width: screenWidth,
                    color: const Color.fromARGB(255, 179, 150, 180),
                    child: widget.image.isEmpty
                        ? Image.network(
                            'https://static.thenounproject.com/png/3674270-200.png')
                        : Image.network(
                            widget.image,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return const Icon(Icons.image_not_supported);
                            },
                          ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // FavouriteWidget(
                      //   isFav: widget.isFav,
                      //   onTap: () {
                      //     widget.isFav = !widget.isFav;
                      //     setState(() {});
                      //     widget.isFav
                      //         ? addFav(widget.pid)
                      //         : removeFav(widget.pid);
                      //     setState(() {});
                      //   },
                      // ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.name,style: MyStyles.googleSecondTitleText(14),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Rs. ${widget.price}"),
                              FavouriteWidget(
                          isFav: widget.isFav,
                          onTap: () {
                            widget.isFav = !widget.isFav;
                            setState(() {});
                            widget.isFav
                                ? addFav(widget.pid)
                                : removeFav(widget.pid);
                            setState(() {});
                          },
                        ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FavouriteWidget extends StatelessWidget {
  const FavouriteWidget({
    Key? key,
    required this.isFav,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;
  final bool isFav;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.favorite_rounded,
        color: isFav ? Color.fromARGB(255, 202, 14, 1) : Color.fromARGB(255, 197, 194, 194),
      ),
    );
  }
}
