import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Profile%20Pages/ChildrenProfileScreen.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/my_profile.dart';
import 'package:flutterdemo/views/Widgets/textfield.dart';
import 'package:google_fonts/google_fonts.dart';

class ChildProfileScreen extends StatefulWidget {
  const ChildProfileScreen({Key? key}) : super(key: key);

  @override
  State<ChildProfileScreen> createState() => _ChildProfileScreenState();
}

class _ChildProfileScreenState extends State<ChildProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    final TextEditingController _namecontroller = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              NavigateBackWidget(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Child Profile",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: screenHeight * 0.030,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        CircleAvatar(
                          radius: 34,
                          backgroundImage:
                              AssetImage('assets/images/profile.png'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    _reuseableColumn('Name'),
                    SizedBox(height: screenHeight * 0.03),
                    _reuseableColumn('School'),
                    SizedBox(height: screenHeight * 0.03),
                    _reuseableColumn('Grade'),
                    SizedBox(height: screenHeight * 0.03),
                    Row(
                      children: [
                        Text(
                          "Add Child",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 59, 59, 61),
                              fontSize: screenHeight * 0.025,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        InkWell(
                          child: Icon(
                            Icons.add_circle,
                            size: 50,
                            color: MyColors.buttonColor,
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ChildernProfileScreen()),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _reuseableColumn(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 12),
          textAlign: TextAlign.left,
        ),
        TextField(
          decoration: InputDecoration(contentPadding: EdgeInsets.only(top: 10)),
        ),
      ],
    );
  }
}
