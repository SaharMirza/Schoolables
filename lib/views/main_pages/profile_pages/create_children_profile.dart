
import '../../../imports.dart';

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
      body: SizedBox(
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
            const Container2(),
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
            const SchoolablesLogoText(),
            SizedBox(height: screenHeight * 0.04),
            Text('Create Children Profiles',
                style: MyStyles.googleTitleText(screenHeight * 0.03)),
            SizedBox(height: screenHeight * 0.01),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                  "Schoolables require you to make different profiles for your children so it makes tracking your children’s progress easier and smooth.",
                  textAlign: TextAlign.center,
                  style: MyStyles.googleTextSubtitleListTile(
                      screenHeight * 0.025)),
            ),
            SizedBox(height: screenHeight * 0.07),
            Text("Click to start adding children profiles",
                style:
                    MyStyles.googleTextSubtitleListTile(screenHeight * 0.02)),
            SizedBox(height: screenHeight * 0.025),
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
