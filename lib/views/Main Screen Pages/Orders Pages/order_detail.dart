import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/constants/fonts.dart';

import '../Widgets/orders_widget.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({super.key});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail>
    with TickerProviderStateMixin {
  late AnimationController controller;
  // late Animation colorAnimation;
  // late Animation sizeAnimation;
  late Tween<double> sizeTween;
  late ColorTween colorTween;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    // sizeAnimation = Tween<double>(begin: 50.0, end: 100.0).animate(controller);
    // colorAnimation = ColorTween(
    //         begin: MyColors.textColor, end: MyColors.buttonColor)
    //     .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
    sizeTween = Tween<double>(begin: 50.0, end: 100.0);
    colorTween =
        ColorTween(begin: MyColors.textColor, end: MyColors.buttonColor);

    // controller.addStatusListener((status) {
    //   setState(() {});
    // });
  }

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
            CustomProgressIndicator(
              colorTween: colorTween,
              sizeTween: sizeTween,
              controller: controller,
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Started",
                style: MyStyles.googleSecondTitleText(22),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: ImageSlider(images: [],),
            ),
            // OrderDetailsCard(isProduct: false),
          ],
        ),
      ),
    );
  }
}
