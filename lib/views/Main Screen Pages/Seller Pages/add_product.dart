import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';
import '../Widgets/add_products_widgets.dart';
import '../Widgets/my_profile.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("New Product",
              style: MyStyles.googleSecondTitleText(
                  screenWidth * 0.04 + screenHeight * 0.02)),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                iconSize: 50,
                onPressed: (() {}),
                icon: ProfileIcon(
                  img:
                      "https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/user-profile-icon.png",
                  radius: screenWidth * 0.03 + screenHeight * 0.01,
                )
                // Icon(Icons.account_circle_outlined)
                ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: UploadPictureCard(
                      screenWidth: screenWidth, screenHeight: screenHeight),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AddProductFields(
                      screenWidth: screenWidth, screenHeight: screenHeight),
                ),
              ],
            ),
          ),
        ));
  }
}
