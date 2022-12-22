import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutterdemo/Entities/bidding_entity.dart';
import 'package:flutterdemo/Repository/bidding_repository.dart';
import 'package:flutterdemo/models/bidding_model.dart';
// import 'package:practice/Models/bidding_model.dart';
// import 'package:practice/Repository/bidding_repository.dart';

class BiddingProvider with ChangeNotifier {
  //CategoriesProvider(this._categoriesRepository);

  List<BiddingModel> bids = [];
  List<Bidding> userBids = [];
  List<Bidding> userBuyingBids = [];
  List<Bidding> sellerOrder = [];

  final BiddingRepository _bidsRepository = FirebaseBiddingRepository();

  bool isBidsFetching = false;

  Future<Bidding> getBidbyID(id) async {
    Bidding bid = await _bidsRepository.getBid(id);
    return bid;
  }

  void loadSellerOrders(List<String> bids) async {
    print("IN Seller ${bids.length}");
    sellerOrder = [];
    for (var id in bids) {
      print("bidID$id");
      if (id == "") continue;
      Bidding bid = await _bidsRepository.getBid(id);
      bid.id = id;
      sellerOrder.add(bid);
    }
    notifyListeners();
  }

  void loadUserBids(List<String> bids) async {
    isBidsFetching = true;
    userBids = [];
    for (var id in bids) {
      print("bidID$id");
      if (id == "") continue;
      Bidding bid = await _bidsRepository.getBid(id);
      bid.id = id;
      userBids.add(bid);
    }
    notifyListeners();
    isBidsFetching = false;
  }

  void loadUserBuyingBids(List<String> bids) async {
    userBuyingBids = [];
    for (var id in bids) {
      print("bidID$id");
      if (id == "") continue;
      Bidding bid = await _bidsRepository.getBid(id);
      bid.id = id;
      userBuyingBids.add(bid);
    }
    notifyListeners();
  }

  void fetchBids() async {
    isBidsFetching = true;
    notifyListeners();
    bids = await _bidsRepository.fetchBidsList();
    isBidsFetching = false;
    notifyListeners();
  }

  Future<String> addBid(Bidding bid) async {
    String bidid = await _bidsRepository.addBid(bid);
    bid.id = bidid;
    userBids.add(bid);
    notifyListeners();
    return bidid;
  }

  void updateBid(
    bool isAccepted,
    bool isRejected,
    String ID,
  ) async {
    await _bidsRepository.updateBid(isAccepted, isRejected, ID);
    notifyListeners();
  }
}
