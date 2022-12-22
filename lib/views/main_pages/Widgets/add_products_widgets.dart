import 'package:geolocator/geolocator.dart';

import '../../../imports.dart';

List<XFile> acceptedImages = [];

class UploadPictureCard extends StatefulWidget {
  const UploadPictureCard(
      {super.key, required this.screenWidth, required this.screenHeight});

  final double screenWidth;
  final double screenHeight;

  @override
  State<UploadPictureCard> createState() => _UploadPictureCardState();
}

class _UploadPictureCardState extends State<UploadPictureCard> {
  bool _loading = false;
  List<dynamic>? _outputs;
  bool wrong = false;
  final ImagePicker picker = ImagePicker();

  loadModel() async {
    Tflite.close();
    var res = (await Tflite.loadModel(
      model: "assets/model/model_unquant.tflite",
      labels: "assets/model/labels.txt",
    ))!;
    print("Models loading status: $res");
  }

  classifyImage(image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _loading = false;
//Declare List _outputs in the class which will be used to show the classified classs name and confidence
      _outputs = output;
    });
    print(_outputs);
    if (output?[0]["label"] != "4 Misc") {
      setState(() {
        wrong = false;
      });
      acceptedImages.add(image);
    } else {
      setState(() {
        wrong = true;
      });
    }
  }

  Future classifyImageFromGallery() async {
    XFile? picture = pickImageFromGallery();
    classifyImage(picture);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadModel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Add up to 20 photos",
              style: MyStyles.googleTextFieldLabelStyle),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: widget.screenWidth * 0.15 + widget.screenHeight * 0.1,
                decoration: const BoxDecoration(
                  // border: Border.all(color: MyColors.buttonColor),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        MyColors.buttonColor,
                        MyColors.startColor
                      ]),
                ),
              ),
              acceptedImages.isEmpty
                  ? ElevatedButton.icon(
                      onPressed: () {
                        pickImageFromGallery();
                      },
                      icon: const Icon(
                        Icons.upload_rounded,
                      ),
                      label: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "Add Photos",
                          style: TextStyle(color: MyColors.buttonTextColor),
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: MyColors.textColor),
                        ),
                        backgroundColor: MyColors.startColor,
                        textStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 130,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: const ScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: acceptedImages.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      fit: StackFit.loose,
                                      children: [
                                        SizedBox(
                                          width: 90,
                                          child: Image.file(
                                            File(acceptedImages[index].path),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              acceptedImages.removeAt(index);
                                            });
                                          },
                                          child: const Icon(
                                            Icons.delete,
                                            color: MyColors.textColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          acceptedImages.length != 20
                              ? GestureDetector(
                                  onTap: (() {
                                    pickImageFromGallery();
                                  }),
                                  child: const Icon(Icons.add),
                                )
                              : Container(),
                        ],
                      ),
                    ),
            ],
          ),
          wrong
              ? Text(
                  "Upload Books/Stationary/Bag's Images",
                  style: TextStyle(color: Colors.red),
                )
              : Text("")
        ],
      ),
    );
  }
}

class EnlargedTextField extends StatefulWidget {
  const EnlargedTextField({super.key, required this.screenWidth});

  final double screenWidth;

  @override
  State<EnlargedTextField> createState() => _EnlargedTextFieldState();
}

class _EnlargedTextFieldState extends State<EnlargedTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextFieldLabel(text: "Description"),
        Container(
          height: widget.screenWidth * 0.2,
          margin: const EdgeInsets.all(12),
          child: TextFormField(
            maxLines: 5,
            minLines: 2,
            decoration: InputDecoration(
              hintText: "Describe what you're selling",
              fillColor: MyColors.textFieldColor,
              border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(8)),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: MyColors.textColor, width: 1.5),
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LocationTextFieldNBtn extends StatefulWidget {
  const LocationTextFieldNBtn({super.key, required this.screenWidth});

  final double screenWidth;

  @override
  State<LocationTextFieldNBtn> createState() => _LocationTextFieldNBtnState();
}

class _LocationTextFieldNBtnState extends State<LocationTextFieldNBtn> {
  String _locationcontroller = "Your Current Location";
  @override
  Widget build(BuildContext context) {
    late String lat;
    late String long;

    Future<Position> _getCurrentLocation() async {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error("Location services are disabled");
      }
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error(
              "Location permissions are denied, we cannot request permission");
        }
      }
      return await Geolocator.getCurrentPosition();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextFieldLabel(text: "Location*"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: widget.screenWidth * 0.5,
              child: Text(_locationcontroller),
            ),
            OutlinedButton(
              onPressed: () {
                _getCurrentLocation().then((value) {
                  lat = '${value.latitude}';
                  long = '${value.longitude}';
                  setState(() {
                    _locationcontroller = 'Latitude : $lat, Longitude : $long';
                  });
                });
              },
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                backgroundColor: Colors.white,
                side: const BorderSide(
                  color: MyColors.textColor,
                  width: 2,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Get Location",
                    style: TextStyle(color: MyColors.textColor)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AddProductFields extends StatefulWidget {
  const AddProductFields(
      {super.key, required this.screenWidth, required this.screenHeight});

  final double screenWidth;
  final double screenHeight;

  @override
  State<AddProductFields> createState() => _AddProductFieldsState();
}

class _AddProductFieldsState extends State<AddProductFields> {
  List<String> category = ["Books", "Stationary", "Bags"];
  List<String> subCategory = [
    "English",
    "Math",
    "Urdu",
    "Science",
    "Computer",
    "Pen",
    "Leather Bag",
    "Calculator",
    "Parachute Bag"
  ];
  List<String> condition = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  bool isEmpty = false;
  var downloadUrls = [];
  bool isAdd = false;

  String _currentCategory = "Books";
  String _currentConditon = '1';
  String _currentSubCategory = "English";

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    titleController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProfile = context.read<UserProvider>().userProfile;
    final isLoading = context.watch<UserProvider>().isLoading;

//function which stores images uploaded by the user in firebase storages and returns their download urls.
    storeImagesinStorage(acceptedImages) async {
      List<File> finalImages = [];
      for (XFile i in acceptedImages) {
        finalImages.add(File(i.path));
      }
      downloadUrls =
          await context.read<ProductsProvider>().getDownloadUrls(finalImages);
    }

//Saves the product into firebase.
    void saveMyProduct() async {
      var product = Product(
          sellerID: userProfile.id,
          title: titleController.text,
          price: int.parse(priceController.text),
          images: downloadUrls,
          category: _currentCategory,
          subCategory: _currentSubCategory,
          condition: _currentConditon);

      if (downloadUrls.isNotEmpty) {
        var productid =
            await context.read<ProductsProvider>().addProduct(product);
        context.read<UserProvider>().addNewProduct(productid);
        context.read<UserProvider>().saveChanges();

        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const BottomNavBar(),
          ),
        );

        titleController.clear();
        priceController.clear();
        acceptedImages = [];
      }
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: FormTextField(
            FieldLabel: "Title",
            hintText: "Title",
            controller: titleController,
            isEmpty: false, onValueChanged: (String ) {  },
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Category", style: MyStyles.googleTextFieldLabelStyle),
                dropdownCategory()
              ],
            )),
        Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sub Category", style: MyStyles.googleTextFieldLabelStyle),
                dropDownSubCategory()
              ],
            )),
        Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Condition", style: MyStyles.googleTextFieldLabelStyle),
                dropdownCondition()
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: FormTextField(
            FieldLabel: "Price",
            hintText: "Price",
            controller: priceController,
            isEmpty: false, onValueChanged: (String ) {  },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: LocationTextFieldNBtn(screenWidth: widget.screenWidth),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: widget.screenHeight * 0.15 - widget.screenWidth * 0.02,
          decoration: BoxDecoration(
              border: Border.all(color: MyColors.textColor),
              color: MyColors.startColor),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              const Icon(Icons.info_outlined),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  "Pickup point helps the buyer to locate where your book is located. You an change the location and mark it near your college as to reach more number of potential buyers.",
                  style: MyStyles.googleTitleText(widget.screenWidth * 0.03),
                ),
              )
            ]),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () async {
                await storeImagesinStorage(acceptedImages);
                saveMyProduct();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.buttonColor,
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child:
                    Text("Add Product", style: TextStyle(color: Colors.white)),
              ),
            ))
      ],
    );
  }

// dropdown widget for Condition
  StatefulBuilder dropdownCondition() {
    return StatefulBuilder(builder: ((context, setState) {
      return DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black38),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 2),
              child: DropdownButton(
                value: _currentConditon,
                hint: Text(_currentConditon),
                isExpanded: true,
                underline: Container(),
                focusColor: Colors.white,
                items: condition.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (value) {
                  print(value);
                  _currentConditon = value!;
                  setState(
                    () {},
                  );
                  print(_currentConditon);
                },
              )));
    }));
  }

// dropdown widget for SubCategory
  StatefulBuilder dropDownSubCategory() {
    return StatefulBuilder(
      builder: ((context, setState) {
        return DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black38),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 2),
            child: DropdownButton(
              value: _currentSubCategory,
              hint: Text(_currentSubCategory),
              isExpanded: true,
              underline: Container(),
              focusColor: Colors.white,
              items: subCategory.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (value) {
                print(value);
                _currentSubCategory = value!;
                setState(
                  () {},
                );
                print(_currentSubCategory);
              },
            ),
          ),
        );
      }),
    );
  }

// dropdown widget for Category
  StatefulBuilder dropdownCategory() {
    return StatefulBuilder(builder: ((context, setState) {
      return DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black38),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 2),
              child: DropdownButton(
                value: _currentCategory,
                hint: Text(_currentCategory),
                isExpanded: true,
                underline: Container(),
                focusColor: Colors.white,
                items: category.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (value) {
                  print(value);
                  _currentCategory = value!;
                  setState(() {});
                  print(_currentCategory);
                },
              )));
    }));
  }
}

class AddProductBtn extends StatefulWidget {
  const AddProductBtn({super.key});

  @override
  State<AddProductBtn> createState() => _AddProductBtnState();
}

class _AddProductBtnState extends State<AddProductBtn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AddProductPage(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.buttonColor,
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("Add Product", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
