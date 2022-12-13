import 'package:flutter/material.dart';
import 'package:flutterdemo/Entities/user_auth_entity.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:flutterdemo/models/bidding_model.dart';
import 'package:flutterdemo/models/product_model.dart';
import 'package:flutterdemo/provider/bidding_provider.dart';
import 'package:flutterdemo/provider/product_provider.dart';
import 'package:flutterdemo/provider/student_provider.dart';
import 'package:flutterdemo/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BidNotification extends StatefulWidget {
  const BidNotification({super.key});

  @override
  State<BidNotification> createState() => _BidNotificationState();
}

class _BidNotificationState extends State<BidNotification> {
  // bool categoriesFetched = false;
  bool productsFetched = false;
  List<BiddingModel> userProductsBids = [];
  int i = 0;
  @override
  Widget build(BuildContext context) {
    final products = context.read<ProductsProvider>().products;
    final userAuth = Provider.of<UserAuth?>(context);
    final bids = context.read<BiddingProvider>().bids;
    List<ProductModel> userProducts = [];

    //User Products
    for (int i = 0; i < products.length; i++) {
      if (products[i].sellerID == userAuth?.id) {
        userProducts.add(products[i]);
      }
    }

    //fetch bids on user's products
    for (int i = 0; i < bids.length; i++) {
      for (int j = 0; j < userProducts.length; j++) {
        if (bids[i].productID == userProducts[j].id)
          userProductsBids.add(bids[i]);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Notifications"),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: userProductsBids.length,
                itemBuilder: (BuildContext context, int index) {
                  i = index;
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: userProductsBids[index].isAccepted ||
                              userProductsBids[index].isRejected
                          ? null
                          : NotificationCard(
                              userProductsBids[index], userProducts, index));
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

  Widget NotificationCard(BiddingModel userProductsBids, userProducts, index) {
    return Card(
      elevation: 10,
      child: Column(
        children: [
          ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.blueGrey,
              ),
              title: Text(
                userProductsBids.buyerName,
                style: MyStyles.googleTextSubtitleListTile(18),
              ),
              subtitle: BidSubtitle(userProductsBids, userProducts)),
          blackLine(width: MediaQuery.of(context).size.width),
          Deny_Accept_Button(userProductsBids.id, index)
        ],
      ),
    );
  }

  Widget Deny_Accept_Button(ID, index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              // print("BEFORE" + userProductsBids.length.toString());
              context.read<BiddingProvider>().updateBid(false, true, ID);
              // userProductsBids.remove(userProductsBids[index]);
              // print("AFTER" + userProductsBids.length.toString());
              // setState(() {});
            },
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
              onPressed: () {
                context.read<BiddingProvider>().updateBid(true, false, ID);
              },
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

  Widget BidSubtitle(BiddingModel userProductsBids, userProducts) {
    //fetch product details for bidded product
    getProductDetails() {
      for (int i = 0; i < userProducts.length; i++) {
        if (userProductsBids.productID == userProducts[i].id)
          return userProducts[i];
      }
    }

    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: 'Has placed a bid of Rs. ' +
                  userProductsBids.bid.toString() +
                  ' on ',
              style: TextStyle(color: Colors.black)),
          TextSpan(
              text: getProductDetails().title + '\n\n',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: MyColors.buttonColor)),
          TextSpan(
              text:
                  'Original Price: Rs. ' + getProductDetails().price.toString(),
              style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }

  Widget AcceptedBidSubtitle() {
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
