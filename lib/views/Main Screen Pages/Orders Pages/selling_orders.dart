import 'package:flutter/material.dart';
import 'package:flutterdemo/models/selling_orders.dart';
import 'package:flutterdemo/utils.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/search_bar.dart';
import '../../../models/progress.dart';
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
  late List<SellingOrdersClass> filteredItems3;

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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            HeaderBar(title: "Selling Orders"),
            SizedBox(
              height: screenHeight * 0.86,
              child: SingleChildScrollView(
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
                        children: checkProgress(
                            selectedIndex,
                            true,
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
