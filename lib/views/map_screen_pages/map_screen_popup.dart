

import '../../imports.dart';

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

  @override
  void initState() {
    super.initState();
    product_controller = TextEditingController();
    getLocations();

  }

  Future getLocations() async {
    await Provider.of<LocationProvider>(context, listen: false).getLocation();
    locationList = Provider.of<LocationProvider>(context, listen: false).locationList;
    for (var area in locationList) {
      areaList.add(area.areaName);
    }
  }

  @override
  void dispose() {
    product_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: AlertDialog(
        backgroundColor: MyColors.startColor,
           title: const Text('Select your area'),
        actions: <Widget>[
          Padding(
            padding:
            const EdgeInsets.all(8),
            child: Container(
              decoration:const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: const Color.fromRGBO(242, 233, 228, 1.0),
              ),
              width: screenWidth * 0.75,
              child: ButtonTheme(
                alignedDropdown: true,
                child: StatefulBuilder(builder: (context, setState) {
                  return DropdownButton(
                    menuMaxHeight: screenHeight * 0.2,
                    isExpanded: true,
                    dropdownColor: const Color.fromRGBO(242, 233, 228, 1.0),
                    value: dropdownValue,
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    icon: const Icon(Icons.arrow_downward_sharp),
                    underline: const DecoratedBox(
                      decoration: BoxDecoration(color: const Color.fromRGBO(242, 233, 228, 1.0)),
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
                        dropdownValue = newValue;
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
                  TextButton.styleFrom(backgroundColor: MyColors.buttonColor),
                  child: const Text('Continue', style: TextStyle(color: MyColors.buttonTextColor)),
                  onPressed: () {
                    if (selectedIndex == 0) {
                      showDialog(
                        barrierDismissible: false,
                        context: context, // user must tap button!
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: MyColors.startColor,
                            title: Column(
                              children: const [
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
                                          backgroundColor: MyColors.buttonColor),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 18.0),
                                        child: Text('OK',
                                            style: GoogleFonts.poppins(
                                                color: MyColors.buttonTextColor,
                                                )),
                                      ),
                                      onPressed: () {
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
                    }
                    else {
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
                  TextButton.styleFrom(backgroundColor: MyColors.buttonColor),
                  child: const Text('Cancel', style: TextStyle(color: MyColors.buttonTextColor)),
                  onPressed: () {
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

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return const DropDown(

    );
  }
}

