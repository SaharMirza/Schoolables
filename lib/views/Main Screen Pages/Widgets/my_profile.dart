//Seperate List View widget for Edit Profile Screen
import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:badges/badges.dart';
import '../../../constants/colors.dart';

class MyProfileListView extends StatelessWidget {
  const MyProfileListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        //Can add ListView here to make the list tiles scrollable
        children: [
          MyProfileListTile(
              icon: Icons.wallet,
              title: "My Orders and Products",
              subtitle: "Your Products, Orders, billing and invoices"),
          MyProfileListTile(
              icon: Icons.settings,
              title: "Settings",
              subtitle: "Privacy and manage accounts"),
          MyProfileListTile(
              icon: Icons.help,
              title: "Help and Support",
              subtitle: "Help Center and Legal Terms "),
          MyProfileListTile(
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
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration:
          BoxDecoration(color: Colors.white, // Your desired background color
              // borderRadius: BorderRadius.circular(15),
              boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 5),
          ]),
      child: ListTile(
        leading: Icon(
          icon,
          color: MyColors.textColor,
        ),
        title: Text(
          title,
          style: MyStyles.googleTextListTile,
        ),
        subtitle: Text(
          subtitle,
          style: MyStyles.googleTextSubtitleListTile,
        ),
        trailing: Icon(
          Icons.navigate_next,
          color: MyColors.textColor,
        ),
      ),
    );
  }
}

class MyProfileTextWidget extends StatelessWidget {
  const MyProfileTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: MyStyles.googleTitleText,
    );
  }
}

class LogoutBtnWidget extends StatelessWidget {
  const LogoutBtnWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text("Logout"),
      style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.buttonColor,
          textStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          shadowColor: Colors.grey),
    );
  }
}

class MyProfileNameCard extends StatelessWidget {
  const MyProfileNameCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.white,
            child: Image.network(
                "https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o="),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tooba Nadeem",
                style: MyStyles.googleTextListTile,
              ),
              Text("View Profile and Edit Profile",
                  style: MyStyles.googleTextSubtitleListTile),
            ],
          )
        ],
      ),
    );
  }
}

class NavigateBackWidget extends StatelessWidget {
  const NavigateBackWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.navigate_before,
      color: Colors.black,
    );
  }
}

// Widget for EditProfileCard includes profile icon, title and save button
class EditProfileCard extends StatelessWidget {
  const EditProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyProfileTextWidget(text: "Edit Profile"),
        SaveBtn(),
      ],
    );
  }
}

// Change Profile picture widget
class EditProfileIcon extends StatefulWidget {
  const EditProfileIcon({super.key});

  @override
  State<EditProfileIcon> createState() => _EditProfileIconState();
}

class _EditProfileIconState extends State<EditProfileIcon> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Badge(
        badgeContent: Icon(
          Icons.add_a_photo_outlined,
        ),
        child: CircleAvatar(
          radius: 60,
          backgroundColor: Colors.white,
          child: Image.network(
              "https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o="),
        ),
        badgeColor: MyColors.startColor,
        position: BadgePosition.bottomEnd(bottom: 15, end: 9),
      ),
    );
  }
}

// Text Fields section for User's contact information
class ContactInformationSection extends StatelessWidget {
  const ContactInformationSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10, right: 10, bottom: 10),
          child: Text("Contact Information",
              style: MyStyles.googleSecondTitleText),
        ),
        FormTextField(FieldLabel: "Phone Number", hintText: "Number"),
        FormTextField(FieldLabel: "Email", hintText: "User Email"),
      ],
    );
  }
}

// TextField section for Basic Information section
class BasicInformationSection extends StatelessWidget {
  const BasicInformationSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10, right: 10, bottom: 10),
          child:
              Text("Basic Information", style: MyStyles.googleSecondTitleText),
        ),
        FormTextField(FieldLabel: "User Name", hintText: "Name"),
        // FormTextField(FieldLabel: "Gender", hintText: "Choose Gender"),
        DropDown(dropdownLabel: "Gender"),
        // FormTextField(FieldLabel: "Date Of Birth", hintText: "DOB"),
        DatePickerTextField(),
      ],
    );
  }
}

// Custom Text Field Widget
class FormTextField extends StatefulWidget {
  const FormTextField(
      {super.key, required this.FieldLabel, required this.hintText});
  final String FieldLabel;
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
          TextFormField(
            decoration: InputDecoration(
              hintText: widget.hintText,
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
            padding: EdgeInsets.only(left: 10, right: 2),
            child: DropdownButton<String>(
              hint: selectedValue == ""
                  ? Text("Gender")
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
  const SaveBtn({super.key});

  @override
  State<SaveBtn> createState() => _SaveBtnState();
}

class _SaveBtnState extends State<SaveBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {}),
      child: Text("Save", style: MyStyles.underlinedGreyText),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldLabel(text: "Date Of Birth"),
        Container(
            child: Center(
                child: TextField(
          controller: dateinput, //editing controller of this TextField
          decoration: InputDecoration(
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
            suffixIcon: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Icon(
                Icons.calendar_month_outlined,
                color: MyColors.textColor,
              ),
            ),
            //icon of text field
            hintText: "Enter Date",
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
                    colorScheme: ColorScheme.light(
                      primary: MyColors.startColor, // <-- SEE HERE
                      onPrimary: Colors.white, // <-- SEE HERE
                      onSurface: MyColors.textColor, // <-- SEE HERE
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        primary: MyColors.textColor, // button text color
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
