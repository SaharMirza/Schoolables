import 'package:flutter/material.dart';
import 'package:flutterdemo/Entities/user_auth_entity.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/models/favourites.dart';
import 'package:flutterdemo/models/product_model.dart';
import 'package:flutterdemo/provider/TabNotifier.dart';
import 'package:flutterdemo/provider/product_provider.dart';
import 'package:flutterdemo/provider/student_provider.dart';
import 'package:flutterdemo/utils.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/category_list_builder.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/favourites_widget.dart';
import 'package:provider/provider.dart';

class CustomTabBarWidget extends StatefulWidget {
  const CustomTabBarWidget({Key? key}) : super(key: key);

  @override
  State<CustomTabBarWidget> createState() => _CustomTabBarWidgetState();
}

class _CustomTabBarWidgetState extends State<CustomTabBarWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // context.read<CategoriesProvider>().fetchCategories();
      context.read<ProductsProvider>().fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final products = context.read<ProductsProvider>().products;
    final userProfile = context.watch<UserProvider>().userProfile;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    List<ProductModel> Favourites = [];

    for (int i = 0; i < products.length; i++) {
      for (int j = 0; j < userProfile.wishListIDs.length; j++) {
        if (products[i].id == userProfile.wishListIDs[j])
          Favourites.add(products[i]);
      }
    }

    List<Categories> Category = [
      Categories(name: "Books", image: "assets/images/book.gif"),
      Categories(name: "Stationary", image: "assets/images/stationary.gif"),
      Categories(name: "bags", image: "assets/images/bag.gif"),
    ];

    List<ProductModel> fav = [];

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
            child: Center(child: Text("You haven't liked anything yet.")),
          );
        } else {
          return SizedBox(
            height: screenHeight * 0.86,
            child: ListView(
                shrinkWrap: true,
                children: fav
                    .map((products) => favouritesCard(
                        name: products.title,
                        price: products.price.toString(),
                        condition: products.condition,
                        img: "products.image",
                        sellerIMG: "products.sellerImg",
                        sellerName: "products.sellerName",
                        sellerNum: "products.sellerNum"))
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
        print(fav);
        return subWidget(fav: fav);
      }
      if (kIndex == 1) {
        for (int i = 0; i < Favourites.length; i++) {
          if (Favourites[i].category == "Stationary") {
            fav.add(Favourites[i]);
          }
        }
        print(fav);
        return subWidget(fav: fav);
      }
      for (int i = 0; i < Favourites.length; i++) {
        if (Favourites[i].category == "bags") {
          fav.add(Favourites[i]);
        }
      }
      print(fav);
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
