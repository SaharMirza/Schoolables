import 'package:flutter/material.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/my_profile.dart';
import 'package:google_fonts/google_fonts.dart';
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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: FormTextField(FieldLabel: "Title", hintText: "Title"),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: DropDown(
              dropdownLabel: "Category",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child:
                FormTextField(FieldLabel: "Condition", hintText: "Condition"),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: FormTextField(FieldLabel: "Price", hintText: "Price"),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: EnlargedTextField(screenWidth: widget.screenWidth),
          ),
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
            child: AddProductBtn(),
          )
        ],
      ),
    );
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
      onPressed: () {},
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
