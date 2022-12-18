import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/provider/child_provider.dart';
import 'package:flutterdemo/provider/parent_provider.dart';
import 'package:provider/provider.dart';

import '../Widgets/circle_avatar_widget.dart';
import '../Widgets/my_profile.dart';
import '../Widgets/text_widget.dart';
import 'children_profile_screen.dart';

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
    final parentProfile = context.read<ParentProvider>().parentProfile;
    TextEditingController nameController = TextEditingController();
    TextEditingController gradeController = TextEditingController();
    TextEditingController schoolController = TextEditingController();
    final List<String>  orderBuyer=[];
    final List<String>  wishListIDs=[];
                                

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
                padding: const EdgeInsets.symmetric(horizontal: 26),
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
                        const Spacer(),
                        const CircleAvatarWidget(
                          image: 'assets/images/profile.png',
                          size: 34,
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    NameAndTextField('Name', screenHeight, nameController),
                    SizedBox(height: screenHeight * 0.03),
                    NameAndTextField('School', screenHeight, schoolController),
                    SizedBox(height: screenHeight * 0.03),
                    NameAndTextField('Grade', screenHeight, gradeController),
                    SizedBox(height: screenHeight * 0.03),
                    Row(
                      children: [
                        SecondTitleText(
                            text: "Add Child",
                            align: TextAlign.left,
                            size: screenHeight * 0.025),
                        const Spacer(),
                        InkWell(
                          child: const Icon(
                            Icons.add_circle,
                            size: 50,
                            color: MyColors.buttonColor,
                          ),
                          onTap: () {
                            context.read<ChildProvider>().addChild(
                                nameController.text,
                                schoolController.text,
                                gradeController.text,
                                "display",
                                orderBuyer,
                                wishListIDs,
                                parentProfile.id);
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

  Widget NameAndTextField(
      String title, double screenHeight, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubtitleText(
            text: title, align: TextAlign.left, size: screenHeight * 0.019),
        TextField(
          controller: controller,
          decoration: const InputDecoration(contentPadding: EdgeInsets.only(top: 10)),
        ),
      ],
    );
  }
}
