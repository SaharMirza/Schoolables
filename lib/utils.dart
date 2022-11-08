import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child:
              // ImageIcon(
              //   AssetImage('assets/Schoolables.png'),
              // ),
              Icon(
            Icons.logo_dev_outlined,
            color: const Color.fromRGBO(74, 78, 105, 1.0),
          )),
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.location_on,
              color: const Color.fromRGBO(74, 78, 105, 1.0)),
          Text('North Nazimabad , Karachi',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: const Color.fromRGBO(74, 78, 105, 1.0))),
        ],
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_circle_outlined,
                size: 30, color: const Color.fromRGBO(74, 78, 105, 1.0)),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
