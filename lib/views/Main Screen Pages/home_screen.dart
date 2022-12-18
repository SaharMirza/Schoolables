import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:flutterdemo/provider/product_provider.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/category_list_builder.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/map_widget.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/product_card_widget.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/sub_heading.dart';
import 'package:provider/provider.dart';
import '../../provider/student_provider.dart';
import 'Widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.cID = ""}) : super(key: key);
  final String cID;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final products = context.watch<ProductsProvider>().nearbyProducts;
    final allproducts = context.read<ProductsProvider>().products;
    final userProfile = context.watch<UserProvider>().userProfile;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

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
          Text('Hi ${userProfile.name}',
              style: MyStyles.googleTitleText(screenWidth * 0.07)),
          SizedBox(height: screenHeight * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //searchbar
              SearchBar(width: screenWidth * 0.70, screenHeight: screenHeight),
              const MapWidget()
            ],
          ),
          SizedBox(height: screenHeight * 0.04),
          const CategoryContainer(),
          SizedBox(height: screenHeight * 0.02),
          SubHeading(
            leading: 'Nearby Products',
            trailing: 'See all',
            products: products.isEmpty ? allproducts : products,
          ),
          SizedBox(height: screenHeight * 0.01),
          allproducts.isEmpty
              ?Container():products.isEmpty? 
              GridView.count(
                  physics: const ScrollPhysics(),
                  childAspectRatio: screenWidth / (screenHeight * 0.8),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: [
                    for (var i = 0; i < 6; i++)
                      ProductCard(
                          pid: allproducts[i].id,
                          name: allproducts[i].title,
                          price: allproducts[i].price.toString(),
                          image: allproducts[i].images[0],
                          isFav: getFav(allproducts[i].id)),
                  ],
                )
              : GridView.count(
                  physics: const ScrollPhysics(),
                  childAspectRatio: screenWidth / (screenHeight * 0.8),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: [
                    for (var i = 0; i < 6; i++)
                      ProductCard(
                          pid: products[i].id,
                          name: products[i].title,
                          price: products[i].price.toString(),
                          image: products[i].images[0],
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
        const SubHeading(
          leading: "Categories",
          trailing: '',
          products: [],
        ),
        Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.08,
            child: const CatergoryListBuilder())
      ],
    );
  }
}
