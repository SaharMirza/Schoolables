import 'package:flutter/material.dart';

import 'package:flutterdemo/models/buying_orders.dart';
import 'package:flutterdemo/utils.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/search_bar.dart';

import '../../../models/progress.dart';

import '../Widgets/orders_widget.dart';

class BuyingOrders extends StatefulWidget {
  const BuyingOrders({super.key});

  @override
  State<BuyingOrders> createState() => _BuyingOrdersState();
}

class _BuyingOrdersState extends State<BuyingOrders> {
  late int selectedIndex;
  late List<BuyingOrdersClass> filteredItems0;
  late List<BuyingOrdersClass> filteredItems1;
  late List<BuyingOrdersClass> filteredItems2;
  late List<BuyingOrdersClass> filteredItems3 = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedIndex = -1;
    filteredItems0 = [];
    filteredItems1 = [];
    filteredItems2 = [];
    filteredItems3 = [];
  }

  @override
  Widget build(BuildContext context) {
    refresh() {
      setState(
        () {},
      );
    }

    filter(int selectedValue) {
      for (int i = 1; i < buyingOrders.length; i++) {
        if (selectedValue == 1 && buyingOrders[i].progress == "In Progress") {
          if (!filteredItems0.contains(buyingOrders[i])) {
            filteredItems0.add(buyingOrders[i]);
          }
        }
        if (selectedValue == 2 && buyingOrders[i].progress == "Completed") {
          if (!filteredItems1.contains(buyingOrders[i])) {
            filteredItems1.add(buyingOrders[i]);
          }
        }
        if (selectedValue == 3 && buyingOrders[i].progress == "Cancelled") {
          if (!filteredItems2.contains(buyingOrders[i])) {
            filteredItems2.add(buyingOrders[i]);
          }
        }
        if (selectedValue == 4 && buyingOrders[i].progress == "Pending") {
          if (!filteredItems3.contains(buyingOrders[i])) {
            filteredItems3.add(buyingOrders[i]);
          }
          
        }
      }
    }

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            HeaderBar(title: "Buying Orders"),
            SizedBox(
              height: screenHeight * 0.88,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: SearchBar(
                            width: screenWidth, screenHeight: screenHeight),
                      ),
                      const SizedBox(
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
                        children: checkProgress(
                            selectedIndex,
                            false,
                            filteredItems0,
                            filteredItems1,
                            filteredItems2,
                            filteredItems3),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
