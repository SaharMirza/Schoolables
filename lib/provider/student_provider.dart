// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/Entities/student_entity.dart';
import 'package:flutterdemo/Entities/user_auth_entity.dart';
import 'package:flutterdemo/models/student_model.dart';

// Provider for User Collection
class UserProvider extends ChangeNotifier {
  // Will be initialized to when the user is logged in
  List<UserProfileModel> Users = [];
  UserProfile user = UserProfile(id: "", email: "");
  CollectionReference firebaseUser =
      FirebaseFirestore.instance.collection('users');

  UserProfile get userProfile => user;

  Future<void> loadUsers() async {
    await firebaseUser.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        UserProfileModel userModel =
            UserProfileModel.fromJson(doc.data() as Map<String, dynamic>);
        UserProfileModel seller = UserProfileModel(
            email: userModel.email,
            phone: userModel.phone,
            name: userModel.name,
            display: userModel.display,
            schoolName: userModel.schoolName,
            grade: userModel.grade,
            dob: userModel.dob,
            orderBuyer: userModel.orderBuyer,
            orderSeller: userModel.orderSeller,
            products: userModel.products,
            wishListIDs: userModel.wishListIDs,
            rating: userModel.rating,
            biddingIDs: userModel.biddingIDs,
            sellingbiddingIDs: userModel.sellingbiddingIDs);

        seller.id = doc.id;
        Users.add(seller);
        // print(item.name);
        // print(item.brandID);
      });
    });
    notifyListeners();
  }

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
          // // Add User to Firebase
          // print("User is not in Firebase");
          // addUser();
          // print("added in FB!");
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
            orderSeller: user.orderSeller,
            orderBuyer: user.orderBuyer,
            dob: user.dob,
            products: user.products,
            biddingIDs: user.biddingIDs,
            sellingbiddingIDs: user.sellingbiddingIDs)
        .toJson());
    print("${user.email} saved in Firebase");
  }

//update seller biddingIDS
  void updateSeller(sid, bid) async {
    List<String> bidIDs = [];
    await firebaseUser.doc(sid).get().then((doc) {
      // Load User from Firebase to User Provider
      UserProfileModel userModel =
          UserProfileModel.fromJson(doc.data() as Map<String, dynamic>);
      bidIDs = userModel.sellingbiddingIDs;
    });
    bidIDs.add(bid);
    // print(user.id);
    // Update User Profile in Firebase
    await firebaseUser
        .doc(sid)
        .update({"sellingbiddingIDs": bidIDs})
        .then((value) => print("Bid Updated"))
        .catchError((error) => print("Failed to update: $error"));
    // print("${user.email} saved in Firebase");
  }

    void updateSellerOrders(sid, bid) async {
    List<String> bidIDs = [];
    List<String> biddingIDs=[];
    await firebaseUser.doc(sid).get().then((doc) {
      // Load User from Firebase to User Provider
      UserProfileModel userModel =
          UserProfileModel.fromJson(doc.data() as Map<String, dynamic>);
      bidIDs = userModel.orderBuyer;
      biddingIDs=userModel.biddingIDs;
    });
    bidIDs.add(bid);
    biddingIDs.remove(bid);
    // print(user.id);
    // Update User Profile in Firebase
    await firebaseUser
        .doc(sid)
        .update({"orderBuyer": bidIDs,"biddingIDs":biddingIDs})
        .then((value) => print("Bid Updated"))
        .catchError((error) => print("Failed to update: $error"));
    // print("${user.email} saved in Firebase");
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
            orderSeller: user.orderSeller,
            orderBuyer: user.orderBuyer,
            dob: user.dob,
            products: user.products,
            biddingIDs: user.biddingIDs,
            sellingbiddingIDs: user.sellingbiddingIDs
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
      user.orderSeller = userModel.orderSeller;
      user.orderBuyer = userModel.orderBuyer;
      user.dob = userModel.dob;
      user.products = userModel.products;
      user.biddingIDs = userModel.biddingIDs;
      user.sellingbiddingIDs =userModel.sellingbiddingIDs;
    });
    notifyListeners();
  }

  removeFavItem(String id) {
    var ids = user.wishListIDs;
    ids.remove(id);
    user.wishListIDs = ids;
    saveChanges();
    notifyListeners();
  }

  addFavItem(String id) {
    var ids = user.wishListIDs;
    ids.add(id);
    user.wishListIDs = ids;
    saveChanges();
    notifyListeners();
  }

  void addNewProduct(productid) {
    List<String> ids = [];
    for (var id in user.products) {
      ids.add(id);
    }
    // remove blank address initially
    // ids.remove("");
    ids.add(productid);
    user.products = ids;
    print("added new Product $productid");
    notifyListeners();
  }

  void addNewBid(bidid) {
    List<String> ids = [];
    for (var id in user.biddingIDs) {
      ids.add(id);
    }
    // remove blank address initially
    // ids.remove("");
    ids.add(bidid);
    user.biddingIDs = ids;
    print("added new Bid $bidid");
    notifyListeners();
  }

 void removeBid(bidid) {
   var ids = user.sellingbiddingIDs;
    ids.remove(bidid);
    user.sellingbiddingIDs = ids;
    saveChanges();
    notifyListeners();
  }
  void addSellerOrder(bidid) {
    List<String> ids = [];
    for (var id in user.orderSeller) {
      ids.add(id);
    }
    // remove blank address initially
    // ids.remove("");
    ids.add(bidid);
    user.orderSeller = ids;
    print("added new Selling Order $bidid");
    notifyListeners();
  }

  void addBuyerOrder(bidid) {
    List<String> ids = [];
    for (var id in user.orderBuyer) {
      ids.add(id);
    }
    // remove blank address initially
    // ids.remove("");
    ids.add(bidid);
    user.orderBuyer = ids;
    print("added new Buyer Order $bidid");
    notifyListeners();
  }
}
