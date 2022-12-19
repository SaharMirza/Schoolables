import 'package:flutter/material.dart';
import '../Widgets/my_profile.dart';

class EditProfileInformation extends StatefulWidget {
  const EditProfileInformation({super.key});

  @override
  State<EditProfileInformation> createState() => _EditProfileInformationState();
}

class _EditProfileInformationState extends State<EditProfileInformation> {
  String userName = '';
  String dob = '';
  String phoneNumber = '';
  String email = '';
  String img = '';

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
              // includes Title, and save button.
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: EditProfileCard(
                    screenHeight: screenHeight, screenWidth: screenWidth, onValueChanged: (value){
                        
                    },),
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
