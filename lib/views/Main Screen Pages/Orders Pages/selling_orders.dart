import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/models/SellingOrders.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/search_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../constants/fonts.dart';
import '../../../controllers/progress_type_provider.dart';
import '../../../models/Progress.dart';
import '../Widgets/my_profile.dart';
import '../Widgets/orders_widget.dart';

class SellingOrders extends StatefulWidget {
  const SellingOrders({super.key});

  @override
  State<SellingOrders> createState() => _SellingOrdersState();
}

class _SellingOrdersState extends State<SellingOrders> {
  late int selectedIndex;

  late List<SellingOrdersClass> filteredItems0;
  late List<SellingOrdersClass> filteredItems1;
  late List<SellingOrdersClass> filteredItems2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedIndex = -1;
    filteredItems0 = [];
    filteredItems1 = [];
    filteredItems2 = [];
  }

  filter(int selectedValue) {
    for (int i = 0; i < sellingOrders.length; i++) {
      if (selectedValue == 1 && sellingOrders[i].progress == "In Progress") {
        if (!filteredItems0.contains(sellingOrders[i])) {
          filteredItems0.add(sellingOrders[i]);
        }
      }
      if (selectedValue == 2 && sellingOrders[i].progress == "Completed") {
        if (!filteredItems1.contains(sellingOrders[i])) {
          filteredItems1.add(sellingOrders[i]);
        }
      }
      if (selectedValue == 3 && sellingOrders[i].progress == "Cancelled") {
        if (!filteredItems2.contains(sellingOrders[i])) {
          filteredItems2.add(sellingOrders[i]);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    refresh() {
      setState(
        () {},
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Delivery Orders",
          style: MyStyles.googleSecondTitleText(
              screenWidth * 0.02 + screenHeight * 0.02),
        ),
        elevation: 2,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              iconSize: 50,
              onPressed: (() {}),
              icon: ProfileIcon(
                img:
                    "https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/user-profile-icon.png",
                radius: screenWidth * 0.03 + screenHeight * 0.01,
              )
              // Icon(Icons.account_circle_outlined)
              ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: SearchBar(
                    width: screenWidth, screenHeight: screenHeight),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: progress.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ProgressWidget2(
                            text: progress[index].name,
                            index: index,
                            selected: selectedIndex,
                            onValueChanged: (int value) {
                              selectedIndex = value;
                              refresh();

                              filter(value);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              ListView(
                shrinkWrap: true,
                children: selectedIndex == -1 || selectedIndex == 0
                    ? sellingOrders
                        .map(
                          (book) => SellingOrdersCard(
                            name: book.name,
                            price: book.price,
                            condition: book.condition,
                            progress: book.progress,
                            img: book.image,
                            sellerIMG: "",
                            sellerName: "",
                            sellerNum: "",
                            isSell: false,
                          ),
                        )
                        .toList()
                    : selectedIndex == 1
                        ? filteredItems0
                            .map(
                              (book) => SellingOrdersCard(
                                name: book.name,
                                price: book.price,
                                condition: book.condition,
                                progress: book.progress,
                                img: book.image,
                                sellerIMG: "",
                                sellerName: "",
                                sellerNum: "",
                                isSell: false,
                              ),
                            )
                            .toList()
                        : selectedIndex == 2
                            ? filteredItems1
                                .map(
                                  (book) => SellingOrdersCard(
                                    name: book.name,
                                    price: book.price,
                                    condition: book.condition,
                                    progress: book.progress,
                                    img: book.image,
                                    sellerIMG: "",
                                    sellerName: "",
                                    sellerNum: "",
                                    isSell: false,
                                  ),
                                )
                                .toList()
                            : filteredItems2
                                .map(
                                  (book) => SellingOrdersCard(
                                    name: book.name,
                                    price: book.price,
                                    condition: book.condition,
                                    progress: book.progress,
                                    img: book.image,
                                    sellerIMG: "",
                                    sellerName: "",
                                    sellerNum: "",
                                    isSell: false,
                                  ),
                                )
                                .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
