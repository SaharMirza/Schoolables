import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterdemo/Entities/products_entity.dart';
import 'package:flutterdemo/Entities/user_auth_entity.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/models/product_model.dart';
import 'package:flutterdemo/provider/product_provider.dart';
import 'package:flutterdemo/provider/student_provider.dart';
import 'package:flutterdemo/utils.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/add_products_widgets.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/filter_widget.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/map_widget.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/search_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../constants/fonts.dart';
import '../Widgets/my_profile.dart';

class YourProductsPage extends StatefulWidget {
  const YourProductsPage({super.key});

  @override
  State<YourProductsPage> createState() => _YourProductsPageState();
}

class _YourProductsPageState extends State<YourProductsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // context.read<CategoriesProvider>().fetchCategories();
      List<String> products = context.read<UserProvider>().user.products;
      context.read<ProductsProvider>().loadUserProducts(products);
    });
  }
   List<Product> sellerProducts=[];
 bool fetching =false;
  @override
  Widget build(BuildContext context) {
    // fetching = context.watch<ProductsProvider>().isProductFetching;
    sellerProducts = context.watch<ProductsProvider>().userProducts;
    // final userAuth = Provider.of<UserAuth?>(context);
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    // List<ProductModel> sellerProducts = [];

    // for (int i = 0; i < products.length; i++) {
    //   if (products[i].sellerID == userAuth?.id) sellerProducts.add(products[i]);
    // }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          HeaderBar(title: "Seller"),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SearchfilterMapWidget(
                  screenWidth: screenWidth, screenHeight: screenHeight),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Your Products",
                            style: MyStyles.googleSecondTitleText(
                                screenWidth * 0.04 + screenHeight * 0.01),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        physics: ScrollPhysics(),
                          shrinkWrap: true,
                          // scrollDirection: Axis.horizontal,
                          itemCount: sellerProducts.length,
                          itemBuilder: (BuildContext context, int index) {
                            return YourProductCard(name: sellerProducts[index].title, price: sellerProducts[index].price.toString(), image: sellerProducts[index].images[0], condition: sellerProducts[index].condition);
                          }),
                      // YourProductCard(),
                      // YourProductCard(),
                      SizedBox(
                        height: 20,
                      ),
                      AddProductBtn(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class YourProductCard extends StatefulWidget {
   YourProductCard({ Key? key,
    // required this.pid,
    required this.name,
    required this.price,
    required this.image,
    required this.condition
  }) : super(key: key);

  final String name;
  final String condition;
  final String price;
  final String image;
  // bool isFav;


  @override
  State<YourProductCard> createState() => _YourProductCardState();
}

class _YourProductCardState extends State<YourProductCard> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: MyColors.startColor,
              blurRadius: 10.0,
              spreadRadius: 0,
              offset: Offset(
                0, // Move to right 10  horizontally
                7.0, // Move to bottom 10 Vertically
              ),
            ),
          ],
        ),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17.0),
            // side: BorderSide(color: MyColors.borderColor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: 800,
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        // border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            "https://images.unsplash.com/photo-1543002588-bfa74002ed7e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fG1hdGglMjBib29rfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
                          ),
                        )),
                    width: 70,
                    height: 70,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.name,
                            style: GoogleFonts.poppins(
                              color: MyColors.textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                            // screenWidth * 0.025 - screenHeight * 0.025),
                          ),
                          Text(
                            "Edit",
                            style: GoogleFonts.poppins(
                              color: MyColors.textColor,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Text("Rs." +widget.price,
                          style: MyStyles.googleTextSubtitleListTile(12)),
                      Text(
                        "Book Condition : ${widget.condition}/10",
                        style: MyStyles.googleTextSubtitleListTile(12),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
