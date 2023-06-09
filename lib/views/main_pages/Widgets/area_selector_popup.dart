import '../../../imports.dart';

class AreaSeletorPopup extends StatefulWidget {
  const AreaSeletorPopup({super.key});

  @override
  State<AreaSeletorPopup> createState() => _AreaSeletorPopupState();
}

class _AreaSeletorPopupState extends State<AreaSeletorPopup> {
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
    locationList =
        Provider.of<LocationProvider>(context, listen: false).locationList;
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
    bool initial = false;

    showLoaderDialog(BuildContext context) {
      AlertDialog alert = AlertDialog(
        content: new Row(
          children: [
            CircularProgressIndicator(),
            Container(
                margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
          ],
        ),
      );
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    Widget popup() {
      return AlertDialog(
        backgroundColor: MyColors.startColor,
        title: const Text('Select your area'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color:  const Color.fromRGBO(242, 233, 228, 1.0),
              ),
              width: screenWidth * 0.75,
              child: ButtonTheme(
                alignedDropdown: true,
                child: StatefulBuilder(
                  builder: (context, setState) {
                    return DropdownButton(
                      menuMaxHeight: screenHeight * 0.2,
                      isExpanded: true,
                      dropdownColor:  const Color.fromRGBO(242, 233, 228, 1.0),
                      value: dropdownValue,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
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
                  style: TextButton.styleFrom(
                      backgroundColor: MyColors.buttonColor),
                  child:
                      const Text('OK', style: TextStyle(color: MyColors.buttonTextColor)),
                  onPressed: () async {
                    if (selectedIndex == 0) {
                      showDialog(
                        barrierDismissible: false,
                        context: context, // user must tap button!
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor:
                                MyColors.startColor,
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
                                          backgroundColor:
                                              MyColors.buttonColor),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 18.0),
                                        child: Text('OK',
                                            style: GoogleFonts.poppins(
                                                color: MyColors.buttonTextColor,
                                                // fontSize: screenHeight * 0.03
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
                    } else {
                      dropdownValue = locationList[selectedIndex - 1].areaName;
                      setState(() {});
                      //fetch product id in areas of selected area name
                      List<Area> areas = locationList[selectedIndex - 1].areas;
                      List<String> pids = [];
                      for (Area area in areas) {
                        pids.add(area.id);
                      }
                      //provider for updating product ids of nearby product
                      // Future.delayed(
                      //   const Duration(seconds: 1),
                      //   () {
                      //     initial = true;
                      //     setState(() {});
                      //   },
                      // );
                      initial = await context
                          .read<ProductsProvider>()
                          .loadNearbyProducts(pids);
                      if (initial == true) {
                        Navigator.pop(context);
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      );
    }

    return InkWell(
      onTap: () {
        showDialog(
            barrierDismissible: false,
            context: context, // user must tap button!
            builder: (context) {
              return popup();
            });
      },
      child: Text(
        " $dropdownValue , Karachi",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10,
          color: Color.fromRGBO(74, 78, 105, 1.0),
        ),
      ),
    );
  }
}
