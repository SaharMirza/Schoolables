import 'package:flutter/material.dart';
import 'package:flutterdemo/views/Map%20Screen%20Pages/map_screen_popup.dart';
import 'package:flutterdemo/views/Map%20Screen%20Pages/select_area.dart';

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
        backgroundColor: const Color.fromRGBO(178, 5, 4, 0.65),
        child: InkWell(
          onTap: (){
             Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                        const MapScreenPopUp()),
              );
          },
          child: const Icon(
            
            Icons.location_on_outlined,
          ),
        ),
    );
  }
}
