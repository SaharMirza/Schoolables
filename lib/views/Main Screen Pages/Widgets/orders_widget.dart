import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';
import '../../../controllers/progress_type_provider.dart';

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
    );
  }
}
