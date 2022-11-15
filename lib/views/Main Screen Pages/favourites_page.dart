import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/provider/TabNotifier.dart';
import 'package:flutterdemo/utils.dart';
import 'package:flutterdemo/views/Main%20Screen%20Pages/Widgets/category_list_builder.dart';
import 'package:provider/provider.dart';

class CustomTabBarWidget extends StatelessWidget {
  const CustomTabBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    List<Categories> Category = [
      Categories(name: "Books", image: "images/book.gif"),
      Categories(name: "Stationary", image: "images/stationary.gif"),
      Categories(name: "Bags", image: "images/bag.gif"),
    ];

    TabNotifier tabNotifier({required bool renderUI}) =>
        Provider.of<TabNotifier>(context, listen: renderUI);

    Widget tabHolder() {
      return Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
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
                    foregroundColor:tabNotifier(renderUI: true).tabIndex == index
                            ? Colors.white
                            : Colors.black ,
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
      subWidget({required String title}) {
        return Container(
          height: 300,
          width: 400,
          decoration: BoxDecoration(
              border: Border.all(width: 0.2, color: Colors.white),
              borderRadius: BorderRadius.circular(25)),
          child: Center(child: Text(title)),
        );
      }

      if (kIndex == 0) {
        return subWidget(title: "Content for home");
      }
      if (kIndex == 1) {
        return subWidget(title: "Content for profile");
      }
      return subWidget(title: "Content for settings");
    }

    return Column(
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
    );
  }
}
