import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/my_profile.dart';

class YourOrdersPage extends StatefulWidget {
  const YourOrdersPage({super.key});

  @override
  State<YourOrdersPage> createState() => _YourOrdersPageState();
}

class _YourOrdersPageState extends State<YourOrdersPage> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HeaderBar(title: "Your Orders"),
            const SizedBox(
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
          ]),
    );
  }
}
