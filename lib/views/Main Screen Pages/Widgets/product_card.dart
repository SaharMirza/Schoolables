import 'package:flutter/material.dart';
import 'package:flutterdemo/provider/student_provider.dart';
import 'package:provider/provider.dart';
import '../Product Pages/product_detail.dart';

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

    return InkWell(
      onTap: (() async {
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetail(pid: widget.pid,),
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
                    color: Color.fromARGB(255, 179, 150, 180),
                    child: widget.image.isEmpty
                        ? Image.asset('assets/images/math.png')
                        : Image.asset(widget.image),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.name),
                        Text(widget.price),
                      ],
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
        Icons.favorite,
        color: isFav ? Colors.red : Colors.white,
      ),
    );
  }
}
