import 'package:flutter/material.dart';

import '../Widgets/my_profile.dart';

class EditDetailsPage extends StatefulWidget {
  const EditDetailsPage({super.key});

  @override
  State<EditDetailsPage> createState() => _EditDetailsPageState();
}

class _EditDetailsPageState extends State<EditDetailsPage> {
  @override
  Widget build(BuildContext context) {
    
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyProfileTextWidget(
                        text: "My Profile", screenWidth: screenWidth),
                  ),
                  const LogoutBtnWidget(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: MyProfileNameCard(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                ),
              ),
              MyProfileListView(
                  screenHeight: screenHeight, screenWidth: screenWidth),
            ],
          ),
        ),
      ),
    );
  }
}
