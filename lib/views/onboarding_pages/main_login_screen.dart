import 'package:flutter/material.dart';
import 'package:flutterdemo/Entities/user_auth_entity.dart';
import 'package:flutterdemo/Services/auth.dart';
import 'package:flutterdemo/utils.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/Bottom_Nav_bar.dart';
import 'package:flutterdemo/views/OnBoarding%20Pages/continue_with_email.dart';
import 'package:flutterdemo/views/success_screen.dart';

class MainLoginScreen extends StatelessWidget {
  const MainLoginScreen({Key? key, required this.role}) : super(key: key);
  final String role;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Continer1(role: role),
              const Text(
                "If you continue, you are accepting Schoolables Terms and Conditions and Privacy Policy",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Continer1 extends StatelessWidget {
  const Continer1({Key? key, required this.role}) : super(key: key);

  final String role;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          Image.asset(
            'assets/images/logo.png',
            height: 100,
            width: 100,
          ),
          const Text("Schoolables",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: 24.0),
          //welcome to schoolables heading
          const Text('Welcome to Schoolables',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: 15.0),
          //sub heading
          const Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 20.0),
            child: Text(
              "The trusted community of buyers and sellers",
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40.0),
          Column(
            children: [
              //continue with email button
              LoginChoiceButton(
                  optionIcon: 'assets/images/email.png',
                  title: 'Continue with Email',
                  choice: "Email",
                  role: role),
              //continue with google
              LoginChoiceButton(
                  optionIcon: 'assets/images/google.png',
                  title: 'Continue with Google',
                  choice: "Google",
                  role: role),
            ],
          ),
        ],
      ),
    );
  }
}

class LoginChoiceButton extends StatelessWidget {
  const LoginChoiceButton(
      {Key? key,
      required this.optionIcon,
      required this.title,
      required this.choice,
      required this.role})
      : super(key: key);

  final String optionIcon;
  final String title;
  final String choice;
  final String role;

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: const Size(120, 50),
              side: const BorderSide(width: 2)),
          onPressed: () async {
            if (choice == "Google") { 
          // Google Signup
          // Anonymous Signin
          // dynamic res = await _auth.signInAnon();
          // Google Signin
          dynamic res = await _auth.signInWithGoogle();
          // Check if result is of type UserProfile
          if (res is UserAuth) {
            // Navigate to Home Page
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const SuccessScreen(nextPage: BottomNavBar()),
            ));
          } else {
            // Show error message
            dialogs.errorToast(
                error: TextFormatter.firebaseError(res.toString()));
          
        }}
            if (choice == "Email") {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ContinueWithEmail(
                          role: role,
                        )),
              );
            }
          },
          child: Row(
            children: [
              Image.asset(
                optionIcon,
                width: 25,
                height: 25,
              ),
              Text("  $title")
            ],
          )),
    );
  }
}
