import 'package:flutter/cupertino.dart';
import 'package:flutterdemo/models/product_model.dart';
import '../Repository/scanned_list_repository.dart';
import '../models/scanned_List.dart';

class ScannedListProvider with ChangeNotifier {
  final ScannedListRepository _scannedListRepository =
      FirebaseScannedListRepository();
  List<ScannedList> scannedLists = [];
  List<ProductModel> scannedProducts = [];
  List<String> results = [];

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

  void fetchProductsByName(String result) async {
    scannedProducts = await _scannedListRepository.fetchProductsByName(result);
    print(scannedProducts.toString());
    notifyListeners();
  }

  void saveScannedList(List<String> result, String schoolName, String grade) async {
    results = result;
    notifyListeners();
    _scannedListRepository.saveScanList(result, schoolName, grade);
  }
}
