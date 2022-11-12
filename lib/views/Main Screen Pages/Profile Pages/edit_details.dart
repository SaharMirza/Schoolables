import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils.dart';
import '../../Scanning Pages/scanninglist_page.dart';
import '../Orders Pages/delivery_orders.dart';
import '../Seller Pages/seller_products.dart';
import '../Widgets/Bottom_Nav_bar.dart';
import '../Widgets/my_profile.dart';
import '../favourites_page.dart';
import '../home_screen.dart';

class EditDetailsPage extends StatefulWidget {
  const EditDetailsPage({super.key});

  @override
  State<EditDetailsPage> createState() => _EditDetailsPageState();
}

class _EditDetailsPageState extends State<EditDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: NavigateBackWidget(
          screenWidth: screenWidth,
          screenHeight: screenHeight,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyProfileTextWidget(
                        text: "My Profile", screenWidth: screenWidth),
                  ),
                  LogoutBtnWidget(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: MyProfileNameCard(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                ),
              ),
              MyProfileListView(
                  screenHeight: screenHeight, screenWidth: screenWidth),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home_outlined,
      //           color: Color.fromRGBO(74, 78, 105, 1.0)),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.document_scanner_outlined,
      //           color: Color.fromRGBO(74, 78, 105, 1.0)),
      //       label: 'Scan List',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: CircleAvatar(
      //         backgroundColor: Color.fromRGBO(74, 78, 105, 1.0),
      //         child: Icon(
      //           Icons.add,
      //           color: Colors.white,
      //         ),
      //       ),
      //       label: 'Seller',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.document_scanner_outlined,
      //           color: Color.fromRGBO(74, 78, 105, 1.0)),
      //       label: 'Scan List',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.shopping_bag_outlined,
      //           color: Color.fromRGBO(74, 78, 105, 1.0)),
      //       label: 'Orders',
      //     ),
      //   ],
      //   currentIndex: 1,
      //   selectedItemColor: const Color.fromRGBO(74, 78, 105, 1.0),
      //   onTap: ((value) {}),
      // ),
    );
  }
}
