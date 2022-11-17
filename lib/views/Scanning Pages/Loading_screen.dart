import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterdemo/views/Scanning%20Pages/BookList.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        // leading: const Padding(
        //   padding: EdgeInsets.only(left: 15.0),
        //   child: Icon(
        //     Icons.arrow_back_ios,
        //     size: 24,
        //     color: Colors.black,
        //   ),
        // ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Analyzing Book List ',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 24,
                color: Color(0xff22223B),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
              child: CircularProgressIndicator(
            color: Colors.black,
          ))
        ],
      ),
    );
  }
}
