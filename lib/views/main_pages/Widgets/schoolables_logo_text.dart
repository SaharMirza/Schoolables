import 'package:flutter/material.dart';

class SchoolablesLogoText extends StatelessWidget {
  const SchoolablesLogoText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          Image.asset(
            'images/logo.png',
            height: 100,
            width: 100,
          ),
          const Text(
            "Schoolables",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
