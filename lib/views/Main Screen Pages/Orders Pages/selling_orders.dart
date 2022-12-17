import 'package:flutter/material.dart';
// import 'package:flutterdemo/models/selling_orders.dart';
import 'package:flutterdemo/utils.dart';
import '../Widgets/orders_widget.dart';

import 'package:flutterdemo/Entities/bidding_entity.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/models/product_model.dart';
import 'package:flutterdemo/provider/TabNotifier.dart';
import 'package:flutterdemo/provider/bidding_provider.dart';
import 'package:flutterdemo/provider/product_provider.dart';
import 'package:flutterdemo/provider/student_provider.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/category_list_builder.dart';
import 'package:provider/provider.dart';

class SellingOrders extends StatefulWidget {
  const SellingOrders({super.key});

  @override
  State<SellingOrders> createState() => _SellingOrdersState();
}

class _SellingOrdersState extends State<SellingOrders> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      List<String> bids = context.read<UserProvider>().user.sellingbiddingIDs;
      context.read<BiddingProvider>().loadUserBids(bids);
      List<String> sellerbids = context.read<UserProvider>().user.orderSeller;
      context.read<BiddingProvider>().loadSellerOrders(sellerbids);
    });
  }

  List<Bidding> userBids = [];
  List<Bidding> completedBids=[];
  @override
  Widget build(BuildContext context) {
    //get bids of user
    userBids = context.watch<BiddingProvider>().userBids;
    completedBids = context.read<BiddingProvider>().sellerOrder;

    //for InProgress bids with isAccepted= true- array of inprogress bids
    final products = context.read<ProductsProvider>().products;
    // final Users = context.read<UserProvider>().Users;
    final userProfile = context.watch<UserProvider>().userProfile;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    List<Categories> progress = [
      Categories(name: "In Progress", image: "assets/images/book.gif"),
      Categories(name: "Completed", image: "assets/images/stationary.gif"),
      Categories(name: "Cancelled", image: "assets/images/bag.gif"),
      Categories(name: "Pending", image: "assets/images/bag.gif"),
    ];

    List<ProductModel> fav = [];
    List<Bidding> orders = [];

    TabNotifier tabNotifier({required bool renderUI}) =>
        Provider.of<TabNotifier>(context, listen: renderUI);
    bool getFav(ID) {
      bool fav = false;
      for (int i = 0; i < userProfile.wishListIDs.length; i++) {
        if (ID == userProfile.wishListIDs[i]) {
          fav = true;
        }
      }
      return fav;
    }

    Widget tabHolder() {
      return Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.08,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    tabNotifier(renderUI: false).setTabIndex(kValue: index);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 8,
                    foregroundColor:
                        tabNotifier(renderUI: true).tabIndex == index
                            ? Colors.white
                            : Colors.black,
                    backgroundColor:
                        tabNotifier(renderUI: true).tabIndex == index
                            ? MyColors.buttonColor
                            : Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 16,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        progress[index].image,
                        height: screenHeight * 0.2,
                        width: screenWidth * 0.1,
                      ),
                      Text(progress[index].name),
                    ],
                  ),
                ),
              );
            }),
      );
    }

    int kIndex = tabNotifier(renderUI: true).tabIndex;

    Widget mainWidget() {
      getProductDetails(pid) {
        // Product product = await context.read<ProductsProvider>().getProductByID(pid);
        for (int i = 0; i < products.length; i++) {
          if (pid == products[i].id) {
            print(products[i].images[0]);
            return products[i];
          }
        }
      }

      subWidget({required List order, progresstype}) {
        if (order.isEmpty) {
                   return SizedBox(
            height: screenHeight * 0.7,
            child: Center(child: Text("You Dont have any Orders $progresstype." )),
          );
        } else {
          return SizedBox(
            height: screenHeight * 0.75,
            child: ListView(
                shrinkWrap: true,
                children: order
                    .map((products) => SellingOrdersWidget(
                      bid:products,
                          product: getProductDetails(products.productID),
                          progresstype: progresstype,
                        ))
                    .toList()),
          );
        }
      }

      if (kIndex == 0) {
        print("IN  IN PROGRESS${userBids.length}");
        for (int i = 0; i < userBids.length; i++) {
          if (userBids[i].isAccepted == true &&
              userBids[i].isRejected == false) {
            orders.add(userBids[i]);
          }
        }
        print(orders);
        return subWidget(order: orders, progresstype: "In Progress");
      }
      if (kIndex == 2) {
        print("IN  IN cancelled${userBids.length}");
        for (int i = 0; i < userBids.length; i++) {
          if (userBids[i].isRejected == true &&
              userBids[i].isAccepted == false) {
            orders.add(userBids[i]);
          }
        }
        print(orders);
        return subWidget(order: orders, progresstype: "Cancelled");
      }
      if (kIndex == 3) {
        print("IN  IN pending${userBids.length}");
        for (int i = 0; i < userBids.length; i++) {
          if (userBids[i].isRejected == false &&
              userBids[i].isAccepted == false) {
            orders.add(userBids[i]);
          }
        }
        print(orders);
        return subWidget(order: orders, progresstype: "Pending");
      }

      print("IN  IN completed${completedBids.length}");
      for (int i = 0; i < completedBids.length; i++) {
       
          orders.add(completedBids[i]);
        
      }
      print(orders);
      return subWidget(order: orders, progresstype: "Completed");
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const HeaderBar(title: "Selling Orders"),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [tabHolder()],
                ),
                const SizedBox(height: 10),
                mainWidget(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}
