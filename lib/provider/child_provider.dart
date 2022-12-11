import 'package:flutter/cupertino.dart';
import 'package:flutterdemo/Repository/child_repository.dart';
import 'package:flutterdemo/models/child_model.dart';

class ChildProvider with ChangeNotifier {
  //CategoriesProvider(this._categoriesRepository);

  List<ChildProfileModel> child = [];

  final ChildRepository _childRepository = FirebaseChildRepository();

// ProductModel get ProductModel => products;
  bool isChildernFetching = false;

  void fetchChildern() async {
    isChildernFetching = true;
    notifyListeners();
    child = await _childRepository.fetchChildernList();
    print("I AM IN");
    isChildernFetching = false;
    notifyListeners();
  }

  void addChild(
      String name,
      String schoolName,
      String grade,
      String display,
      List<String> orderBuyer,
      List<String> wishListIDs,
      String parentID
      ) async {
    await _childRepository.addChild(name, schoolName, grade, display, orderBuyer, wishListIDs, parentID);
  }
}
