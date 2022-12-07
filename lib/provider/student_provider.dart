// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/Entities/student_entity.dart';
import 'package:flutterdemo/Entities/user_auth_entity.dart';
import 'package:flutterdemo/models/user_model.dart';

// Provider for User Collection
class UserProvider extends ChangeNotifier {
  // Will be initialized to when the user is logged in
  UserProfile user = UserProfile(id: "", email: "");
  CollectionReference firebaseUser =
      FirebaseFirestore.instance.collection('users');

  UserProfile get userProfile => user;
  // String id = FirebaseAuth.instance.currentUser!.uid;

  void loadUser(UserAuth? userLogin) {
    if (userLogin != null) {
      user = UserProfile(
        id: userLogin.id,
        email: userLogin.email,
        name: userLogin.name,
        display: userLogin.photoUrl,
      );
      // Check if User is in Firebase
      firebaseUser.doc(user.id).get().then((doc) {
        if (doc.exists) {
          // Update User Profile
          print("User ${user.email} is in Firebase");
          loadUserFromFirebase();
        } else {
          // Add User to Firebase
          print("User is not in Firebase");
          addUser();
          print("added in FB!");
        }
      });
    } else {
      user = UserProfile(id: "", email: "");
    }
    notifyListeners();
  }

  // Update User Profile
  void updateUserInfo({name, schoolName, grade, phone}) {
    user.name = name;
    user.schoolName = schoolName;
    user.grade = grade;
    user.phone = phone;
    saveChanges();
    notifyListeners();
  }

  // Update UserDisplay
  void updateUserDisplay(String display) {
    user.display = display;
    notifyListeners();
  }

  // Save Changes in DB
  // Update Changes
  void saveChanges() async {
    print(user.id);
    // Update User Profile in Firebase
    await firebaseUser.doc(user.id).set(UserProfileModel(
          email: user.email,
          phone: user.phone,
          name: user.name,
          schoolName: user.schoolName,
          grade: user.grade,
          display: user.display,
          rating: user.rating,
          wishListIDs: user.wishListIDs,
          orderSeller: user.orderSellerIDs,
          orderBuyer: user.orderBuyerIDs,
          dob: user.dob,
          products: user.productIDs,
        ).toJson());
    print("${user.email} saved in Firebase");
  }

  //Add a new User
  void addUser() async {
    // Convert user to user model
    await firebaseUser.doc(user.id).set(
          UserProfileModel(
            email: user.email,
            name: user.name,
            phone: user.phone,
            schoolName: user.schoolName,
            grade: user.grade,
            display: user.display,
            rating: user.rating,
            wishListIDs: user.wishListIDs,
            orderSeller: user.orderSellerIDs,
            orderBuyer: user.orderBuyerIDs,
            dob: user.dob,
            products: user.productIDs,
          ).toJson(),
        );
    notifyListeners();
  }

  void loadUserFromFirebase() async {
    await firebaseUser.doc(user.id).get().then((doc) {
      // Load User from Firebase to User Provider
      UserProfileModel userModel =
          UserProfileModel.fromJson(doc.data() as Map<String, dynamic>);
      user.name = userModel.name;
      user.schoolName = userModel.schoolName;
      user.grade = userModel.grade;
      user.phone = userModel.phone;
      user.display = userModel.display;
      user.rating = userModel.rating;
      user.wishListIDs = userModel.wishListIDs;
      user.orderSellerIDs = user.orderSellerIDs;
      user.orderBuyerIDs = user.orderBuyerIDs;
      user.dob = user.dob;
      user.productIDs = user.productIDs;
    });
    saveChanges();
    notifyListeners();
  }

  // removeFavItem(String id) {
  //   var ids = user.wishListIDs;
  //   ids.remove(id);
  //   user.wishListIDs = ids;
  //   saveChanges();
  //   notifyListeners();
  // }

  // addFavItem(String id) {
  //   var ids = user.wishListIDs;
  //   ids.add(id);
  //   user.wishListIDs = ids;
  //   saveChanges();
  //   notifyListeners();
  // }

  // void addNewOrder(orderid) {
  //   List<String> ids = [];
  //   for (var id in user.orderHistoryIDs) {
  //     ids.add(id);
  //   }
  //   // remove blank address initially
  //   // ids.remove("");
  //   ids.add(orderid);
  //   user.orderHistoryIDs = ids;
  //   print("added new Order $orderid");
  //   notifyListeners();
  // }
}
