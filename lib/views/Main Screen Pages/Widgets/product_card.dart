import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  ProductCard({
    Key? key,
    required this.name,
    required this.price,
    required this.image,
    required this.isFav,
  }) : super(key: key);

  final String name;
  final String price;
  final String image;
  bool isFav;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool myFav = false;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FavouriteWidget(
                  isFav: myFav,
                  onTap: () {
                    myFav = !myFav;
                    setState(() {});
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.02, top: 2.0),
              child: Container(
                height: screenHeight * 0.17,
                width: screenWidth * 0.35,
                color: Colors.grey,
                child: Image.asset(widget.image),
              ),
            ),
            Row(
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
          ],
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
        color: isFav ? Colors.red : Colors.grey,
      ),
    );
  }
}
