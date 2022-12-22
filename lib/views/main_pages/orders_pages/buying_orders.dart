

import '../../../imports.dart';

class BuyingOrders extends StatefulWidget {
  const BuyingOrders({super.key});

  @override
  State<BuyingOrders> createState() => _BuyingOrdersState();
}

class _BuyingOrdersState extends State<BuyingOrders> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      List<String> bids = context.read<UserProvider>().user.biddingIDs;
      context.read<BiddingProvider>().loadUserBuyingBids(bids);
      List<String> sellerbids = context.read<UserProvider>().user.orderBuyer;
      context.read<BiddingProvider>().loadSellerOrders(sellerbids);
    });
  }

  List<Bidding> userBids = [];
  
  List<Bidding> completedBids=[];
  @override
  Widget build(BuildContext context) {
    //get bids of user
    userBids = context.watch<BiddingProvider>().userBuyingBids.cast<Bidding>();
    completedBids = context.read<BiddingProvider>().sellerOrder.cast<Bidding>();

    //for InProgress bids with isAccepted= true- array of inprogress bids
    final products = context.read<ProductsProvider>().products;
    final Users = context.read<UserProvider>().Users;
    // final userProfile = context.watch<UserProvider>().userProfile;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    getSeller(sellerID) {
      for (int i = 0; i < Users.length; i++) {
        if (Users[i].id == sellerID) return Users[i];
      }
    }

    List<Categories> progress = [
      Categories(name: "In Progress", image: "assets/images/inprogress.gif"),
      Categories(name: "Completed", image: "assets/images/completed.gif"),
      Categories(name: "Cancelled", image: "assets/images/cancelled.gif"),
      Categories(name: "Pending", image: "assets/images/pending.gif"),
    ];

    List<Bidding> orders = [];

    TabNotifier tabNotifier({required bool renderUI}) =>
        Provider.of<TabNotifier>(context, listen: renderUI);

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
                    .map((products) => BuyingOrdersWidget(
                          progresstype: progresstype,
                          product: getProductDetails(products.productID),
                          seller: getSeller(getProductDetails(products.productID)!.sellerID),
                        ))
                    .toList()),
          );
        }
      }

      if (kIndex == 0) {
        print("IN  IN PROGRESS${userBids.length}");
        for (int i = 0; i < userBids.length; i++) {
          if (userBids[i].isAccepted == true && userBids[i].isRejected == false) {
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

      print("IN  IN completed${userBids.length}");
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
                const HeaderBar(title: "Buying Orders"),
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
