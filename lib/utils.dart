import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/my_profile.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Profile%20Pages/edit_details.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child:
              Icon(
            Icons.logo_dev_outlined,
            color: const Color.fromRGBO(74, 78, 105, 1.0),
          )),
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.location_on,
              color: const Color.fromRGBO(74, 78, 105, 1.0)),
          Text('North Nazimabad , Karachi',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: const Color.fromRGBO(74, 78, 105, 1.0))),
        ],
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: IconButton(
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditDetailsPage(),
                ),
              );
            },
            icon: const Icon(Icons.account_circle_outlined,
                size: 30, color: const Color.fromRGBO(74, 78, 105, 1.0)),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}

class HeaderBar extends StatelessWidget {
  const HeaderBar({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        // centerTitle: true,
        title: Text(title,
            style: MyStyles.googleSecondTitleText(
                screenWidth * 0.02 + screenHeight * 0.02)),
        actions: [
          IconButton(
              iconSize: 50,
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditDetailsPage(),
                  ),
                );
              },
              icon: ProfileIcon(
                img:
                    "https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/user-profile-icon.png",
                radius: screenWidth * 0.03 + screenHeight * 0.01,
              )
              ),
        ],
      ),
    );
  }
}
