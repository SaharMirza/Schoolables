import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterdemo/models/bidding_model.dart';
// import 'package:practice/Models/bidding_model.dart';
// import 'package:practice/Models/category_model.dart';

abstract class BiddingRepository{
  Future<List<BiddingModel>> fetchBidsList();
}

class FirebaseBiddingRepository implements BiddingRepository {
  final db = FirebaseFirestore.instance;

  @override
  Future<List<BiddingModel>> fetchBidsList() async {
    List<BiddingModel> bids = [];
    await db.collection("bidding").get().then((event) {
      bids = event.docs.map((e) => BiddingModel.fromJson(e.data(), e.id)).toList();
    });

    return bids;
  }
}