import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/Entities/parent_entity.dart';
import 'package:flutterdemo/Entities/user_auth_entity.dart';
import 'package:flutterdemo/models/parent_model.dart';

// Provider for parent Collection
class ParentProvider extends ChangeNotifier {
  // Will be initialized to when the user is logged in
  ParentProfile parent = ParentProfile(id: "", email: "");
 final db = FirebaseFirestore.instance.collection('parents');

  ParentProfile get parentProfile => parent;
  // String id = FirebaseAuth.instance.currentUser!.uid;

  void loadUser(UserAuth? parentLogin) {
    if (parentLogin != null) {
      parent = ParentProfile(
        id: parentLogin.id,
        email: parentLogin.email,
        name: parentLogin.name,
        // display: parentLogin.photoUrl,
      );
      // Check if parent is in Firebase
      db.doc(parent.id).get().then((doc) {
        if (doc.exists) {
          // Update parent Profile
          print("parent ${parent.email} is in Firebase");
          loadparentFromFirebase();
        } else {
          // Add parent to Firebase
          // print("parent is not in Firebase");
          // addparent();
          // print("added in FB!");
        }
      });
    } else {
      parent = ParentProfile(id: "", email: "");
    }
    notifyListeners();
  }

  // Update parent Profile
  void updateparentInfo({name, phone}) {
    parent.name = name;
    parent.phone = phone;
    saveChanges();
    notifyListeners();
  }

  // // Update parentDisplay
  // void updateparentDisplay(String display) {
  //   // parent.display = display;
  //   notifyListeners();
  // }

  // Save Changes in DB
  // Update Changes
  void saveChanges() async {
    print("Parentid:"+parent.id);
    // Update parent Profile in Firebase
    await db.doc(parent.id).set(ParentProfileModel(
          email: parent.email,
          phone: parent.phone,
          name: parent.name,         
          orderSeller: parent.orderSellerIDs,
          products: parent.productIDs,
        ).toJson());
    print("${parent.email} saved in Firebase");
  }

  // //Add a new parent
  // void addparent() async {
  //   // Convert parent to parent model
  //   await firebaseUser.doc(parent.id).set(
  //         ParentProfileModel(
  //           email: parent.email,
  //           name: parent.name,
  //           phone: parent.phone,           
  //           orderSeller: parent.orderSellerIDs,
  //           products: parent.productIDs,
  //         ).toJson(),
  //       );
  //   notifyListeners();
  // }

  void loadparentFromFirebase() async {
    await db.doc(parent.id).get().then((doc) {
      // Load parent from Firebase to parent Provider
      ParentProfileModel parentModel =
          ParentProfileModel.fromJson(doc.data() as Map<String, dynamic>);
      parent.name = parentModel.name;
      // parent.schoolName = parentModel.schoolName;
      // parent.grade = parentModel.grade;
      parent.phone = parentModel.phone;
      // parent.display = parentModel.display;
      // parent.rating = parentModel.rating;
      // parent.wishListIDs = parentModel.wishListIDs;
      parent.orderSellerIDs = parent.orderSellerIDs;
      // parent.orderBuyerIDs = parent.orderBuyerIDs;
      // parent.dob = parent.dob;
      parent.productIDs = parent.productIDs;
    });
    saveChanges();
    notifyListeners();
  }

}
