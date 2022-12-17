//Seperate List View widget for Edit Profile Screen
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/Entities/student_entity.dart';
import 'package:flutterdemo/Entities/user_auth_entity.dart';
import 'package:flutterdemo/constants/fonts.dart';
// import 'package:flutterdemo/models/user_model.dart';
import 'package:flutterdemo/provider/student_provider.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Orders%20Pages/buying_orders.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Orders%20Pages/selling_orders.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Profile%20Pages/edit_profile_information.dart';
import 'package:intl/intl.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';
import '../../../constants/colors.dart';

class MyProfileListView extends StatelessWidget {
  const MyProfileListView({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);
  final double screenHeight;
  final double screenWidth;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        //Can add ListView here to make the list tiles scrollable
        children: [
          MyProfileListTile(
              icon: Icons.wallet,
              title: "My Orders and Products",
              subtitle: "Your Products, Orders, billing and invoices",
              screenHeight: screenHeight,
              screenWidth: screenHeight),
          MyProfileListTile(
            icon: Icons.settings,
            title: "Settings",
            subtitle: "Privacy and manage accounts",
            screenHeight: screenHeight,
            screenWidth: screenHeight,
          ),
          MyProfileListTile(
              screenHeight: screenHeight,
              screenWidth: screenHeight,
              icon: Icons.help,
              title: "Help and Support",
              subtitle: "Help Center and Legal Terms "),
          MyProfileListTile(
              screenHeight: screenHeight,
              screenWidth: screenHeight,
              icon: Icons.person,
              title: "Switch Accounts",
              subtitle: "Switch between profiles"),
        ],
      ),
    );
  }
}

//List Tiles widget used in MyProfileListView
class MyProfileListTile extends StatelessWidget {
  const MyProfileListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;
  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: screenHeight * 0.125,
      // height: screenWidth < 300 ? 70 : 90,
      decoration:
          BoxDecoration(color: Colors.white, // Your desired background color
              // borderRadius: BorderRadius.circular(15),
              boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 5),
          ]),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Center(
          child: ListTile(
            onTap: () async {
              if (title == "Selling Orders") {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SellingOrders(),
                  ),
                );
              } else if (title == "Buying Orders") {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BuyingOrders(),
                  ),
                );
              }
            },
            leading: Icon(
              icon,
              color: MyColors.textColor,
            ),
            title: Container(
              child: Text(
                title,
                style: MyStyles.googleTextListTile(screenWidth < 300 ? 15 : 18),
              ),
            ),
            subtitle: Text(
              subtitle,
              style: MyStyles.googleTextSubtitleListTile(
                  screenWidth < 300 ? 10 : 13),
            ),
            trailing: const Icon(
              Icons.navigate_next,
              color: MyColors.textColor,
            ),
          ),
        ),
      ),
    );
  }
}

class MyProfileTextWidget extends StatelessWidget {
  const MyProfileTextWidget({
    Key? key,
    required this.text,
    required this.screenWidth,
  }) : super(key: key);
  final String text;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: MyStyles.googleTitleText(screenWidth * 0.07),
    );
  }
}

class LogoutBtnWidget extends StatefulWidget {
  const LogoutBtnWidget({super.key});

  @override
  State<LogoutBtnWidget> createState() => _LogoutBtnWidgetState();
}

class _LogoutBtnWidgetState extends State<LogoutBtnWidget> {
  @override
  Widget build(BuildContext context) {
    final userAuth = Provider.of<UserAuth?>(context);
    // final _auth = AuthService();
    return ElevatedButton(
      onPressed: () async {
        // logout
        FirebaseAuth.instance.signOut();
        print("Logged out");
        setState(() {});
        // pop until login page
        Navigator.popUntil(context, (route) => route.isFirst);
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.buttonColor, shadowColor: Colors.grey),
      child: userAuth?.id != null
          ? Text(
              "Logout",
              style: MyStyles.btnTextStyle,
            )
          : Text(
              "Login",
              style: MyStyles.btnTextStyle,
            ),
    );
  }
}
// class LogoutBtnWidget extends StatelessWidget {
//   const LogoutBtnWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final _auth = AuthService();
//     return ElevatedButton(
//       onPressed: () async {
//         // logout
//         await _auth.signOut();
//         // pop until login page
//         Navigator.popUntil(context, (route) => route.isFirst);
//       },
//       child: Text(
//         "Logout",
//         style: MyStyles.btnTextStyle,
//       ),
//       style: ElevatedButton.styleFrom(
//           backgroundColor: MyColors.buttonColor, shadowColor: Colors.grey),
//     );
//   }
// }

class MyProfileNameCard extends StatelessWidget {
  const MyProfileNameCard({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);
  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    final userProfile = context.watch<UserProvider>().userProfile;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: ProfileIcon(
                userProfile: userProfile, radius: screenWidth * 0.15),
          ),
          SizedBox(
            // height: screenHeight * 0.165,
            width: screenWidth * 0.49,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  userProfile.name,
                  style: MyStyles.googleTextListTile(screenWidth * 0.06),
                ),
                InkWell(
                  onTap: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const EditProfileInformation(),
                      ),
                    );
                  },
                  child: Text("View Profile and Edit Profile",
                      style: MyStyles.googleTextSubtitleListTile(
                          screenWidth * 0.033)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NavigateBackWidget extends StatelessWidget {
  const NavigateBackWidget({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);
  final double screenWidth;
  final double screenHeight;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Icon(
        Icons.navigate_before,
        color: Colors.black,
        size: screenWidth * 0.07,
      ),
      onTap: () {
        Navigator.of(context).pop();
      },
    );
  }
}

// Widget for EditProfileCard includes profile icon, title and save button
class EditProfileCard extends StatelessWidget {
  const EditProfileCard({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);
  final double screenHeight;
  final double screenWidth;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyProfileTextWidget(
          text: "Edit Profile",
          screenWidth: screenWidth,
        ),
        SaveBtn(screenHeight: screenHeight, screenWidth: screenWidth),
      ],
    );
  }
}

// Change Profile picture widget
class EditProfileIcon extends StatefulWidget {
  const EditProfileIcon(
      {super.key, required this.screenHeight, required this.screenWidth});
  final double screenHeight;
  final double screenWidth;

  @override
  State<EditProfileIcon> createState() => _EditProfileIconState();
}

class _EditProfileIconState extends State<EditProfileIcon> {
  @override
  Widget build(BuildContext context) {
    final userProfile = context.watch<UserProvider>().userProfile;
    return Center(
      child: Badge(
        badgeContent: Icon(
          Icons.add_a_photo_outlined,
          size: widget.screenWidth * 0.06,
        ),
        badgeColor: MyColors.startColor,
        position: BadgePosition.bottomEnd(bottom: 3, end: 6),
        child: ProfileIcon(
            userProfile: userProfile,
            radius: widget.screenWidth * 0.2 - widget.screenHeight * 0.009),
      ),
    );
  }
}

// Text Fields section for User's contact information
class ContactInformationSection extends StatelessWidget {
  const ContactInformationSection({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);
  final double screenHeight;
  final double screenWidth;
  @override
  Widget build(BuildContext context) {
    final TextEditingController numberController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final userProfile = context.watch<UserProvider>().userProfile;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
          child: Text("Contact Information",
              style: MyStyles.googleSecondTitleText(
                  screenWidth * 0.07 - screenHeight * 0.008)),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: FormTextField(
            FieldLabel: "Phone Number",
            hintText: userProfile.phone,
            controller: numberController,
            isEmpty: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: FormTextField(
            FieldLabel: "Email",
            hintText: userProfile.email,
            controller: emailController,
            isEmpty: false,
          ),
        ),
      ],
    );
  }
}

// TextField section for Basic Information section
class BasicInformationSection extends StatelessWidget {
  const BasicInformationSection({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);
  final double screenHeight;
  final double screenWidth;
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final userProfile = context.watch<UserProvider>().userProfile;
    // final TextEditingController _priceController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
          child: Text("Basic Information",
              style: MyStyles.googleSecondTitleText(
                  screenWidth * 0.07 - screenHeight * 0.008)),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: FormTextField(
            FieldLabel: "User Name",
            hintText: userProfile.name,
            controller: nameController, isEmpty: false,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: DatePickerTextField(),
        ),
      ],
    );
  }
}

// Custom Text Field Widget
class FormTextField extends StatefulWidget {
  const FormTextField({
    super.key,
    required this.FieldLabel,
    required this.hintText,
    required this.controller,
    required this.isEmpty,
  });
  final bool isEmpty;
  final String FieldLabel;
  final TextEditingController controller;
  final String hintText;
  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldLabel(text: widget.FieldLabel),
          TextField(
            controller: widget.controller,
            decoration: InputDecoration(
              hintText: widget.hintText,
              fillColor: MyColors.textFieldColor,
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.isEmpty == true ? Colors.red : Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(8)),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: MyColors.textColor, width: 1.5),
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Text Field Label
class TextFieldLabel extends StatelessWidget {
  const TextFieldLabel({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: MyStyles.googleTextFieldLabelStyle);
  }
}

// Custom dropdown
class DropDown extends StatefulWidget {
  const DropDown({super.key, required this.dropdownLabel});
  final String dropdownLabel;
  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  late String? selectedValue = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.dropdownLabel, style: MyStyles.googleTextFieldLabelStyle),
        DecoratedBox(
          decoration: BoxDecoration(
            border: selectedValue == ""
                ? Border.all(color: Colors.black38)
                : Border.all(
                    color: MyColors.textColor,
                    width: 1.5), //border of dropdown button
            borderRadius: selectedValue == ""
                ? BorderRadius.circular(8)
                : BorderRadius.circular(25), //border raiuds of dropdown button
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 2),
            child: DropdownButton<String>(
              hint: selectedValue == ""
                  ? const Text("Gender")
                  : Text(selectedValue.toString()),
              isExpanded: true,
              underline: Container(),
              focusColor: Colors.white,
              items: <String>['Male', "Female"].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                selectedValue = value;
                setState(() {});
              },
            ),
          ),
        ),
      ],
    );
  }
}

// Save button
class SaveBtn extends StatefulWidget {
  const SaveBtn(
      {super.key, required this.screenHeight, required this.screenWidth});
  final double screenHeight;
  final double screenWidth;
  @override
  State<SaveBtn> createState() => _SaveBtnState();
}

class _SaveBtnState extends State<SaveBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Text("Save",
          style: MyStyles.underlinedGreyText(widget.screenWidth * 0.05)),
    );
  }
}

// Custom DatePicker
class DatePickerTextField extends StatefulWidget {
  const DatePickerTextField({super.key});

  @override
  State<DatePickerTextField> createState() => _DatePickerTextFieldState();
}

class _DatePickerTextFieldState extends State<DatePickerTextField> {
  TextEditingController dateinput = TextEditingController();

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProfile = context.watch<UserProvider>().userProfile;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextFieldLabel(text: "Date Of Birth"),
        Container(
            child: Center(
                child: TextField(
          controller: dateinput, //editing controller of this TextField
          decoration: InputDecoration(
            fillColor: MyColors.textFieldColor,
            border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: MyColors.textColor, width: 1.5),
              borderRadius: BorderRadius.circular(25.0),
            ),
            suffixIcon: const Padding(
              padding: EdgeInsets.all(2.0),
              child: Icon(
                Icons.calendar_month_outlined,
                color: MyColors.textColor,
              ),
            ),
            //icon of text field
            hintText: userProfile.dob,
          ),
          readOnly: true, //set it true, so that user will not able to edit text
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(
                  2000), //DateTime.now() - not to allow to choose before today.
              lastDate: DateTime(2101),
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: const ColorScheme.light(
                      primary: MyColors.startColor, // <-- SEE HERE
                      onPrimary: Colors.white, // <-- SEE HERE
                      onSurface: MyColors.textColor, // <-- SEE HERE
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        foregroundColor: MyColors.textColor, // button text color
                      ),
                    ),
                  ),
                  child: child!,
                );
              },
            );

            if (pickedDate != null) {
              print(
                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
              String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);
              print(
                  formattedDate); //formatted date output using intl package =>  2021-03-16
              //you can implement different kind of Date Format here according to your requirement

              setState(() {
                dateinput.text =
                    formattedDate; //set output date to TextField value.
              });
            } else {
              print("Date is not selected");
            }
          },
        ))),
      ],
    );
  }
}

class ProfileIcon extends StatefulWidget {
  const ProfileIcon(
      {super.key, required this.userProfile, required this.radius});
  final UserProfile userProfile;
  final double radius;
  @override
  State<ProfileIcon> createState() => _ProfileIconState();
}

class _ProfileIconState extends State<ProfileIcon> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: widget.radius,
      backgroundColor: Colors.white,
      child: Image(
        image: NetworkImage(widget.userProfile.display.isEmpty
            ? "https://img.icons8.com/bubbles/50/000000/user.png"
            : widget.userProfile.display),
      ),
    );
  }
}
