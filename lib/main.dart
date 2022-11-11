import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Profile%20Pages/edit_details.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Profile%20Pages/edit_profile_information.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/Bottom_Nav_bar.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/home_screen.dart';
import 'package:flutterdemo/views/OnBoarding%20Pages/continue_with_email.dart';
import 'package:flutterdemo/views/OnBoarding%20Pages/forget_pass.dart';
import 'package:flutterdemo/views/OnBoarding%20Pages/main_login_screen.dart';
import 'package:flutterdemo/views/OnBoarding%20Pages/register_screen.dart';
import 'package:flutterdemo/views/OnBoarding%20Pages/role_screen.dart';
import 'package:flutterdemo/utils.dart';
import 'package:flutterdemo/views/OnBoarding%20Pages/tell_us_more.dart';
import 'package:flutterdemo/views/OnBoarding%20Pages/tell_us_more_parent.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LogoWidget(),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset(
            'images/logo.png',
            height: 300,
            width: 300,
          ),
          Text("Schoolables",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 36))
        ],
      ),
      backgroundColor: MyColors.startColor,
      splashIconSize: 400,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      centered: true,
      nextScreen: const RoleScreen(),
    );
  }
}
