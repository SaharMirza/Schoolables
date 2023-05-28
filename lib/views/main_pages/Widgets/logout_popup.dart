import 'package:flutter/material.dart';
import 'package:flutterdemo/imports.dart';

class LogoutPopup extends StatelessWidget {
  const LogoutPopup({
    super.key,
    required this.onYesPressed,
  });

  final Function() onYesPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: SizedBox(
      height: 100,
      child: Column(children: [
        const Text('Are you sure you want to logout?'),
        const SizedBox(height: 20),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          ElevatedButton(
            onPressed: onYesPressed,
            style: ElevatedButton.styleFrom(
                elevation: 10,
                minimumSize: const Size(100, 40),
                backgroundColor: MyColors.startColor,
                textStyle: GoogleFonts.poppins(),
                foregroundColor: MyColors.buttonTextColor,
                shadowColor: Colors.grey),
            child: const Text('Yes'),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                  elevation: 10,
                  minimumSize: const Size(100, 40),
                  backgroundColor: MyColors.buttonColor,
                  textStyle: GoogleFonts.poppins(),
                  foregroundColor: MyColors.buttonTextColor,
                  shadowColor: Colors.grey),
              child: const Text('Cancel'))
        ])
      ]),
    ));
  }
}
