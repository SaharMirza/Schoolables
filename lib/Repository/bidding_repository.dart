import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterdemo/models/bidding_model.dart';
// import 'package:practice/Models/bidding_model.dart';
// import 'package:practice/Models/category_model.dart';

abstract class BiddingRepository {
  Future<List<BiddingModel>> fetchBidsList();
  addBid( String buyerid,
      String pid,
    String buyerName,
      int bid,
      bool isAccepted,
      bool isRejected);
  updateBid(bool isAccepted,bool isRejected,String ID);
}

class FirebaseBiddingRepository implements BiddingRepository {
  final db = FirebaseFirestore.instance;

  @override
  Future<List<BiddingModel>> fetchBidsList() async {
    List<BiddingModel> bids = [];
    await db.collection("bidding").get().then((event) {
      bids =
          event.docs.map((e) => BiddingModel.fromJson(e.data(), e.id)).toList();
    });

    return bids;
  }

  //add product
  @override
  addBid(
      String buyerid,
      String pid,
      String buyerName,
      int bid,
      bool isAccepted,
      bool isRejected) async {
    final data =
        BiddingModel(bid: bid, buyerID: buyerid, productID: pid,buyerName: buyerName, id: '', isAccepted: isAccepted, isRejected: isRejected, )
            .toJson();
    await db
        .collection("bidding")
        .add(data)
        .then(
          (_) => print('Added'),
        )
        .catchError(
          (error) => print('Add failed: $error'),
        );
  }

  //updateProduct
  @override
  updateBid(
      bool isAccepted,bool isRejected,String ID) async {
    await db
        .collection("bidding")
        .doc(ID)
        .update({
          "isAccepted":isAccepted,
          "isRejected":isRejected
        })
        .then((value) => print("Bid Updated"))
        .catchError((error) => print("Failed to update: $error"));
  }
}
