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
    return Scaffold(
      appBar: AppBar(
        leading: NavigateBackWidget(),
        elevation: 0,
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
                child: EditProfileCard(),
              ),
              //Edit Profile Picture Section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: EditProfileIcon(),
              ),
              // Basic Information Fields Section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BasicInformationSection(),
              ),
              // Contact Information Fields Section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ContactInformationSection(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
