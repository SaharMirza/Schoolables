import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/Bottom_Nav_bar.dart';
import 'package:flutterdemo/views/Widgets/buttons.dart';
import 'package:flutterdemo/views/Widgets/textfield.dart';

class TellUsMore extends StatefulWidget {
  const TellUsMore({super.key});

  @override
  State<TellUsMore> createState() => _TellUsMoreState();
}

class _TellUsMoreState extends State<TellUsMore> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final List<String> SchoolNames = <String>[
    'City School',
    'Beacon House',
    'Generation School',
    'Nixor',
    "Others"
  ];
  final List<String> Grade = <String>[
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];

  var dropdownValue = "One";
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(height: screenHeight * 0.05),
              Text(
                "Tell Us More",
                style: MyStyles.googleTitleText(screenWidth * 0.07),
              ),
              SizedBox(height: screenHeight * 0.04),
              Inputs(),
              const Buttons(ButtonName: "Next"),
              SizedBox(height: screenHeight * 0.02),
              // Fill Details Later?
              Skip()
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget Inputs() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // Name TextField
              SchoolablesTextField(
                  FieldLabel: "User Name",
                  hintText: "Name",
                  control: _nameController),
              // Phone Number TextField
              SchoolablesTextField(
                FieldLabel: "Phone Number",
                hintText: "Phone Number",
                control: _phoneController,
                textType: TextInputType.number,
              ),
              //Schoolname dropdown
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextFieldLabel(text: "School Name"),
                  DropDownButton(
                    list: SchoolNames,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextFieldLabel(text: "Grade"),
                  DropDownButton(
                    list: Grade,
                  )
                ],
              ),

              //grade dropdown
            ]),
      ),
    );
  }

  Widget Skip() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text("Want to setup later? "),
          InkWell(
              child: Text("Skip",
                  style: TextStyle(
                      color: MyColors.textColor,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BottomNavBar()));
              })
        ]);
  }
}

class DropDownButton extends StatefulWidget {
  const DropDownButton({Key? key, required this.list}) : super(key: key);

  final List<String> list;

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var dropdownValue = widget.list[0];
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(8)),
        //color: Colors.white,
      ),
      child: ButtonTheme(
        alignedDropdown: true,
        child: StatefulBuilder(builder: ((context, setState) {
          return DropdownButton(
            value: dropdownValue,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            icon: const Icon(Icons.arrow_downward_sharp),
            isExpanded: true,
            items: widget.list.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedIndex = widget.list.indexOf(newValue!);
                dropdownValue = newValue!;
              });
            },
          );
        })),
      ),
    );
  }
}
