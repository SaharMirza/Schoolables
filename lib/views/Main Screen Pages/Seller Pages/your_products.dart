import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/add_products_widgets.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/filter_widget.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/map_widget.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/search_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/fonts.dart';
import '../Widgets/my_profile.dart';

class YourProductsPage extends StatefulWidget {
  const YourProductsPage({super.key});

  @override
  State<YourProductsPage> createState() => _YourProductsPageState();
}

class _YourProductsPageState extends State<YourProductsPage> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 300,
                  child: SearchBar(
                      width: screenWidth, screenHeight: screenHeight)),
              SizedBox(
                width: 10,
              ),
              FilterWidget(),
              SizedBox(
                width: 5,
              ),
              MapWidget(),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Your Products",
                        style: MyStyles.googleSecondTitleText(
                            screenWidth * 0.04 + screenHeight * 0.01),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  YourProductCard(),
                  YourProductCard(),
                  SizedBox(
                    height: 20,
                  ),
                  AddProductBtn(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class YourProductCard extends StatefulWidget {
  const YourProductCard({super.key});

  @override
  State<YourProductCard> createState() => _YourProductCardState();
}

class _YourProductCardState extends State<YourProductCard> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: MyColors.startColor,
              blurRadius: 10.0,
              spreadRadius: 0,
              offset: Offset(
                0, // Move to right 10  horizontally
                7.0, // Move to bottom 10 Vertically
              ),
            ),
          ],
        ),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17.0),
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
                          image: NetworkImage(
                            "https://images.unsplash.com/photo-1543002588-bfa74002ed7e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fG1hdGglMjBib29rfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
                          ),
                        )),
                    width: 70,
                    height: 70,
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
                          Text(
                            "Olevels Maths",
                            style: GoogleFonts.poppins(
                              color: MyColors.textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                            // screenWidth * 0.025 - screenHeight * 0.025),
                          ),
                          Text(
                            "Edit",
                            style: GoogleFonts.poppins(
                              color: MyColors.textColor,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Text("Rs.500",
                          style: MyStyles.googleTextSubtitleListTile(12)),
                      Text(
                        "Book Condition : 7/10",
                        style: MyStyles.googleTextSubtitleListTile(12),
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
