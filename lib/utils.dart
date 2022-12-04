import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:flutterdemo/provider/student_provider.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/my_profile.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Profile%20Pages/edit_details.dart';
import 'package:flutterdemo/views/Notifications%20Pages/bid_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final userProfile = context.watch<UserProvider>().userProfile;
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
            icon: Image(image: NetworkImage(userProfile.display.isEmpty
                    ? "https://img.icons8.com/bubbles/50/000000/user.png"
                    : userProfile.display),)
            //Image.asset("assets/images/girlavatar.png"),
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

class dialogs {
  static errorToast({required String error}) {
    error = TextFormatter.errorFormatter(text: error);
    Fluttertoast.showToast(
      msg: error,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

static Future errorDialog(
      BuildContext context, String title, String message) {
    message = TextFormatter.errorFormatter(text: message);
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                // color: const Color.fromARGB(255, 59, 59, 61),
                color: Colors.redAccent),
          ),
          content: Text(
            message,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: const Color.fromARGB(255, 59, 59, 61),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'OK',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: const Color.fromARGB(255, 59, 59, 61),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}

class TextFormatter {
  static String removeSpecialCharacters(String input) {
    return input.replaceAll(RegExp(r'[^\w\s]+'), '');
  }

  static String firebaseError(String input) {
    return input.toString().split("]").last.trim();
  }

  static String errorFormatter({required String text}) {
    // Error messages Formatting
    text = text.split(" or ")[0];
    text = text.split(".")[0] + ".";
    text = text.replaceAll("String", "Field");
    text = text.replaceAll("null", "blank");
    text = text.replaceAll("badly", "incorrectly");
    text = text.replaceAll("identifier", "email");
    return text;
  }

  static productNameFormatter(String name) {
    name = name.split(" ").first + " " + name.split(" ").last;
    // if both first and last name are same, remove last name
    if (name.split(" ").first == name.split(" ").last) {
      name = name.split(" ").first;
    }
    // capetalise first letter
    name = name.split(" ").map((e) {
      return e.substring(0, 1).toUpperCase() + e.substring(1);
    }).join(" ");
    return name;
  }
}