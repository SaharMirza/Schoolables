import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/Bottom_Nav_bar.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/home_screen.dart';
import 'package:flutterdemo/views/OnBoarding%20Pages/continue_with_email.dart';
import 'package:flutterdemo/views/OnBoarding%20Pages/tell_us_more.dart';
import 'package:flutterdemo/views/Scanning%20Pages/CameraScreen.dart';
// import 'package:flutterdemo/views/Scanning%20Pages/scanlist_page.dart';
import 'package:flutterdemo/views/Scanning%20Pages/scanninglist_page.dart';
import 'package:google_fonts/google_fonts.dart';

class Buttons extends StatefulWidget {
  const Buttons({Key? key, required this.ButtonName}) : super(key: key);

  final String ButtonName;
  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
           if (widget.ButtonName == "Login") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BottomNavBar()),
              );
            }
            if (widget.ButtonName == "Register") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TellUsMore()),
              );
            }
            if (widget.ButtonName == "Next") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BottomNavBar()),
              );
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
