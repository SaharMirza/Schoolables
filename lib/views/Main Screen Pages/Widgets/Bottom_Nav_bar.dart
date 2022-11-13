import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Orders%20Pages/your_orders.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/home_screen.dart';

import '../../../constants/fonts.dart';
import 'my_profile.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text(
      'Index 2: Scan List',
      style: optionStyle,
    ),
    Text(
      'Index 2: Seller',
      style: optionStyle,
    ),
    Text(
      'Index 2: Favourites',
      style: optionStyle,
    ),
    YourOrders(), // Your Orders will come here
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    print(_selectedIndex);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _selectedIndex == 4
          ? AppBar(
              centerTitle: true,
              title: Text("Delivery Orders",
                  style: MyStyles.googleSecondTitleText(
                      screenWidth * 0.02 + screenHeight * 0.02)),
              leading: NavigateBackWidget(
                  screenHeight: screenHeight, screenWidth: screenWidth),
              elevation: 0,
              backgroundColor: Colors.white,
              actions: [
                IconButton(
                    iconSize: 50,
                    onPressed: (() {}),
                    icon: ProfileIcon(
                      img:
                          "https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/user-profile-icon.png",
                      radius: screenWidth * 0.03 + screenHeight * 0.01,
                    )
                    // Icon(Icons.account_circle_outlined)
                    ),
              ],
            )
          : MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,
                color: Color.fromRGBO(74, 78, 105, 1.0)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner_outlined,
                color: Color.fromRGBO(74, 78, 105, 1.0)),
            label: 'Scan List',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Color.fromRGBO(74, 78, 105, 1.0),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            label: 'Seller',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner_outlined,
                color: Color.fromRGBO(74, 78, 105, 1.0)),
            label: 'Scan List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined,
                color: Color.fromRGBO(74, 78, 105, 1.0)),
            label: 'Orders',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(74, 78, 105, 1.0),
        onTap: _onItemTapped,
      ),
    );
  }
}
