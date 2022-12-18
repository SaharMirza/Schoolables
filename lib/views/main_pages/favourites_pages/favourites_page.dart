import '../../../imports.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
    final products = context.read<ProductsProvider>().products;
    final Users = context.read<UserProvider>().Users;
    final userProfile = context.watch<UserProvider>().userProfile;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    List<ProductModel> Favourites = [];

    for (int i = 0; i < products.length; i++) {
      for (int j = 0; j < userProfile.wishListIDs.length; j++) {
        if (products[i].id == userProfile.wishListIDs[j]) {
          Favourites.add(products[i]);
        }
      }
    }

    getSeller(sellerID) {
      for (int i = 0; i < Users.length; i++) {
        if (Users[i].id == sellerID) return Users[i];
      }
    }

    List<Categories> Category = [
      Categories(name: "Books", image: "assets/images/book.gif"),
      Categories(name: "Stationary", image: "assets/images/stationary.gif"),
      Categories(name: "Bags", image: "assets/images/bag.gif"),
    ];

    List<ProductModel> fav = [];

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
            itemCount: 3,
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
                        Category[index].image,
                        height: screenHeight * 0.2,
                        width: screenWidth * 0.1,
                      ),
                      Text(Category[index].name),
                    ],
                  ),
                ),
              );
            }),
      );
    }

    int kIndex = tabNotifier(renderUI: true).tabIndex;

    Widget mainWidget() {
      subWidget({required List fav}) {
        if (fav.isEmpty) {
          return SizedBox(
            height: screenHeight * 0.7,
            child: const Center(child: Text("You haven't liked anything yet.")),
          );
        } else {
          return SizedBox(
            height: screenHeight * 0.86,
            child: ListView(
                shrinkWrap: true,
                children: fav
                    .map((products) => favouritesCard(
                          id: products.id,
                          name: products.title,
                          price: products.price.toString(),
                          condition: products.condition,
                          isFav: getFav(products.id),
                          img:
                              products.images.isEmpty ? "" : products.images[0],
                          sellerIMG: Users.isEmpty
                              ? ""
                              : getSeller(products.sellerID)!.display,
                          sellerName: Users.isEmpty
                              ? "SellerName"
                              : getSeller(products.sellerID)!.name,
                          sellerNum: Users.isEmpty
                              ? "SellerPhone"
                              : getSeller(products.sellerID)!.phone,
                        ))
                    .toList()),
          );
        }
      }

      if (kIndex == 0) {
        for (int i = 0; i < Favourites.length; i++) {
          if (Favourites[i].category == "Books") {
            fav.add(Favourites[i]);
          }
        }
        return subWidget(fav: fav);
      }
      if (kIndex == 1) {
        for (int i = 0; i < Favourites.length; i++) {
          if (Favourites[i].category == "Stationary") {
            fav.add(Favourites[i]);
          }
        }
        return subWidget(fav: fav);
      }
      for (int i = 0; i < Favourites.length; i++) {
        if (Favourites[i].category == "Bags") {
          fav.add(Favourites[i]);
        }
      }
      return subWidget(fav: fav);
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const HeaderBar(title: "Favourites"),
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
    );
  }
}
