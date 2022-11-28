import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:flutterdemo/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class BidNotification extends StatefulWidget {
  const BidNotification({super.key});

  @override
  State<BidNotification> createState() => _BidNotificationState();
}

class _BidNotificationState extends State<BidNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderBar(title: "Notifications"),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NotificationCard(context));
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: Column(
                  children: [
                    ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Colors.blueGrey,
                        ),
                        title: Text(
                          "Qiblatain",
                          style: MyStyles.googleTextSubtitleListTile(18),
                        ),
                        subtitle: AcceptedBidSubtitle()),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Card NotificationCard(BuildContext context) {
    return Card(
      elevation: 10,
      child: Column(
        children: [
          ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.blueGrey,
              ),
              title: Text(
                "Qiblatain",
                style: MyStyles.googleTextSubtitleListTile(18),
              ),
              subtitle: BidSubtitle()),
          blackLine(width: MediaQuery.of(context).size.width),
          Deny_Accept_Button()
        ],
      ),
    );
  }

  Row Deny_Accept_Button() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {},
            child: Text("Deny"),
            style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2.0,
                    color: MyColors.buttonColor,
                  ),
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                elevation: 5,
                minimumSize: const Size(100, 35),
                backgroundColor: Colors.white,
                textStyle: GoogleFonts.poppins(),
                foregroundColor: MyColors.buttonColor,
                shadowColor: MyColors.buttonColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () {},
              child: Text("Accept"),
              style: ElevatedButton.styleFrom(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  elevation: 5,
                  minimumSize: const Size(100, 35),
                  backgroundColor: MyColors.buttonColor,
                  textStyle: GoogleFonts.poppins(),
                  foregroundColor: MyColors.buttonTextColor,
                  shadowColor: MyColors.buttonColor)),
        )
      ],
    );
  }

  RichText BidSubtitle() {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: 'Has placed a bid of Rs. 500 on ',
              style: TextStyle(color: Colors.black)),
          TextSpan(
              text: 'Karwan - e -Urdu\n\n',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: MyColors.buttonColor)),
          TextSpan(
              text: 'Original Price: Rs. 600',
              style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }

  RichText AcceptedBidSubtitle() {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: 'Has accepted your bid of Rs. 500 on ',
              style: TextStyle(color: Colors.black)),
          TextSpan(
              text: 'Karwan - e -Urdu\n\n',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: MyColors.buttonColor)),
        ],
      ),
    );
  }
}

class blackLine extends StatelessWidget {
  const blackLine({required this.width, Key? key}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(height: 1.0, width: width * 0.9, color: Colors.grey);
  }
}
