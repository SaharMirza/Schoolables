import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Profile%20Pages/children_profile_screen.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Profile%20Pages/create_children_profile.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/bottom_nav_bar.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/home_screen.dart';
import 'package:flutterdemo/views/OnBoarding%20Pages/continue_with_email.dart';
import 'package:flutterdemo/views/OnBoarding%20Pages/tell_us_more.dart';
import 'package:flutterdemo/views/OnBoarding%20Pages/tell_us_more_parent.dart';
import 'package:flutterdemo/views/Scanning%20Pages/camera_screen.dart';
// import 'package:flutterdemo/views/Scanning%20Pages/scanlist_page.dart';
import 'package:google_fonts/google_fonts.dart';

class Buttons extends StatefulWidget {
  const Buttons({Key? key, required this.ButtonName, this.role = ""})
      : super(key: key);

  final String ButtonName;
  final String role;
  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (widget.ButtonName == "Login") {
            if (widget.role == "Parent") {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChildernProfileScreen()),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BottomNavBar()),
              );
            }
          }
          if (widget.ButtonName == "Register") {
            if (widget.role == "Parent") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TellUsMoreParent()),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TellUsMore()),
              );
            }
          }
          if (widget.ButtonName == "Next") {
            if (widget.role == "Parent") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChildernProfileScreen()),
              );
            } else {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BottomNavBar()),
            
              );
            }
            
          }
          if (widget.ButtonName == "Scan New List") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CameraScreen()),
            );
          }
        },
        style: ElevatedButton.styleFrom(
            elevation: 20,
            minimumSize: const Size(180, 50),
            backgroundColor: MyColors.buttonColor,
            textStyle: GoogleFonts.poppins(),
            foregroundColor: MyColors.buttonTextColor,
            shadowColor: Colors.grey),
        child: Text(widget.ButtonName));
  }
}
