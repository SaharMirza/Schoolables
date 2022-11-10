import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:badges/badges.dart';

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyProfileTextWidget(text: "Edit Profile"),
                Text("Save", style: MyStyles.underlinedGreyText)
              ],
            ),
            Text(
              "Basic Information",
              style: MyStyles.googleSecondTitleText,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Badge(
                  badgeContent: Icon(
                    Icons.add_a_photo_outlined,
                  ),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: Image.network(
                        "https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o="),
                  ),
                  badgeColor: MyColors.startColor,
                  position: BadgePosition.bottomEnd(bottom: 15, end: 9),
                ),
                SizedBox(
                  width: 50,
                ),
                Container(
                  width: 220,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Resevior Name",
                      fillColor: MyColors.textFieldColor,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
