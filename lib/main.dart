import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/provider/TabNotifier.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Profile%20Pages/ChildProfile.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Profile%20Pages/ChildrenProfileScreen.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Profile%20Pages/CreateChildrenProfile.dart';
import 'package:flutterdemo/controllers/progress_type_provider.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/Bottom_Nav_bar.dart';
import 'package:flutterdemo/views/OnBoarding%20Pages/role_screen.dart';
import 'package:flutterdemo/views/Scanning%20Pages/CameraScreen.dart';
import 'package:flutterdemo/utils.dart';
import 'package:flutterdemo/views/OnBoarding%20Pages/tell_us_more.dart';
import 'package:flutterdemo/views/OnBoarding%20Pages/tell_us_more_parent.dart';
import 'package:flutterdemo/views/Scanning%20Pages/Loading_screen.dart';
// import 'package:flutterdemo/views/Scanning%20Pages/ScannedBookList_page.dart';
import 'package:flutterdemo/views/Scanning%20Pages/scanninglist_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    child: const MyApp(),
    create: (_) => TabNotifier(),
  ));
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
      home: MyHomePage(title: "title")
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
            'assets/images/logo.png',
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
