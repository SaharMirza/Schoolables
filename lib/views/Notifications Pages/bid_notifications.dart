import 'package:flutter/material.dart';
import 'package:flutterdemo/Entities/bidding_entity.dart';
import 'package:flutterdemo/Entities/products_entity.dart';
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
  bool productsFetched = false;
  List<Bidding> userbids = [];
  List<Bidding> bids = [];
  // List<BiddingModel> userProductsBids = [];
  int i = 0;
  @override
  Widget build(BuildContext context) {
    final List<Product> userProducts =
        context.watch<ProductsProvider>().userProducts;
    final userAuth = Provider.of<UserAuth?>(context);
    //selling bids
    userbids = context.watch<BiddingProvider>().userBids;

    for (int i = 0; i < userbids.length; i++) {
      if (userbids[i].buyerID == userAuth?.id)
        continue;
      else
        (bids.add(userbids[i]));
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
                itemCount: bids.length,
                itemBuilder: (BuildContext context, int index) {
                  i = index;
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: bids[index].isAccepted || bids[index].isRejected
                          ? null
                          : NotificationCard(bids[index], userProducts, index));
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

  Widget NotificationCard(Bidding Bid, userProducts, index) {
    return Card(
      elevation: 10,
      child: Column(
        children: [
          ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.blueGrey,
              ),
              title: Text(
                Bid.buyerName,
                style: MyStyles.googleTextSubtitleListTile(18),
              ),
              subtitle: BidSubtitle(Bid, userProducts)),
          blackLine(width: MediaQuery.of(context).size.width),
          Deny_Accept_Button(Bid.id, index)
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
              bids.remove(bids[index]);
              setState(() {});
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
                bids.remove(bids[index]);
                setState(() {});
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

  Widget BidSubtitle(Bidding Bid, userProducts) {
    //fetch product details for bidded product
    getProductDetails() {
      for (int i = 0; i < userProducts.length; i++) {
        if (Bid.productID == userProducts[i].id) return userProducts[i];
      }
    }

    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: 'Has placed a bid of Rs. ' + Bid.bid.toString() + ' on ',
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
