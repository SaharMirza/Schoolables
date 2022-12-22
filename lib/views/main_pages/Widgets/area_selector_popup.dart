

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
                color: Color(0xffDADBC6),
              ),
              width: screenWidth * 0.75,
              child: ButtonTheme(
                alignedDropdown: true,
                child: StatefulBuilder(
                  builder: (context, setState) {
                    return DropdownButton(
                      menuMaxHeight: screenHeight * 0.2,
                      isExpanded: true,
                      dropdownColor: const Color(0xffDADBC6),
                      value: dropdownValue,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      icon: const Icon(Icons.arrow_downward_sharp),
                      underline: const DecoratedBox(
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
                      backgroundColor: const Color(0xffBBBD88)),
                  child:
                      const Text('OK', style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    if (selectedIndex == 0) {
                      showDialog(
                        barrierDismissible: false,
                        context: context, // user must tap button!
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: const Color.fromARGB(255, 71, 39, 67),
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
                                              const Color(0xffFFFDF4)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 18.0),
                                        child: Text('OK',
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: screenHeight * 0.03)),
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
                      List<Area> areas=locationList[selectedIndex - 1].areas;
                      List<String> pids =[];
                      for(Area area in areas){
                        pids.add(area.id);
                      }
                      //provider for updating product ids of nearby product
                      context.read<ProductsProvider>().loadNearbyProducts(pids);
                      Navigator.pop(context);

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
