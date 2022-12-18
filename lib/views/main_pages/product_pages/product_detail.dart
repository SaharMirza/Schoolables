import 'package:flutter/material.dart';
import 'package:flutterdemo/models/bidding_model.dart';
import 'package:flutterdemo/models/product_model.dart';
import 'package:flutterdemo/models/products.dart';
import 'package:flutterdemo/provider/bidding_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../constants/colors.dart';
import '../../bidding_screen_page/place_bid_popup.dart';
import '../Widgets/orders_widget.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({
    Key? key,
    this.product,
  }) : super(key: key);

  final ProductModel? product;
  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {

  @override
  Widget build(BuildContext context) {
    final bids = context.watch<BiddingProvider>().bids;
    List<BiddingModel> bid = [];

    getbids() {
      for (int i = 0; i < bids.length; i++) {
        if (bids[i].productID == widget.product!.id) {
          bid.add(bids[i]);
        }
      }
    }

    return Center(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
               ImageSlider(images: widget.product!.images,),
              OrderDetailsCard(
                isProduct: true,
                product: widget.product,
              ),
              Container(
                height: 100,
                width: 370,
                decoration: const BoxDecoration(
                  color: MyColors.textColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Highest Bid",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Rs. 500",
                                  style: GoogleFonts.inconsolata(
                                      color: Colors.white, fontSize: 30),
                                ),
                              ],
                            ),
                            Container(
                              child: Column(children: [
                                Container(
                                  height: 45,
                                  decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(107, 0, 0, 0),
                                        offset: Offset(
                                          5.0,
                                          5.0,
                                        ),
                                        blurRadius: 10.0,
                                        spreadRadius: 1.0,
                                      ), //BoxShadow
                                      //BoxShadow
                                    ],
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      getbids();
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return PlaceBidPopUp(
                                            pid: widget.product!.id,
                                            bid: bid,
                                          );
                                        },
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: MyColors.buttonColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Place a Bid",
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                            )
                          ]),
                    ],
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
