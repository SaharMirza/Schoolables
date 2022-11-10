import 'package:flutter/material.dart';

class SubHeading extends StatelessWidget {
  const SubHeading({
    Key? key,
    required this.leading,
    required this.trailing,
  }) : super(key: key);

  final String leading;
  final String trailing;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(leading,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(74, 78, 105, 1.0),
            )),
        Text(trailing)
      ],
    );
  }
}
