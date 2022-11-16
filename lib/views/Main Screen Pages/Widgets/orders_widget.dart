import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Orders%20Pages/order_detail.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';
import '../../../controllers/progress_type_provider.dart';
import 'map_widget.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    late bool selected = false;

    return InkWell(
      onTap: () {
        selected = true;
      },
      child: Container(
        height: 45,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: selected == false
              ? Color.fromRGBO(242, 233, 228, 1.0)
              : MyColors.buttonColor,
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: selected == false ? MyColors.textColor : Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class ProgressWidget2 extends StatefulWidget {
  const ProgressWidget2({
    super.key,
    required this.text,
    required this.index,
    required this.onValueChanged,
    required this.selected,
  });
  final String text;
  final int index;
  final Function(int) onValueChanged;
  final int selected;
  @override
  State<ProgressWidget2> createState() => _ProgressWidget2State();
}

class _ProgressWidget2State extends State<ProgressWidget2> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   selected = widget.selected;
  // }

  Widget build(BuildContext context) {
    int selectedIndex = -1;

    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = widget.index;
          });
          widget.onValueChanged(selectedIndex);
        },
        child: Container(
          height: 25,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: widget.selected != widget.index
                ? Color.fromRGBO(242, 233, 228, 1.0)
                : MyColors.buttonColor,
          ),
          child: Center(
            child: Text(
              widget.text,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: widget.selected != widget.index
                    ? MyColors.textColor
                    : Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => OrderDetail(),
            ),
          );
        },
        child: Container(
          height: 150,
          decoration: BoxDecoration(
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
              child: Container(
                width: 800,
                child: Row(children: [
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
                      width: 90,
                      height: 90,
                    ),
                  ),
                  Expanded(
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
                            Text(
                              widget.progress,
                              style: GoogleFonts.poppins(
                                color: widget.progress == "In Progress"
                                    ? Colors.green
                                    : widget.progress == "Cancelled"
                                        ? Colors.red
                                        : Colors.lightBlue,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        Text("Accepted Bid: Rs " + widget.price,
                            style: MyStyles.googleTextSubtitleListTile(12)),
                        Text(
                          "Book Condition : " + widget.condition,
                          style: MyStyles.googleTextSubtitleListTile(12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        widget.isSell == true
                            ? Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Update",
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(15.0),
                                    ),
                                    backgroundColor: MyColors.buttonColor,
                                  ),
                                ),
                              )
                            : Column(
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: (20),
                                        backgroundColor: Colors.white,
                                        backgroundImage:
                                            NetworkImage(widget.sellerIMG),
                                      ),
                                      SizedBox(
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
                  ),
                ]),
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
    return Container(
      height: 45,
      child: ElevatedButton(
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Cancel Order", style: MyStyles.btnTextStyle),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.mapColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
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
    return Container(
      height: 45,
      child: ElevatedButton(
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Contact Seller",
            style: MyStyles.btnTextStyle,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}

class OrderDetailsCard extends StatefulWidget {
  const OrderDetailsCard({super.key});

  @override
  State<OrderDetailsCard> createState() => _OrderDetailsCardState();
}

class _OrderDetailsCardState extends State<OrderDetailsCard> {
  @override
  Widget build(BuildContext context) {
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
                  "Karwan e Urdu",
                  style: MyStyles.googleTitleText(35),
                ),
                Text(
                  "Rs 500",
                  style: MyStyles.googleTextSubtitleListTile(22),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Urdu",
                  style: GoogleFonts.poppins(
                      color: MyColors.subtitleColor,
                      fontSize: 21,
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Icon(Icons.star_rounded, color: Colors.amber),
                    Text(
                      "4.0",
                      style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.amber),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Book Condition: 7/10",
              style: MyStyles.googleTextSubtitleListTile(18),
            ),
            SizedBox(
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
                        CircleAvatar(
                          radius: (40),
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(
                              "https://img.freepik.com/premium-vector/portrait-caucasian-woman-avatar-female-person-vector-icon-adult-flat-style-headshot_605517-26.jpg?w=2000"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Qiblatain Fatima",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "0321-111-3247",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    MapWidget(),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CancelOrderBtn(),
                    ContactSellerBtn(),
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

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 250,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(50, 0, 0, 0),
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 1.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black12)),
      child: CarouselSlider(
        options: CarouselOptions(
            height: 220,
            scrollDirection: Axis.horizontal,
            aspectRatio: 100,
            viewportFraction: 0.9,
            enableInfiniteScroll: false,
            autoPlay: false),
        items: [
          Image.network(
            "https://images.unsplash.com/photo-1543002588-bfa74002ed7e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80",
            fit: BoxFit.cover,
          ),
          Image.network(
            "https://images.unsplash.com/photo-1543002588-bfa74002ed7e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80",
            fit: BoxFit.cover,
          ),
          Image.network(
            "https://images.unsplash.com/photo-1543002588-bfa74002ed7e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80",
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
