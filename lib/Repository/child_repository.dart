import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterdemo/models/child_model.dart';

abstract class ChildRepository {
  Future<List<ChildProfileModel>> fetchChildernList();
  addChild(String name, String schoolName, String grade, String display,
      List<String> orderBuyer, List<String> wishListIDs, String parentID);
}

class FirebaseChildRepository implements ChildRepository {
  final db = FirebaseFirestore.instance;

  @override
  Future<List<ChildProfileModel>> fetchChildernList() async {
    List<ChildProfileModel> childern = [];
    await db.collection("child").get().then((event) {
      childern =
          event.docs.map((e) => ChildProfileModel.fromJson(e.data(), e.id)).toList();
    });
    return childern;
  }

  //add child
  @override
  addChild(
      String name,
      String schoolName,
      String grade,
      String display,
      List<String> orderBuyer,
      List<String> wishListIDs,
      String parentID) async {
    final data = ChildProfileModel(
      name: name,
      schoolName: schoolName,
      grade: grade,
      display: display,
      orderBuyer: orderBuyer,
      parentID: parentID,
      wishListIDs: wishListIDs,
    ).toJson();
    await db
        .collection("child")
        .add(data)
        .then(
          (_) => print('Added'),
        )
        .catchError(
          (error) => print('Add failed: $error'),
        );
  }
}
