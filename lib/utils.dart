import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/my_profile.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Profile%20Pages/edit_details.dart';
import 'package:flutterdemo/views/Notifications%20Pages/bid_notifications.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 10.0),
            child: InkWell(
              onTap: (() {
                 Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BidNotification()),
            );
              }),
              child: Stack(
                children: [
                  Icon(
                    Icons.notifications_none_outlined,
                    size: 35,
                  ),
                  Container(
                      height: 17,
                      width: 17,
                      child: CircleAvatar(
                        child: Text("1"),
                        backgroundColor: Colors.yellow,
                      ))
                ],
              ),
            ),
          )
          // Image.asset(
          //   "assets/images/Schoolables.png",
          //   height: 25,
          //   width: 25,
          // )
          // // Icon(
          //   Icons.logo_dev_outlined,
          //   color: const Color.fromRGBO(74, 78, 105, 1.0),
          // ),
          ),
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(
            Icons.location_on,
            color: const Color.fromRGBO(74, 78, 105, 1.0),
          ),
          Text(
            'North Nazimabad , Karachi',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
              color: const Color.fromRGBO(74, 78, 105, 1.0),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: IconButton(
            iconSize: 50,
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditDetailsPage(),
                ),
              );
            },
            icon: Image.asset("assets/images/girlavatar.png"),
            // const Icon(Icons.account_circle_outlined,
            //     size: 30, color: const Color.fromRGBO(74, 78, 105, 1.0)),
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
            icon: Image.asset("assets/images/girlavatar.png"),
            // const Icon(Icons.account_circle_outlined,
            //   size: 30, color: const Color.fromRGBO(74, 78, 105, 1.0)),
          ),
        ],
      ),
    );
  }
}
