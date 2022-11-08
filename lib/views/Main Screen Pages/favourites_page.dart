import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Favourites_Page extends StatefulWidget {
  const Favourites_Page({super.key});

  @override
  State<Favourites_Page> createState() => _Favourites_PageState();
}

class _Favourites_PageState extends State<Favourites_Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Favourites"),
    );
  }
}