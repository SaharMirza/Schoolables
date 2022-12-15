import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterdemo/Entities/bidding_entity.dart';
import 'package:flutterdemo/models/bidding_model.dart';
// import 'package:practice/Models/bidding_model.dart';
// import 'package:practice/Models/category_model.dart';

abstract class BiddingRepository {
  Future<List<BiddingModel>> fetchBidsList();
  // addBid(String buyerid, String pid, String buyerName, int bid, bool isAccepted,
  //     bool isRejected);
  addBid(Bidding Bid);
  getBid(String id);
  updateBid(bool isAccepted, bool isRejected, String ID);
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

  //add bidding
  @override
  Future<String> addBid(Bidding bid) async {
    var newRef = await db.collection("bidding").add(BiddingModel(
            productID: bid.productID,
            buyerName: bid.buyerName,
            buyerID: bid.buyerID,
            bid: bid.bid,
            id: "",
            isAccepted: bid.isAccepted,
            isRejected: bid.isRejected)
        .toJson());
    // product.id = newRef.id;

    return newRef.id;
  }

  //get bid
  @override
  Future<Bidding> getBid(String id) async {
    var doc = await db.collection("bidding").doc(id).get();
    BiddingModel biddingModel =
        BiddingModel.fromJson(doc.data() as Map<String, dynamic>, doc.id);

    Bidding bid = Bidding(
        productID: biddingModel.productID,
        buyerName: biddingModel.buyerName,
        buyerID: biddingModel.buyerID,
        bid: biddingModel.bid,
        isAccepted: biddingModel.isAccepted,
        isRejected: biddingModel.isRejected);
    return bid;
  }

  // //add product
  // @override
  // addBid(
  //     String buyerid,
  //     String pid,
  //     String buyerName,
  //     int bid,
  //     bool isAccepted,
  //     bool isRejected) async {
  //   final data =
  //       BiddingModel(bid: bid, buyerID: buyerid, productID: pid,buyerName: buyerName, id: '', isAccepted: isAccepted, isRejected: isRejected, )
  //           .toJson();
  //   await db
  //       .collection("bidding")
  //       .add(data)
  //       .then(
  //         (_) => print('Added'),
  //       )
  //       .catchError(
  //         (error) => print('Add failed: $error'),
  //       );
  // }

  //updateProduct
  @override
  updateBid(bool isAccepted, bool isRejected, String ID) async {
    await db
        .collection("bidding")
        .doc(ID)
        .update({"isAccepted": isAccepted, "isRejected": isRejected})
        .then((value) => print("Bid Updated"))
        .catchError((error) => print("Failed to update: $error"));
  }
}
