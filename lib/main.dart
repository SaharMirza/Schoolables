import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutterdemo/Entities/user_auth_entity.dart';
import 'package:flutterdemo/Services/auth.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/provider/TabNotifier.dart';
import 'package:flutterdemo/provider/student_provider.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Orders%20Pages/your_orders.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Product%20Pages/product_detail.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/bottom_nav_bar.dart';
import 'package:flutterdemo/views/OnBoarding%20Pages/register_screen.dart';
import 'package:flutterdemo/views/OnBoarding%20Pages/role_screen.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/place_bid_popup.dart';
// import 'package:flutterdemo/views/Scanning%20Pages/ScannedBookList_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


Future<void> main() async {
  // For Flutter firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
     MultiProvider(
      providers: [
        // Providers Sorted Alphabetically
        ChangeNotifierProvider(create: (_) => TabNotifier()),       
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
    child: const MyApp(),
    
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserAuth?>.value(
      value: AuthService().user,
      initialData: null,child:MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Schoolables',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(title: "title"),
    ),);
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
     final userAuth = Provider.of<UserAuth?>(context);
    Future.delayed(Duration.zero, () async {
      context.read<UserProvider>().loadUser(userAuth);
    });
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Something went wrong!"),
          );
        } else if (snapshot.hasData) //if the user was logged in
        {
          return BottomNavBar();
        } else //if the user was logged out
        {
          return LogoWidget();
        }
      },
    ));
    // const Scaffold(
    //   body: Center(
    //     child: LogoWidget(),
    //   ),
    // );
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
