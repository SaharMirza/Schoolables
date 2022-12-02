import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:flutterdemo/main.dart';
import 'package:flutterdemo/utils.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Profile%20Pages/create_children_profile.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/bottom_nav_bar.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/circle_avatar_widget.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/my_profile.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/schoolables_logo_text.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Classes/Children.dart';
import 'child_profile.dart';

class ChildernProfileScreen extends StatefulWidget {
  const ChildernProfileScreen({Key? key}) : super(key: key);

  @override
  State<ChildernProfileScreen> createState() => _ChildernProfileScreenState();
}

class _ChildernProfileScreenState extends State<ChildernProfileScreen> {
  @override
  List<Children> children = [
    Children(name: "Samra Noman", school: "Beaconhouse", grade: "4th Grade"),
    Children(name: "Omar Noman", school: "Beaconhouse", grade: "1st Grade")
  ];

  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
        body: Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: NavigateBackWidget(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
            ),
          ],
        ),
        SchoolablesLogoText(),
        SizedBox(height: screenHeight * 0.04),
        MyProfileTextWidget(
            text: "Children Profiles", screenWidth: screenWidth),
        SizedBox(height: screenHeight * 0.04),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: children.length,
            separatorBuilder: (context, int index) =>
                SizedBox(height: screenHeight * 0.01),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ListCard(
                      children: children[index],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: screenHeight * 0.05,
        ),
        InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_circle,
                size: 20,
                color: MyColors.buttonColor,
              ),
              Text(
                'Add More',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
              )
            ],
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ChildProfileScreen(),
              ),
            );
          },
        ),
      ],
    ));
  }
}

class ListCard extends StatelessWidget {
  final Children children;

  const ListCard({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight * 0.15,
      width: screenWidth * 0.8,
      decoration: BoxDecoration(
        color: Color.fromRGBO(242, 232, 228, 100),
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  children: [
                    CircleAvatarWidget(
                        image: 'assets/images/profile.png', size: 28),
                  ],
                ),
                SizedBox(width: screenWidth * 0.02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      children.name,
                      style: MyStyles.googleTextListTile(screenHeight * 0.025),
                    ),
                    Text(children.school,
                        style: MyStyles.googleTextSubtitleListTile(
                            screenHeight * 0.02)),
                    Text(children.grade,
                        style: MyStyles.googleTextSubtitleListTile(
                            screenHeight * 0.02)),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.0, right: 9.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavBar()));
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: MyColors.buttonColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
