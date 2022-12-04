import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:flutterdemo/models/products.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/category_list_builder.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/product_card.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/sub_heading.dart';
import 'package:provider/provider.dart';
import '../../provider/student_provider.dart';
import 'Widgets/filter_widget.dart';
import 'Widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final userProfile = context.watch<UserProvider>().userProfile;

    print(userProfile.name);

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
              SearchBar(width: screenWidth*0.70, screenHeight: screenHeight),
              //filtericon
              const FilterWidget()
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
          GridView.count(
              childAspectRatio: screenWidth / (screenHeight * 0.8),
              shrinkWrap: true,
              crossAxisCount: 2,
              children: [
                for (var i = 0; i < 6; i++)
                  ProductCard(
                      name: products[i].name,
                      price: products[i].price,
                      image: products[i].image,
                      isFav: products[i].isFav),
              ]),
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

