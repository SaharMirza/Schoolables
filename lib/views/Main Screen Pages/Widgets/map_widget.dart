import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/views/map_screen.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return CircleAvatar(
        radius: screenHeight * 0.04 - screenWidth * 0.02,
        backgroundColor: Color.fromRGBO(178, 5, 4, 0.65),
        child: InkWell(
          onTap: (){
             Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                        MapScreen()),
              );
          },
          child: Icon(
            
            Icons.location_on_outlined,
          ),
        ),
    );
  }
}
