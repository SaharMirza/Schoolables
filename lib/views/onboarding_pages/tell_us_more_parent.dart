
import 'package:flutterdemo/views/main_pages/Widgets/textfield.dart';

import '../../imports.dart';

class TellUsMoreParent extends StatefulWidget {
  const TellUsMoreParent({super.key});

  @override
  State<TellUsMoreParent> createState() => _TellUsMoreParentState();
}

class _TellUsMoreParentState extends State<TellUsMoreParent> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    void register() {
      if (_nameController.text.isEmpty || _phoneController.text.isEmpty) {
        // Blank Details
        dialogs.errorDialog(context, "Error", "Please fill all the fields");
      } else {
        // Update in UserProfile
        context.read<ParentProvider>().updateparentInfo(
            name: _nameController.text, phone: _phoneController.text);
        context.read<ParentProvider>().saveChanges();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const SuccessScreen(nextPage: CreateChildrenProfile())));
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(height: screenHeight * 0.05),
              Text(
                "Tell Us More",
                style: MyStyles.googleTitleText(
                    MediaQuery.of(context).size.width * 0.07),
              ),
              SizedBox(height: screenHeight * 0.04),
              Inputs(),
              Buttons(
                ButtonName: "Next",
                role: "Parent",
                functionToComply: register,
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

  Widget Inputs() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // Name TextField
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
              ),
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
