import 'dart:async';

import 'package:flutter/material.dart';

import '../main_pages/Widgets/text_widget.dart';
import 'book_list.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const BookList()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight*0.4),
               SubtitleText(
                  text: "Analyzing Book List",
                  align: TextAlign.center,
                  size: screenHeight * 0.03,
                ),

            ],
          ),
          SizedBox(
            height: screenHeight * 0.025,
          ),
          const Center(
              child: CircularProgressIndicator(
            color: Colors.black,
          ))
        ],
      ),
    );
  }
}
