
import 'package:flutter/cupertino.dart';
import 'package:flutterdemo/Repository/bidding_repository.dart';
import 'package:flutterdemo/models/bidding_model.dart';
// import 'package:practice/Models/bidding_model.dart';
// import 'package:practice/Repository/bidding_repository.dart';

class BiddingProvider with ChangeNotifier {
  //CategoriesProvider(this._categoriesRepository);

  List<BiddingModel> bids = [];

  final BiddingRepository _bidsRepository=FirebaseBiddingRepository();

  bool isBidsFetching = false;

  void fetchBids() async {
    isBidsFetching = true;
    notifyListeners();
    bids = await _bidsRepository.fetchBidsList();
    isBidsFetching = false;
    notifyListeners();
  }
}
