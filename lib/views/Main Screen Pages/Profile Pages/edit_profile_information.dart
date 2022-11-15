import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:badges/badges.dart';
import 'package:intl/intl.dart';
import '../Widgets/my_profile.dart';

class EditProfileInformation extends StatefulWidget {
  const EditProfileInformation({super.key});

  @override
  State<EditProfileInformation> createState() => _EditProfileInformationState();
}

class _EditProfileInformationState extends State<EditProfileInformation> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // includes Title, Upload profile picture and save button.
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: EditProfileCard(
                    screenHeight: screenHeight, screenWidth: screenWidth),
              ),
              //Edit Profile Picture Section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: EditProfileIcon(
                    screenHeight: screenHeight, screenWidth: screenWidth),
              ),
              // Basic Information Fields Section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BasicInformationSection(
                    screenHeight: screenHeight, screenWidth: screenWidth),
              ),
              // Contact Information Fields Section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ContactInformationSection(
                    screenHeight: screenHeight, screenWidth: screenWidth),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
