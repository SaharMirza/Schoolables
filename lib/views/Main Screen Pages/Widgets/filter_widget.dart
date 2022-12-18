import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return CircleAvatar(
      radius: screenHeight * 0.04 - screenWidth * 0.02,
      backgroundColor: const Color.fromRGBO(74, 78, 105, 1.0),
      child: const Icon(
        Icons.tune_outlined,
      ),
    );
  }
}
