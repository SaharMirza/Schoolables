import 'package:flutter/material.dart';
import 'package:flutterdemo/Entities/products_entity.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/provider/product_provider.dart';
import 'package:flutterdemo/provider/student_provider.dart';
import 'package:flutterdemo/utils.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Seller%20Pages/edit_product.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/add_products_widgets.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/search_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../constants/fonts.dart';

class YourProductsPage extends StatefulWidget {
  const YourProductsPage({super.key});

  @override
  State<YourProductsPage> createState() => _YourProductsPageState();
}

class _YourProductsPageState extends State<YourProductsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      List<String> products = context.read<UserProvider>().user.products;
      context.read<ProductsProvider>().loadUserProducts(products);
    });
  }

  List<Product> sellerProducts = [];
  bool fetching = false;

  @override
  Widget build(BuildContext context) {
    sellerProducts = context.watch<ProductsProvider>().userProducts;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const HeaderBar(title: "Seller"),
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SearchfilterMapWidget(
                  screenWidth: screenWidth, screenHeight: screenHeight),
              const SizedBox(
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
                      const SizedBox(
                        height: 20,
                      ),
                      sellerProducts.isEmpty
                          ? const CircularProgressIndicator()
                          : context.read<ProductsProvider>().isProductsFetching
                              ? CircularProgressIndicator()
                              : ListView.builder(
                                  physics: const ScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: sellerProducts.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return YourProductCard(
                                        sellerProduct: sellerProducts[index]);
                                  }),
                      const SizedBox(
                        height: 20,
                      ),
                      const AddProductBtn(),
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
  YourProductCard({
    Key? key,
    required this.sellerProduct,
  }) : super(key: key);

  // bool isFav;
  Product sellerProduct;

  @override
  State<YourProductCard> createState() => _YourProductCardState();
}

class _YourProductCardState extends State<YourProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: 110,
        decoration: const BoxDecoration(
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
            child: SizedBox(
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
                            widget.sellerProduct.images[0],
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
                            widget.sellerProduct.title,
                            style: GoogleFonts.poppins(
                              color: MyColors.textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                            // screenWidth * 0.025 - screenHeight * 0.025),
                          ),
                          InkWell(
                              child: const CircleAvatar(
                                radius: 15,
                                child: Icon(
                                  Icons.edit,
                                  color: MyColors.textColor,
                                  size: 15,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditProductPage(
                                            sellerProduct:
                                                widget.sellerProduct)));
                              })
                        ],
                      ),
                      Text("Rs.${widget.sellerProduct.price}",
                          style: MyStyles.googleTextSubtitleListTile(12)),
                      Text(
                        "Condition : ${widget.sellerProduct.condition}/10",
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
