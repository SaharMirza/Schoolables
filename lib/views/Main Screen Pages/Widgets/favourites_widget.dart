import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';
import '../../../controllers/progress_type_provider.dart';
import '../Product Pages/product_detail.dart';

class favouritesCard extends StatefulWidget {
  const favouritesCard(
      {super.key,
      required this.name,
      required this.price,
      required this.condition,
      required this.img,
      required this.sellerIMG,
      required this.sellerName,
      required this.sellerNum});
  final String name;
  final String price;
  final String condition;
  final String img;

  final String sellerIMG;
  final String sellerName;
  final String sellerNum;
  @override
  State<favouritesCard> createState() => _favouritesCardState();
}

class _favouritesCardState extends State<favouritesCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProductDetail(),
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
                            Icon(Icons.favorite_outline)
                          ],
                        ),
                        Text("Rs " + widget.price,
                            style: MyStyles.googleTextSubtitleListTile(12)),
                        Text(
                          "Book Condition : " + widget.condition,
                          style: MyStyles.googleTextSubtitleListTile(12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
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
