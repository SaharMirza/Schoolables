import 'package:flutter/material.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Profile%20Pages/ChildProfile.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/my_profile.dart';
import 'package:flutterdemo/views/OnBoarding%20Pages/main_login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateChildrenProfile extends StatefulWidget {
  const CreateChildrenProfile({super.key});

  @override
  State<CreateChildrenProfile> createState() => _CreateChildrenProfile();
}

class _CreateChildrenProfile extends State<CreateChildrenProfile> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NavigateBackWidget(
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),
              ],
            ),
            Container2(),
          ],
        ),
      ),
    );
  }
}

class Container2 extends StatelessWidget {
  const Container2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: screenHeight * 0.75,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logo.png',
              height: screenHeight * 0.2,
              width: screenWidth * 0.2,
            ),
            Text(
              "Schoolables",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
            Text(
              'Create Children Profiles',
              style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 59, 59, 61),
                  fontSize: screenHeight * 0.030,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * 0.01),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Schoolables require you to make different profiles for your children so it makes tracking your children’s progress easier and smooth.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 59, 59, 61),
                    fontSize: screenHeight * 0.025,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.06,
            ),
            Text(
              "Click to start adding children profiles",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 59, 59, 61),
                  fontSize: screenHeight * 0.025,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: screenHeight * 0.03),
            InkWell(
              child: Image.asset(
                'images/Vector.png',
                height: screenHeight * 0.1,
                width: screenWidth * 0.1,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ChildProfileScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
