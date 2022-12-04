import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:flutterdemo/provider/student_provider.dart';
import 'package:flutterdemo/utils.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/bottom_nav_bar.dart';
import 'package:flutterdemo/views/Widgets/buttons.dart';
import 'package:flutterdemo/views/Widgets/textfield.dart';
import 'package:flutterdemo/views/success_screen.dart';
import 'package:provider/provider.dart';

class TellUsMore extends StatefulWidget {
  const TellUsMore({super.key});

  @override
  State<TellUsMore> createState() => _TellUsMoreState();
}

class _TellUsMoreState extends State<TellUsMore> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final List<String> schoolName = <String>[
    'City School',
    'Beacon House',
    'Generation School',
    'Nixor',
    "Others"
  ];
  String _currentschoolName = 'City School';
  final List<String> grade = <String>[
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
  String _currentgrade = '1';

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    void _register() {
      if (_nameController.text.isEmpty || _phoneController.text.isEmpty) {
        // Blank Details
        dialogs.errorDialog(context, "Error", "Please fill all the fields");
      } else {
        // Update in UserProfile
        context.read<UserProvider>().updateUserInfo(
            name: _nameController.text,
            schoolName: _currentschoolName,
            grade: _currentgrade,
            phone: _phoneController.text);
        context.read<UserProvider>().saveChanges();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const SuccessScreen(nextPage: BottomNavBar())));
      }
    }

    Widget dropDown(_value, List<String> _list) {
      return StatefulBuilder(builder: ((context, setState) {
        return DropdownButton(
          value: _value,
          isExpanded: true,
          items: _list.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          onChanged: (newValue) => setState(() => _value = newValue!),
        );
      }));
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
                  ],
                ),
                dropDown(_currentschoolName, schoolName),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextFieldLabel(text: "Grade"),
                  ],
                ),
                dropDown(_currentgrade, grade),
                //grade dropdown
              ]),
        ),
      );
    }

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
              Buttons(
                ButtonName: "Next",
                functionToComply: _register,
              ),
              SizedBox(height: screenHeight * 0.02),
              // Fill Details Later?
              Skip()
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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
