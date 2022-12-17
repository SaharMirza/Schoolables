import 'package:flutter/material.dart';
import 'package:flutterdemo/Entities/location_entity.dart';
import 'package:flutterdemo/Repository/location_repository.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/provider/location_provider.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/home_screen.dart';
import 'package:flutterdemo/views/Map%20Screen%20Pages/map_screen_demo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class MapScreenPopUp extends StatefulWidget {
  const MapScreenPopUp({Key? key}) : super(key: key);

  @override
  _MapScreenPopUpState createState() => _MapScreenPopUpState();
}

class _MapScreenPopUpState extends State<MapScreenPopUp> {
  var areaList = ['Select your area'];
  List<Location> locationList = [];
  late TextEditingController product_controller;
  var dropdownValue = 'Select your area';
  int selectedIndex = 0;

  void initState() {
    super.initState();
    product_controller = TextEditingController();
    getLocations();
  }

  Future getLocations() async {
    print("111");
    await Provider.of<LocationProvider>(context, listen: false).getLocation();
    //await context.read<LocationProvider>().getLocation();
    print("222");
    locationList = Provider.of<LocationProvider>(context, listen: false).locationList;
    //locationList = context.watch<LocationProvider>().locationList;
    print("333");
    for (var area in locationList) {
      areaList.add(area.areaName);
    }
  }

  void dispose() {
    product_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body:  AlertDialog(
        backgroundColor: MyColors.startColor,
            title: const Text('Select your area'),
        actions: <Widget>[
          Padding(
            padding:
            EdgeInsets.all(8),
            child: Container(
              decoration:const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Color(0xffDADBC6),
              ),
              width: screenWidth * 0.75,
              //color: Color(0xffDADBC6),
              child: ButtonTheme(
                alignedDropdown: true,
                child: StatefulBuilder(builder: (context, setState) {
                  return DropdownButton(
                    menuMaxHeight: screenHeight * 0.2,
                    isExpanded: true,
                    dropdownColor: Color(0xffDADBC6),
                    value: dropdownValue,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    icon: const Icon(Icons.arrow_downward_sharp),
                    // onTap:() {
                    //   // print(areaList.toString());
                    //   // print(areaList.length);
                    // },
                    underline: DecoratedBox(
                      decoration: BoxDecoration(color: Color(0xffDADBC6)),
                    ),
                    items: areaList.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(items),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedIndex = areaList.indexOf(newValue!);
                        dropdownValue = newValue!;
                      });
                    },
                  );
                },
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenHeight * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  style:
                  TextButton.styleFrom(backgroundColor: Color(0xffBBBD88)),
                  child: Text('Continue', style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    if (selectedIndex == 0) {
                      showDialog(
                        barrierDismissible: false,
                        context: context, // user must tap button!
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: const Color(0xff283618),
                            title: Column(
                              children: [
                               Text('Area not selected'),
                              ],
                            ),
                            actions: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextButton(
                                      style: TextButton.styleFrom(
                                          backgroundColor: Color(0xffFFFDF4)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 18.0),
                                        child: Text('OK',
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize:
                                                screenHeight *
                                                    0.03)),
                                      ),
                                      onPressed: () {
                                        // Navigator.pushAndRemoveUntil(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (BuildContext context) =>
                                        //         MapScreenPopUp(),
                                        //   ),
                                        //       (route) => false,
                                        // );
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MapDemo(
                                selectedLocation:
                                locationList[selectedIndex - 1]),
                          ));
                    }
                  },
                ),
                TextButton(
                  style:
                  TextButton.styleFrom(backgroundColor: Color(0xffBBBD88)),
                  child: Text('Cancel', style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    // Navigator.pushAndRemoveUntil(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (BuildContext context) => const MapScreenPopUp(),
                    //   ),
                    //       (route) => false,
                    // );
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}