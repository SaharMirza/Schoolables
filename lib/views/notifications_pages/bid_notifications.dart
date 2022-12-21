import 'package:flutter/material.dart';
import 'package:flutterdemo/Entities/bidding_entity.dart';
import 'package:flutterdemo/Entities/products_entity.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:flutterdemo/provider/bidding_provider.dart';
import 'package:flutterdemo/provider/product_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BidNotification extends StatefulWidget {
  const BidNotification({super.key});

  @override
  State<BidNotification> createState() => _BidNotificationState();
}

class _BidNotificationState extends State<BidNotification> {
  bool productsFetched = false;
  List<Bidding> bids = [];

  int i = 0;
  @override
  Widget build(BuildContext context) {
    final List<Product> userProducts =
        context.watch<ProductsProvider>().userProducts;
    bids = context.watch<BiddingProvider>().userBids;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Notifications"),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            bids.isEmpty
                ? Center(
                    child: Container(
                    child: const Text("You Have no Notifications Yet."),
                  ))
                : notifcationList(userProducts),
           
          ],
        ),
      ),
    );
  }

  ListView notifcationList(List<Product> userProducts) {
    return ListView.builder(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemCount: bids.length,
        itemBuilder: (BuildContext context, int index) {
          i = index;
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: bids[index].isAccepted || bids[index].isRejected
                  ? null
                  : NotificationCard(bids[index], userProducts, index));
        });
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
              context.read<BiddingProvider>().updateBid(false, true, ID);
              bids.remove(bids[index]);
              setState(() {});
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 2.0,
                    color: MyColors.buttonColor,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                elevation: 5,
                minimumSize: const Size(100, 35),
                backgroundColor: Colors.white,
                textStyle: GoogleFonts.poppins(),
                foregroundColor: MyColors.buttonColor,
                shadowColor: MyColors.buttonColor),
            child: const Text("Deny"),
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
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 5,
                  minimumSize: const Size(100, 35),
                  backgroundColor: MyColors.buttonColor,
                  textStyle: GoogleFonts.poppins(),
                  foregroundColor: MyColors.buttonTextColor,
                  shadowColor: MyColors.buttonColor),
              child: const Text("Accept")),
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
              text: 'Has placed a bid of Rs. ${Bid.bid} on ',
              style: const TextStyle(color: Colors.black)),
          TextSpan(
              text: getProductDetails().title + '\n\n',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: MyColors.buttonColor)),
          TextSpan(
              text:
                  'Original Price: Rs. ${getProductDetails().price}',
              style: const TextStyle(color: Colors.black)),
        ],
      ),
    );
  }

  Widget AcceptedBidSubtitle() {
    return RichText(
      text: const TextSpan(
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
