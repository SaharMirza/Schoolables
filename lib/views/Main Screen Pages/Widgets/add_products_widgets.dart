import 'package:flutter/material.dart';
import 'package:flutterdemo/provider/categories_provider.dart';
import 'package:flutterdemo/provider/product_provider.dart';
import 'package:flutterdemo/provider/student_provider.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Seller%20Pages/add_product.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Seller%20Pages/seller_products.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Seller%20Pages/your_products.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/Bottom_Nav_bar.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/my_profile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';

class UploadPictureCard extends StatefulWidget {
  const UploadPictureCard(
      {super.key, required this.screenWidth, required this.screenHeight});
  final double screenWidth;
  final double screenHeight;

  @override
  State<UploadPictureCard> createState() => _UploadPictureCardState();
}

class _UploadPictureCardState extends State<UploadPictureCard> {
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
                decoration: BoxDecoration(
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
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.upload_rounded,
                ),
                label: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "Add Photos",
                    style: const TextStyle(color: MyColors.buttonTextColor),
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: MyColors.textColor),
                  ),
                  backgroundColor: MyColors.startColor,
                  textStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )
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
        TextFieldLabel(text: "Description"),
        Container(
          height: widget.screenWidth * 0.2,
          margin: EdgeInsets.all(12),
          child: TextFormField(
            maxLines: 5,
            minLines: 2,
            decoration: InputDecoration(
              // contentPadding:
              //     EdgeInsets.symmetric(vertical: 40.0, horizontal: 20),
              hintText: "Describe what you're selling",
              fillColor: MyColors.textFieldColor,
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(8)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.textColor, width: 1.5),
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
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldLabel(text: "Location*"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: widget.screenWidth * 0.5,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Type location or choose",
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Text("Choose", style: TextStyle(color: MyColors.textColor)),
              ),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                backgroundColor: Colors.white,
                side: BorderSide(
                  color: MyColors.textColor,
                  width: 2,
                ),
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
  List<String> category = [];
  List<String> subCategory = [];
  List<String> condition = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];

  String _currentCategory = 'Books';
  String _currentConditon = '1';
  String _currentSubCategory = 'English';
  @override
  Widget build(BuildContext context) {
    final userProfile = context.read<UserProvider>().userProfile;
    final categories = context.read<CategoriesProvider>().categories;
    for (int i = 0; i < categories.length; i++) {
      if (categories[i].parentID == "0") {
        category.add(categories[i].catName.toString());
      } else {
        subCategory.add(categories[i].catName.toString());
      }
    }
    List<String> images = ["URL 1", "URL 2"];
    List<String> bidingIDs = [];

    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _priceController = TextEditingController();

    // Widget dropDown(_value, List<String> _list) {
    //   return StatefulBuilder(builder: ((context, setState) {
    //     return DropdownButton(
    //       value: _value,
    //       borderRadius: BorderRadius.all(Radius.circular(5.0)),
    //       icon: const Icon(Icons.arrow_downward_sharp),
    //       isExpanded: true,
    //       items: _list.map((String items) {
    //         return DropdownMenuItem(
    //           value: items,
    //           child: Text(items),
    //         );
    //       }).toList(),
    //       onChanged: (value) {
    //         print(value);
    //         _value = value;
    //         setState(() {});
    //         print(_value);
    //       },
    //     );
    //   }));
    // }

    // Widget dropDown(_value, List<String> _list) {
    //   return StatefulBuilder(builder: ((context, setState) {
    //     return DecoratedBox(
    //         decoration: BoxDecoration(
    //           border: Border.all(color: Colors.black38),
    //           borderRadius: BorderRadius.circular(8),
    //         ),
    //         child: Padding(
    //             padding: EdgeInsets.only(left: 10, right: 2),
    //             child: DropdownButton(
    //                  value: _value,
    //                 hint: Text(_value.toString()),
    //                 isExpanded: true,
    //                 underline: Container(),
    //                 focusColor: Colors.white,
    //                 items: _list.map((String items) {
    //                   return DropdownMenuItem(
    //                     value: items,
    //                     child: Text(items),
    //                   );
    //                 }).toList(),
    //                  onChanged: (value) {
    //         print(value);
    //         _value = value;
    //         setState(() {});
    //         print(_value);
    //       },
    //               )
    //            ));
    // }));
    // }

    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: FormTextField(
                FieldLabel: "Title",
                hintText: "Title",
                controller: _titleController),
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Category", style: MyStyles.googleTextFieldLabelStyle),
                  dropdownCategory()
                ],
              )
              // DropDown(
              //   dropdownLabel: "Category",
              // ),
              ),
          Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sub Category",
                      style: MyStyles.googleTextFieldLabelStyle),
                  dropDownSubCategory()
                ],
              )
              // DropDown(
              //   dropdownLabel: "Category",
              // ),
              ),
          Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Condition", style: MyStyles.googleTextFieldLabelStyle),
                  dropdownCondition()
                ],
              )
              // DropDown(
              //   dropdownLabel: "Category",
              // ),
              ),
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 8.0),
          //   child:
          //       FormTextField(FieldLabel: "Condition", hintText: "Condition"),
          // ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: FormTextField(
                FieldLabel: "Price",
                hintText: "Price",
                controller: _priceController),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 8.0),
          //   child: EnlargedTextField(screenWidth: widget.screenWidth),
          // ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: LocationTextFieldNBtn(screenWidth: widget.screenWidth),
          ),
          SizedBox(
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
                Icon(Icons.info_outlined),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Pickup point helps the buyer to locate where your book is located. You an change the location and mark it near your college as to reach more number of potential buyers.",
                    style: MyStyles.googleTitleText(widget.screenWidth * 0.03),
                  ),
                )
              ]),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  print(_currentConditon);
                  context.read<ProductsProvider>().addProduct(
                      _titleController.text,
                      userProfile.id,
                      images,
                      bidingIDs,
                      _currentCategory,
                      _currentSubCategory,
                      _currentConditon,
                      int.parse(_priceController.text));
                  context.read<ProductsProvider>().fetchProducts();
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BottomNavBar(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Add Product",
                      style: TextStyle(color: Colors.white)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.buttonColor,
                ),
              ))
        ],
      ),
    );
  }

  StatefulBuilder dropdownCondition() {
    return StatefulBuilder(builder: ((context, setState) {
      return DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black38),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
              padding: EdgeInsets.only(left: 10, right: 2),
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
                  setState(() {});
                  print(_currentConditon);
                },
              )));
    }));
  }

  StatefulBuilder dropDownSubCategory() {
    return StatefulBuilder(builder: ((context, setState) {
      return DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black38),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
              padding: EdgeInsets.only(left: 10, right: 2),
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
                  setState(() {});
                  print(_currentSubCategory);
                },
              )));
    }));
  }

  StatefulBuilder dropdownCategory() {
    return StatefulBuilder(builder: ((context, setState) {
      return DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black38),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
              padding: EdgeInsets.only(left: 10, right: 2),
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
            builder: (context) => AddProductPage(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Add Product", style: TextStyle(color: Colors.white)),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.buttonColor,
      ),
    );
  }
}
