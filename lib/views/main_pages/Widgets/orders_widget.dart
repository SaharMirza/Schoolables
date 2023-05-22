
import 'package:carousel_slider/carousel_slider.dart';

import '../../../imports.dart';

class CustomProgressIndicator extends StatefulWidget {
  const CustomProgressIndicator({
    super.key,
    required this.sizeTween,
    required this.colorTween,
    required this.controller,
  });
  final Tween<double> sizeTween;
  final ColorTween colorTween;
  final AnimationController controller;

  @override
  State<CustomProgressIndicator> createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator>
    with SingleTickerProviderStateMixin {
  late Animation sizeAnimation;
  late Animation colorAnimation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    sizeAnimation = widget.sizeTween.animate(controller);
    colorAnimation = widget.colorTween.animate(
      CurvedAnimation(parent: controller, curve: Curves.bounceOut),
    );
    controller.addStatusListener((status) {
      print(status);
      if (status == AnimationStatus.completed) {
        controller.reverse();
      }
      if (status == AnimationStatus.dismissed) {
        controller.forward();
      }

      controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Column(
                  children: [
                    Container(
                      height: sizeAnimation.value,
                      width: sizeAnimation.value,
                      // margin: EdgeInsets.all(300.0),
                      decoration: BoxDecoration(
                          color: colorAnimation.value, shape: BoxShape.circle),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: 10,
              width: 50,
              decoration: const BoxDecoration(
                color: MyColors.textFieldColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                  color: MyColors.textFieldColor, shape: BoxShape.circle),
            ),
            Container(
              height: 10,
              width: 50,
              decoration: const BoxDecoration(
                color: MyColors.textFieldColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                  color: MyColors.textFieldColor, shape: BoxShape.circle),
            ),
          ],
        ),
      ),
    );
  }
}

//////////////////////////////////Buying Orders Widgets\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
class BuyingOrdersWidget extends StatefulWidget {
  const BuyingOrdersWidget({
    super.key,
    required this.product,
    required this.progresstype,
    required this.seller,
  });
  final ProductModel? product;
  final String progresstype;
  final UserProfileModel? seller;
  @override
  State<BuyingOrdersWidget> createState() => _BuyingOrdersWidget();
}

class _BuyingOrdersWidget extends State<BuyingOrdersWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: screenHeight * 0.2,
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
              width:screenHeight * 0.4,
              child: Row(children: [
                OrderCardImage(imageURL: widget.product!.images),
                OrderCardColumn2(
                  widget: widget,
                  screenWidth: screenWidth,
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class OrderCardColumn2 extends StatelessWidget {
  const OrderCardColumn2({
    Key? key,
    required this.widget,
    required this.screenWidth,
  }) : super(key: key);

  final BuyingOrdersWidget widget;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          productTitleOrderProgress(
            product: widget.product,
            screenWidth: screenWidth,
            progresstype: widget.progresstype,
          ),
          Text(
              widget.progresstype == "In Progress" ||
                      widget.progresstype == "Completed"
                  ? "Accepted Bid Rs. ${widget.product!.price}"
                  : "Your Bid Rs. ${widget.product!.price}",
              style: MyStyles.googleTextSubtitleListTile(12)),
          Text(
            "Book Condition : ${widget.product!.condition}/10",
            style: MyStyles.googleTextSubtitleListTile(12),
          ),
          const SizedBox(
            height: 10,
          ),
          SellerDetails(
            widget: widget,
          ),
        ],
      ),
    );
  }
}

class SellerDetails extends StatelessWidget {
  const SellerDetails({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final BuyingOrdersWidget widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: (20),
              backgroundColor: Colors.white,
              backgroundImage: widget.seller!.display.isEmpty
                  ? const NetworkImage(
                      "https://static.thenounproject.com/png/3674270-200.png")
                  : NetworkImage(widget.seller!.display),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.seller!.name,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  widget.seller!.phone,
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
    );
  }
}

class productTitleOrderProgress extends StatelessWidget {
  const productTitleOrderProgress({
    super.key,
    required this.product,
    required this.progresstype,
    required this.screenWidth,
  });
  final ProductModel? product;
  final String progresstype;

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            product!.title,
            style: GoogleFonts.poppins(
              color: MyColors.textColor,
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
        ),
        Text(
          progresstype,
          style: GoogleFonts.poppins(
            fontSize: screenWidth < 400 ? 10 : null,
            color: progresstype == "In Progress"
                ? const Color.fromARGB(255, 201, 182, 18)
                : progresstype == "Cancelled"
                    ? Colors.red
                    : progresstype == "Completed"
                        ? Colors.green
                        : Colors.lightBlue,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class OrderCardImage extends StatelessWidget {
  OrderCardImage({
    Key? key,
    required this.imageURL,
  }) : super(key: key);

  List imageURL;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: imageURL.isEmpty
                  ? const NetworkImage(
                      "https://static.thenounproject.com/png/3674270-200.png")
                  : NetworkImage(imageURL[0]),
            )),
        width: 90,
        height: 90,
      ),
    );
  }
}

//////////////////////////////////Selling Orders Widgets\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
class SellingOrdersWidget extends StatefulWidget {
  const SellingOrdersWidget({
    super.key,
    required this.product,
    required this.progresstype,
    required this.bid,
  });
  final ProductModel? product;
  final String progresstype;
  final Bidding bid;
  @override
  State<SellingOrdersWidget> createState() => _SellingOrdersWidget();
}

class _SellingOrdersWidget extends State<SellingOrdersWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
            // side: BorderSide(color: MyColors.borderColor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: 800,
              child: Row(children: [
                OrderCardImage(imageURL: widget.product!.images),
                SellingOrderCardColumn2(
                  widget: widget,
                  screenWidth: screenWidth,
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class SellingOrderCardColumn2 extends StatelessWidget {
  const SellingOrderCardColumn2({
    Key? key,
    required this.widget,
    required this.screenWidth,
  }) : super(key: key);

  final SellingOrdersWidget widget;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          productTitleOrderProgress(
            product: widget.product,
            screenWidth: screenWidth,
            progresstype: widget.progresstype,
          ),
          Text(
              widget.progresstype == "In Progress" ||
                      widget.progresstype == "Completed"
                  ? "Accepted Bid Rs. ${widget.product!.price}"
                  : "Your Bid Rs. ${widget.product!.price}",
              style: MyStyles.googleTextSubtitleListTile(12)),
          Text(
            "Book Condition : ${widget.product!.condition}/10",
            style: MyStyles.googleTextSubtitleListTile(12),
          ),
          widget.progresstype == "Completed" ||
                  widget.progresstype == "Pending" ||
                  widget.progresstype == "Cancelled"
              ? Container()
              : CompleteOrderButton(widget: widget)
        ],
      ),
    );
  }
}

class CompleteOrderButton extends StatelessWidget {
  const CompleteOrderButton({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final SellingOrdersWidget widget;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          context.read<UserProvider>().addSellerOrder(widget.bid.id);
          context.read<UserProvider>().saveChanges();
          context
              .read<UserProvider>()
              .updateSellerOrders(widget.bid.buyerID, widget.bid.id);
          context.read<UserProvider>().removeBid(widget.bid.id);
          List<String> bids =
              context.read<UserProvider>().user.sellingbiddingIDs;
          context.read<BiddingProvider>().loadUserBids(bids);
          List<String> sellerbids =
              context.read<UserProvider>().user.orderSeller;
          context.read<BiddingProvider>().loadSellerOrders(sellerbids);
        },
        child: const Text("Order Completed"));
  }
}

class SellingOrdersCard extends StatefulWidget {
  const SellingOrdersCard(
      {super.key,
      required this.name,
      required this.price,
      required this.condition,
      required this.progress,
      required this.img,
      required this.isSell,
      required this.sellerIMG,
      required this.sellerName,
      required this.sellerNum});
  final String name;
  final String price;
  final String condition;
  final String progress;
  final String img;
  final bool isSell;
  final String sellerIMG;
  final String sellerName;
  final String sellerNum;
  @override
  State<SellingOrdersCard> createState() => _SellingOrdersCardState();
}

class _SellingOrdersCardState extends State<SellingOrdersCard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const OrderDetail(),
            ),
          );
        },
        child: Container(
          // height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(83, 158, 158, 158),
                blurRadius: 5.0,
                spreadRadius: 1,
                offset: Offset(
                  5, // Move to right 10  horizontally
                  5, // Move to bottom 10 Vertically
                ),
              ),
            ],
          ),

          child: Expanded(
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
                // side: BorderSide(color: MyColors.borderColor),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 9.0, right: 9, top: 8, bottom: 8),
                child: SizedBox(
                  width: screenWidth < 400 ? 600 : 800,
                  // height: screenWidth < 400 ? 45 : 250,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                // border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(widget.img),
                                )),
                            width: screenWidth < 300 ? 60 : 90,
                            height: screenWidth < 300 ? 80 : 90,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.name,
                                style: GoogleFonts.poppins(
                                  color: MyColors.textColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: screenWidth < 400 ? 11 : 15,
                                ),
                                // screenWidth * 0.025 - screenHeight * 0.025),
                              ),
                              Text("Accepted Bid: Rs ${widget.price}",
                                  style: MyStyles.googleTextSubtitleListTile(
                                      screenWidth < 400 ? 8 : 12)),
                              Text(
                                "Book Condition : ${widget.condition}",
                                style: MyStyles.googleTextSubtitleListTile(
                                    screenWidth < 400 ? 8 : 12),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              widget.isSell == false
                                  ? Row(
                                      children: [
                                        CircleAvatar(
                                          radius: (screenWidth < 400 ? 15 : 20),
                                          backgroundColor: Colors.white,
                                          backgroundImage:
                                              NetworkImage(widget.sellerIMG),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.sellerName,
                                              style: GoogleFonts.poppins(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: screenWidth < 400
                                                      ? 8
                                                      : 10),
                                            ),
                                            Text(
                                              widget.sellerNum,
                                              style: GoogleFonts.poppins(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: screenWidth < 400
                                                      ? 8
                                                      : 10),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  : const Text(""),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.progress,
                              style: GoogleFonts.poppins(
                                fontSize: screenWidth < 400 ? 10 : null,
                                color: widget.progress == "In Progress"
                                    ? Colors.green
                                    : widget.progress == "Cancelled"
                                        ? Colors.red
                                        : Colors.lightBlue,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            widget.isSell == true
                                ? ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      backgroundColor: MyColors.buttonColor,
                                    ),
                                    child: Text(
                                      "Update",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  )
                                : const Text("")
                          ],
                        )
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CancelOrderBtn extends StatefulWidget {
  const CancelOrderBtn({super.key});

  @override
  State<CancelOrderBtn> createState() => _CancelOrderBtnState();
}

class _CancelOrderBtnState extends State<CancelOrderBtn> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.mapColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Cancel Order", style: MyStyles.btnTextStyle),
        ),
      ),
    );
  }
}

class ContactSellerBtn extends StatefulWidget {
  const ContactSellerBtn({super.key});

  @override
  State<ContactSellerBtn> createState() => _ContactSellerBtnState();
}

class _ContactSellerBtnState extends State<ContactSellerBtn> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Contact Seller",
            style: MyStyles.btnTextStyle,
          ),
        ),
      ),
    );
  }
}

class OrderDetailsCard extends StatefulWidget {
  const OrderDetailsCard({
    super.key,
    required this.isProduct,
    required this.product,
  });
  final bool isProduct;
  final ProductModel? product;

  @override
  State<OrderDetailsCard> createState() => _OrderDetailsCardState();
}

class _OrderDetailsCardState extends State<OrderDetailsCard> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final Users = context.read<UserProvider>().Users;
    bool seller = false;
    getSeller(sellerID) {
      for (int i = 0; i < Users.length; i++) {
        if (Users[i].id == sellerID) {
          seller = true;
          return Users[i];
        }
      }
    }

    if (Users.isEmpty) {
      print("empty");
      return Column(
        children: [
          SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: const Center(child: CircularProgressIndicator()),
          ),
        ],
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(26),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.product!.title,
                    style: MyStyles.googleTitleText(24),
                  ),
                  Text(
                    "Rs ${widget.product!.price}",
                    style: MyStyles.googleTextSubtitleListTile(22),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.product!.subCategory,
                    style: GoogleFonts.poppins(
                        color: MyColors.subtitleColor,
                        fontSize: 21,
                        fontWeight: FontWeight.w500),
                  ),
                  (widget.isProduct == false)
                      ? Row(
                          children: [
                            const Icon(Icons.star_rounded, color: Colors.amber),
                            Text(
                              "4.0",
                              style: GoogleFonts.poppins(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.amber),
                            ),
                          ],
                        )
                      : const Text(""),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Book Condition: ${widget.product!.condition}/10",
                style: MyStyles.googleTextSubtitleListTile(18),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Seller",
                style: MyStyles.googleTextSubtitleListTile(18),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: (30),
                            backgroundImage:
                                AssetImage("assets/images/girlavatar.png"),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Users.isEmpty
                                    ? "SellerName"
                                    : getSeller(widget.product!.sellerID)!.name,
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                Users.isEmpty
                                    ? "SellerName"
                                    : getSeller(widget.product!.sellerID)!
                                        .phone,
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      widget.isProduct == true
                          ? Row(
                              children: [
                                const Icon(Icons.star_rounded,
                                    color: Colors.amber),
                                Text(
                                  "4.0",
                                  style: GoogleFonts.poppins(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.amber),
                                ),
                              ],
                            )
                          : const MapWidget(),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  widget.isProduct == true
                      ? Container(
                          child: Column(children: [
                            Container(
                              height: 45,
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(50, 0, 0, 0),
                                    offset: Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 10.0,
                                    spreadRadius: 1.0,
                                  ), //BoxShadow
                                  //BoxShadow
                                ],
                              ),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  side: const BorderSide(
                                      color: MyColors.textColor, width: 2),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("View Location on Map",
                                      style: MyStyles.googleTextListTile(15)),
                                ),
                              ),
                            )
                          ]),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            CancelOrderBtn(),
                            ContactSellerBtn(),
                          ],
                        ),
                  widget.isProduct == true ? Container() : const Text(""),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
}

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    super.key,
    required this.images,
  });
  final List images;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        height: 180,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(50, 0, 0, 0),
                offset: Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 1.0,
              ), //BoxShadow
              BoxShadow(
                color: Colors.white,
                offset: Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black12)),
        child: CarouselSlider.builder(
            itemCount: widget.images.length,
            options: CarouselOptions(
                height: 220,
                scrollDirection: Axis.horizontal,
                aspectRatio: 100,
                viewportFraction: 0.9,
                enableInfiniteScroll: false,
                autoPlay: false),
            itemBuilder: ((context, index, realIndex) {
              return Image.network(widget.images[index], fit: BoxFit.cover);
            }))
        );
  }
}
