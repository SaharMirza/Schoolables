// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/Entities/user_auth_entity.dart';
import 'package:flutterdemo/Entities/user_entity.dart';
import 'package:flutterdemo/models/student_user_model.dart';

// Provider for User Collection
class UserProvider extends ChangeNotifier {
  // Will be initialized to when the user is logged in
  StudentUserProfile user = StudentUserProfile(id: "", email: "");
  CollectionReference firebaseUser =
      FirebaseFirestore.instance.collection('users');

  StudentUserProfile get userProfile => user;  

  // Update User Profile
  void updateUserInfo({name, schoolName, phone, grade}) {
    print("UpdateUSer");
    user.name = name;
    user.schoolName = schoolName;
    user.phone = phone;
    user.grade = grade;
    saveChanges();
    notifyListeners();
  }

  // Save Changes in DB
  // Update Changes
  void saveChanges() async {
    // Update User Profile in Firebase
    await firebaseUser.doc(FirebaseAuth.instance.currentUser!.uid).set(StudentUserProfileModel(
            email: user.email,
            name: user.name,
            phone: user.phone,
            schoolName: user.schoolName,
            grade: user.grade,
            display: user.display,
            products: user.productIDs,
            orderSeller: user.orderSellerIDs,
            wishListIDs: user.wishListIDs,
            orderBuyer: user.orderBuyerIDs,
            rating: user.rating,
            dob: user.dob)
        .toJson());
        notifyListeners();
    print("${user.email} saved in Firebase");
  }

  
}
