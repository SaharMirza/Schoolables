import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScanningList extends StatefulWidget {
  const ScanningList({super.key});

  @override
  State<ScanningList> createState() => _ScanningListState();
}

class _ScanningListState extends State<ScanningList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Scanning"),
    );
  }
}