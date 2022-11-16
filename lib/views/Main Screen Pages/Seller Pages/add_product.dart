import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:flutterdemo/utils.dart';
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
      
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              HeaderBar(title: "New Product"),
              SizedBox(
                height: screenHeight * 0.88,
                child: SingleChildScrollView(
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
                ),
              ),
            ],
          ),
        ));
  }
}
