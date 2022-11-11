import 'package:flutter/material.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/Bottom_Nav_bar.dart';
import 'package:flutterdemo/views/OnBoarding%20Pages/main_login_screen.dart';

class RoleScreen extends StatefulWidget {
  const RoleScreen({super.key});

  @override
  State<RoleScreen> createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          PageDetails(),
          ChoiceContainer(),
          
        ],
      ),
    );
  }
}

class ChoiceContainer extends StatelessWidget {
  const ChoiceContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Are you a Parent or Student?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        ChoiceButton(title: "Parent"),
        ChoiceButton(title: "Student"),
      ],
    )
        ],
      ),
    );
  }
}

//Page details
class PageDetails extends StatelessWidget {
  const PageDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.75,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(154, 140, 152, 1.0),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30.0),
          bottomLeft: Radius.circular(30.0),
        ),
      ),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Schoolables",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(
              'images/logo.png',
              height: 200,
              width: 200,
            ),
          ),
          const Text(
            "One Stop Shop For Old School Supplies!",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 60.0, right: 60.0, top: 20.0),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incid",
              textAlign: TextAlign.center,
            ),
          )
        ],
      )),
    );
  }
}

//Button Widget
class ChoiceButton extends StatelessWidget {
  const ChoiceButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
          onPressed: () {
            if (title == "Student") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainLoginScreen()),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            elevation: 10,
            backgroundColor: const Color.fromRGBO(74, 78, 105, 1.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            minimumSize: const Size(120, 50),
            foregroundColor: Colors.white
          ),
          child: Text(title)),
    );
  }
}
