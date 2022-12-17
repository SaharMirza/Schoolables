import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';
import 'package:provider/provider.dart';
import '../../../provider/categories_provider.dart';
import '../Widgets/add_products_widgets.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  List<String> category = [];
  List<String> subCategory = [];
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
  final categories = context.read<CategoriesProvider>().categories;
    for (int i = 0; i < categories.length; i++) {
      if (categories[i].parentID == "0") {
        category.add(categories[i].catName.toString());
      } else {
        subCategory.add(categories[i].catName.toString());
      }
    }
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeaderBar(title: "New Product"),
            SizedBox(
              height: screenHeight * 0.85,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: UploadPictureCard(
                            screenWidth: screenWidth, screenHeight: screenHeight),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AddProductFields(
                            screenWidth: screenWidth, screenHeight: screenHeight),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
