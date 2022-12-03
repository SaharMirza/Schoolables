import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Profile%20Pages/children_profile_screen.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/circle_avatar_widget.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/my_profile.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/text_widget.dart';
import 'package:flutterdemo/views/Widgets/textfield.dart';
import 'package:google_fonts/google_fonts.dart';

class ChildProfileScreen extends StatefulWidget {
  const ChildProfileScreen({Key? key}) : super(key: key);

  @override
  State<ChildProfileScreen> createState() => _ChildProfileScreenState();
}

class _ChildProfileScreenState extends State<ChildProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10),
                child: NavigateBackWidget(
                    screenWidth: screenWidth, screenHeight: screenHeight),
              ),
              SizedBox(height: screenHeight * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        TitleText(
                          text: "Child Profile",
                          align: TextAlign.left,
                          size: screenHeight * 0.03,
                        ),
                        Spacer(),
                        CircleAvatarWidget(
                          image: 'assets/images/profile.png',
                          size: 34,
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    NameAndTextField('Name', screenHeight),
                    SizedBox(height: screenHeight * 0.03),
                    NameAndTextField('School', screenHeight),
                    SizedBox(height: screenHeight * 0.03),
                    NameAndTextField('Grade', screenHeight),
                    SizedBox(height: screenHeight * 0.03),
                    Row(
                      children: [
                        SecondTitleText(
                            text: "Add Child",
                            align: TextAlign.left,
                            size: screenHeight * 0.025),
                        Spacer(),
                        InkWell(
                          child: Icon(
                            Icons.add_circle,
                            size: 50,
                            color: MyColors.buttonColor,
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ChildernProfileScreen()),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget NameAndTextField(String title, double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubtitleText(
            text: title, align: TextAlign.left, size: screenHeight * 0.019),
        TextField(
          decoration: InputDecoration(contentPadding: EdgeInsets.only(top: 10)),
        ),
      ],
    );
  }
}
