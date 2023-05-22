import 'package:flutterdemo/text_validator.dart';

import '../../imports.dart';
import '../main_pages/Widgets/textfield.dart';

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
  final String _currentschoolName = 'City School';
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
  final String _currentgrade = '1';

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

    Widget dropDown(value, List<String> list) {
      return StatefulBuilder(builder: ((context, setState) {
        return DropdownButton(
          value: value,
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          icon: const Icon(Icons.arrow_downward_sharp),
          isExpanded: true,
          items: list.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          onChanged: (newValue) => setState(() => value = newValue!),
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
                SchoolablesTextField(
                    label: "User Name",
                    // hintText: "Name",
                    controller: _nameController),
                // Phone Number TextField
                SchoolablesTextField(
                  label: "Phone Number",
                  // hintText: "Phone Number",
                  controller: _phoneController,
                  textType: TextInputType.number,
                  validatorFunction: TextValidator.phoneNumber,
                ),
                //Schoolname dropdown
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextFieldLabel(text: "School Name"),
                    dropDown(_currentschoolName, schoolName),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextFieldLabel(text: "Grade"),
                    dropDown(_currentgrade, grade),
                  ],
                ),
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
              child: const Text("Skip",
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
