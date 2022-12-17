import 'package:flutter/material.dart';
import 'package:flutterdemo/Entities/bidding_entity.dart';
import 'package:flutterdemo/Entities/products_entity.dart';
import 'package:flutterdemo/Entities/user_auth_entity.dart';
import 'package:flutterdemo/constants/colors.dart';

import 'package:flutterdemo/constants/fonts.dart';
import 'package:flutterdemo/models/bidding_model.dart';
import 'package:flutterdemo/provider/bidding_provider.dart';
import 'package:flutterdemo/provider/product_provider.dart';
import 'package:flutterdemo/provider/student_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlaceBidPopUp extends StatefulWidget {
  const PlaceBidPopUp({
    Key? key,
    required this.pid,
    required this.bid,
  }) : super(key: key);

  final String pid;
  final List<BiddingModel> bid;

  @override
  State<PlaceBidPopUp> createState() => _PlaceBidPopUpState();
}

class _PlaceBidPopUpState extends State<PlaceBidPopUp> {
  //  bool bidsFetched = false;

  @override
  Widget build(BuildContext context) {
    final userAuth = Provider.of<UserAuth?>(context);
    final userProfile = context.watch<UserProvider>().userProfile;
    // print("NAME"+userProfile.name);

    TextEditingController _bidController = TextEditingController();
    widget.bid.sort(((a, b) => b.bid.compareTo(a.bid)));
    // context
    //     .read<BiddingProvider>()
    //     .addBid(widget.pid, user.id, int.parse(_bidController.text),userProfile.name);

    void saveMyBid(user) async {
      var bid = Bidding(
          productID: widget.pid,
          buyerName: userProfile.name,
          buyerID: user.id,
          bid: int.parse(_bidController.text),
          isAccepted: false,
          isRejected: false);
      var bidid = await context.read<BiddingProvider>().addBid(bid);
      //update user's biddingIDs
      context.read<UserProvider>().addNewBid(bidid);
      context.read<UserProvider>().saveChanges();
      //update seller's sellingbiddingIDs
      Product product =
          await context.read<ProductsProvider>().getProductByID(widget.pid);
      String psellerID = product.sellerID;
      context.read<UserProvider>().updateSeller(psellerID, bidid);
    }

    Row placebid(_bidController, user) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextFormField(
              controller: _bidController,
              //  keyboardType: TextInputType.emailAddress,
              autofocus: false,
              // initialValue: 'sathyabaman@gmail.com',
              style: new TextStyle(
                  fontWeight: FontWeight.normal, color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter your bid',
                hintStyle: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 10,
                  // color: const Color.fromRGBO(74, 78, 105, 1.0)
                ),
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ElevatedButton(
              onPressed: () {
                saveMyBid(user);
                // context
                //     .read<BiddingProvider>()
                //     .addBid(widget.pid, user.id, int.parse(_bidController.text),userProfile.name);
              },
              child: Text("Bid"),
              style: ElevatedButton.styleFrom(
                  elevation: 10,
                  minimumSize: const Size(50, 30),
                  backgroundColor: MyColors.buttonColor,
                  textStyle: GoogleFonts.poppins(),
                  foregroundColor: MyColors.buttonTextColor,
                  shadowColor: Colors.grey),
            ),
          )
        ],
      );
    }

    return SingleChildScrollView(
      child: AlertDialog(
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
                        Text("Top 3 Bidder", style: MyStyles.googleTitleText(20)),
                        widget.bid.isEmpty
                            ? Container(child: Text("There are no bids yet."),)
                            : ListView.builder(
                                shrinkWrap: true,
                                // scrollDirection: Axis.horizontal,
                                itemCount:
                                    widget.bid.length > 3 ? 3 : widget.bid.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.grey,
                                    ),
                                    title: Text(widget.bid[index].buyerName),
                                    trailing:
                                        Text(widget.bid[index].bid.toString()),
                                  );
                                }),
                        Text("Your Bid!", style: MyStyles.googleTitleText(20)),
                        placebid(_bidController, userAuth)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
