import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/add_products_widgets.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/map_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/orders_widget.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({super.key});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              // margin: EdgeInsets.all(300.0),
                              decoration: BoxDecoration(
                                  color: MyColors.buttonColor,
                                  shape: BoxShape.circle),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 10,
                      width: 50,
                      // margin: EdgeInsets.all(300.0),
                      decoration: BoxDecoration(
                        color: MyColors.textFieldColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      // margin: EdgeInsets.all(300.0),
                      decoration: BoxDecoration(
                          color: MyColors.textFieldColor,
                          shape: BoxShape.circle),
                    ),
                    Container(
                      height: 10,
                      width: 50,
                      // margin: EdgeInsets.all(300.0),
                      decoration: BoxDecoration(
                        color: MyColors.textFieldColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      // margin: EdgeInsets.all(300.0),
                      decoration: BoxDecoration(
                          color: MyColors.textFieldColor,
                          shape: BoxShape.circle),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Started",
                style: MyStyles.googleSecondTitleText(22),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: ImageSlider(),
            ),
            OrderDetailsCard(isProduct: false),
          ],
        ),
      ),
    );
  }
}
