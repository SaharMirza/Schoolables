import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/my_profile.dart';

class YourOrders extends StatefulWidget {
  const YourOrders({super.key});

  @override
  State<YourOrders> createState() => _YourOrdersState();
}

class _YourOrdersState extends State<YourOrders> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 70,
          ),
          ListView(
            shrinkWrap: true,
            children: [
              MyProfileListTile(
                  icon: Icons.shopping_bag_outlined,
                  title: "Selling Orders",
                  subtitle: "See your active or archived buying orders",
                  screenHeight: screenHeight,
                  screenWidth: screenWidth),
              MyProfileListTile(
                  icon: Icons.shopping_bag_outlined,
                  title: "Buying Orders",
                  subtitle: "See your active or archived buying orders",
                  screenHeight: screenHeight,
                  screenWidth: screenWidth)
            ],
          ),
        ]);
  }
}
