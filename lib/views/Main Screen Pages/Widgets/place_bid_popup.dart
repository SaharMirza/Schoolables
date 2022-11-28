import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/colors.dart';

import 'package:flutterdemo/constants/fonts.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaceBidPopUp extends StatefulWidget {
  const PlaceBidPopUp({super.key});

  @override
  State<PlaceBidPopUp> createState() => _PlaceBidPopUpState();
}

class _PlaceBidPopUpState extends State<PlaceBidPopUp> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.grey,
              height: 200,
              width: 200,
              child: Image.network(
                "https://images.unsplash.com/photo-1543002588-bfa74002ed7e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ], border: Border.all(color: Colors.grey)),
                height: 300,
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Top 3 Bidder",
                          style: MyStyles.googleTitleText(20)),
                      const ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                        ),
                        title: Text("Qiblatain Fatima"),
                        trailing: Text("Rs. 500"),
                      ),
                      const ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blueGrey,
                        ),
                        title: Text("Naquiya Asghar"),
                        trailing: Text("Rs. 400"),
                      ),
                      const ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blueAccent,
                        ),
                        title: Text("Ermina Fatima"),
                        trailing: Text("Rs. 350"),
                      ),
                      Text("Your Bid!", style: MyStyles.googleTitleText(20)),
                      placebid()
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row placebid() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Enter your Bid",
              fillColor: MyColors.textFieldColor,
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(8)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.textColor, width: 1.5),
                // borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: ElevatedButton(
            onPressed: () {},
            child: Text("Bid"),
            style: ElevatedButton.styleFrom(
                elevation: 10,
                minimumSize: const Size(90, 50),
                backgroundColor: MyColors.buttonColor,
                textStyle: GoogleFonts.poppins(),
                foregroundColor: MyColors.buttonTextColor,
                shadowColor: Colors.grey),
          ),
        )
      ],
    );
  }
}
