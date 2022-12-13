import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/Entities/parent_entity.dart';
import 'package:flutterdemo/Entities/student_entity.dart';
import 'package:flutterdemo/Entities/user_auth_entity.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:flutterdemo/models/parent_model.dart';
// import 'package:flutterdemo/models/products.dart';
import 'package:flutterdemo/models/product_model.dart';
import 'package:flutterdemo/provider/categories_provider.dart';
import 'package:flutterdemo/provider/parent_provider.dart';
import 'package:flutterdemo/provider/product_provider.dart';
// import 'package:flutterdemo/models/products.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/category_list_builder.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/map_widget.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/product_card.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/sub_heading.dart';
import 'package:provider/provider.dart';
import '../../provider/student_provider.dart';
import 'Widgets/filter_widget.dart';
import 'Widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.cID = ""}) : super(key: key);
  final String cID;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance!.addPostFrameCallback((_) {
  //     // context.read<CategoriesProvider>().fetchCategories();
  //     context.read<ProductsProvider>().fetchProducts();
  //   });
  // }

  bool categoriesFetched = false;
  bool productsFetched = false;
//  bool categoriesFetched=false;


  @override
  Widget build(BuildContext context) {
    final products = context.read<ProductsProvider>().products;
    final userProfile = context.watch<UserProvider>().userProfile;
    // print("DOB"+userProfile.dob);
    final parentProfile = context.watch<ParentProvider>().parentProfile;
    final userAuth = Provider.of<UserAuth?>(context);
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    productsFetched = context.watch<ProductsProvider>().isProductsFetching;
    categoriesFetched =
        context.watch<CategoriesProvider>().isCategoriesFetching;

    // List<String> images = ["URL 1", "URL 2"];
    // List<String> bidingIDs = ["BID 1", "BID 2"];

    print(userProfile.name);
    print('user statue ${userAuth?.id}');

    if (productsFetched == true && categoriesFetched == true) {
      return Column(
        children: [
          SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: const Center(child: CircularProgressIndicator()),
          ),
        ],
      );
    } else {
      return pageRender(userAuth, userProfile, parentProfile, screenWidth,
          screenHeight, products);
    }
  }

  Padding pageRender(
      UserAuth? userAuth,
      UserProfile userProfile,
      ParentProfile parentProfile,
      double screenWidth,
      double screenHeight,
      List<ProductModel> products) {
      bool getFav(ID) {
      bool fav = false;
      for (int i = 0; i < userProfile.wishListIDs.length; i++) {
        if (ID == userProfile.wishListIDs[i]) {
          fav = true;
        }
      }
      return fav;
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          userAuth?.id != null
              ? Text('Hi ${userProfile.name}',
                  style: MyStyles.googleTitleText(screenWidth * 0.07))
              : Text('Hi ${parentProfile.name}',
                  style: MyStyles.googleTitleText(screenWidth * 0.07)),
          SizedBox(height: screenHeight * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //searchbar
              SearchBar(width: screenWidth * 0.60, screenHeight: screenHeight),
              //filtericon
              const FilterWidget(),
              const MapWidget()
            ],
          ),
          SizedBox(height: screenHeight * 0.04),
          const CategoryContainer(),
          SizedBox(height: screenHeight * 0.02),
          const SubHeading(
            leading: 'Nearby Products',
            trailing: 'See all',
          ),
          SizedBox(height: screenHeight * 0.01),
          products.isEmpty
              ? Container()
              : GridView.count(
                physics: ScrollPhysics(),
                  childAspectRatio: screenWidth / (screenHeight * 0.8),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: [
                      for (var i = 0; i < 6; i++)
                        ProductCard(
                            pid:   products[i].id,
                            name:  products[i].title,
                            price: products[i].price.toString(),
                            image: "",
                            isFav: getFav(products[i].id)),
                  ],
          ),
        ],
      ),
    );
  }
}

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SubHeading(leading: "Categories", trailing: ''),
        Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.08,
            child: const CatergoryListBuilder())
      ],
    );
  }
}
