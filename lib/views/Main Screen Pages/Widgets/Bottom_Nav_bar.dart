import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Orders%20Pages/your_orders.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Seller%20Pages/add_product.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Seller%20Pages/seller_products.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Seller%20Pages/your_products.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/favourites_page.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/home_screen.dart';
import 'package:flutterdemo/views/Scanning%20Pages/ScanHistory.dart';
// import 'package:flutterdemo/views/Scanning%20Pages/scanlist_page.dart';
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
    ScanHistory(),
    YourProductsPage(),
    CustomTabBarWidget(),
    YourOrdersPage(),
  ];

  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _selectedIndex != 0
          ? null
              : MyAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
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
            icon: Icon(Icons.favorite_border_outlined,
                color: Color.fromRGBO(74, 78, 105, 1.0)),
            label: 'Favourites',
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