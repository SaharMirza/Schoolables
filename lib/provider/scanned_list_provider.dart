import 'package:flutter/cupertino.dart';
import 'package:flutterdemo/models/product_model.dart';
import '../Repository/scanned_list_repository.dart';
import '../models/scanned_List.dart';

class ScannedListProvider with ChangeNotifier {
  final ScannedListRepository _scannedListRepository =
      FirebaseScannedListRepository();
  List<ScannedList> scannedLists = [];
  List<ProductModel> scannedProducts = [];

  bool isLoading = false;

  void fetchScannedListAccordingToSchoolName(String schoolName) async {
    print('fetching books');
    isLoading = true;
    notifyListeners();
    scannedLists = await _scannedListRepository
        .fetchScannedListAccordingToSchoolName(schoolName);
    print("got books");
    isLoading = false;
    notifyListeners();
  }

  void fetchScannedProducts(List<String> result) async {
    scannedProducts = await _scannedListRepository.fetchScannedProducts(result);
    notifyListeners();
  }
}
