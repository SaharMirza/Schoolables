import 'package:flutter/material.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/Bottom_Nav_bar.dart';
import 'package:flutterdemo/views/OnBoarding%20Pages/continue_with_email.dart';

class MainLoginScreen extends StatelessWidget {
  const MainLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close_outlined),
                    onPressed: (() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BottomNavBar()),
                      );
                    }),
                  ),
                ],
              ),
              const Continer1(),
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
  const Continer1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          Image.asset(
            'images/logo.png',
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
            children: const [
              //continue with email button
              LoginChoiceButton(
                  optionIcon: 'images/email.png',
                  title: 'Continue with Email',
                  choice: "Email"),
              //continue with google
              LoginChoiceButton(
                optionIcon: 'images/google.png',
                title: 'Continue with Google',
                choice: "Google",
              ),
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
      required this.choice})
      : super(key: key);

  final String optionIcon;
  final String title;
  final String choice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: const Size(120, 50),
              side: const BorderSide(width: 2)),
          onPressed: () {
            if (choice == "Email") {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ContinueWithEmail()),
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
              Text("  " + title)
            ],
          )),
    );
  }
}
