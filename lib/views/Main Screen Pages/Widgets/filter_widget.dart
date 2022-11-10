import 'package:flutter/material.dart';


class FilterWidget extends StatelessWidget {
  const FilterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Color.fromRGBO(74, 78, 105, 1.0),
      child: Icon(Icons.tune_outlined),
    );
  }
}