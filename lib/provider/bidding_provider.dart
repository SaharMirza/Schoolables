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
  
  final BiddingRepository _bidsRepository = FirebaseBiddingRepository();

  bool isBidsFetching = false;

  Future<Bidding> getBidbyID(id)async{
    Bidding bid = await _bidsRepository.getBid(id);
    return bid;
  }

  void loadUserBids(List<String> bids) async {
    userBids = [];
    for (var id in bids) {
      print("bidID" + id);
      if (id == "") continue;
      Bidding bid = await _bidsRepository.getBid(id);
      bid.id = id;
      userBids.add(bid);
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
