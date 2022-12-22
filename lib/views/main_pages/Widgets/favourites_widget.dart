
import '../../../imports.dart';

class favouritesCard extends StatefulWidget {
  favouritesCard({
    super.key,
    required this.id,
    required this.name,
    required this.price,
    required this.condition,
    required this.img,
    required this.sellerIMG,
    required this.sellerName,
    required this.sellerNum,
    required this.isFav,
  });
  final String id;
  final String name;
  final String price;
  final String condition;
  final String img;
  bool isFav;
  final String sellerIMG;
  final String sellerName;
  final String sellerNum;
  @override
  State<favouritesCard> createState() => _favouritesCardState();
}

class _favouritesCardState extends State<favouritesCard> {
  @override
  Widget build(BuildContext context) {
    void addFav(id) {
      // Add to users wishlist list
      context.read<UserProvider>().addFavItem(id);
    }

    void removeFav(id) {
      // // Remove from users wishlist list
      context.read<UserProvider>().removeFavItem(id);
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 150,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: MyColors.startColor,
              blurRadius: 20.0,
              spreadRadius: 0,
              offset: Offset(
                10, // Move to right 10  horizontally
                8.0, // Move to bottom 10 Vertically
              ),
            ),
          ],
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: 800,
              child: Row(children: [
                productImage(),
                productDetails(addFav, removeFav),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget productDetails(void Function(dynamic id) addFav, void Function(dynamic id) removeFav) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.name,
                  style: GoogleFonts.poppins(
                    color: MyColors.textColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                  // screenWidth * 0.025 - screenHeight * 0.025),
                ),
              ),
              FavouriteWidget(
                isFav: widget.isFav,
                onTap: () {
                  widget.isFav = !widget.isFav;
                  setState(() {});
                  widget.isFav ? addFav(widget.id) : removeFav(widget.id);
                  setState(() {});
                },
              ),
            ],
          ),
          Text("Rs ${widget.price}",
              style: MyStyles.googleTextSubtitleListTile(12)),
          Text(
            "Book Condition : ${widget.condition}/10",
            style: MyStyles.googleTextSubtitleListTile(12),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: (20),
                    backgroundColor: Colors.white,
                    backgroundImage: widget.sellerIMG.isEmpty
                        ? const NetworkImage(
                            "https://static.thenounproject.com/png/3674270-200.png")
                        : NetworkImage(widget.sellerIMG),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.sellerName,
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        widget.sellerNum,
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget productImage() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: widget.img.isEmpty
                  ? const NetworkImage(
                      "https://static.thenounproject.com/png/3674270-200.png")
                  : NetworkImage(widget.img),
            )),
        width: 90,
        height: 90,
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
