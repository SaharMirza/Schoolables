import 'package:flutter/material.dart';

class CatergoryListBuilder extends StatelessWidget {
  const CatergoryListBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    List<Categories> Category = [
      Categories(name: "Books", image: "images/book.gif"),
      Categories(name: "Stationary", image: "images/stationary.gif"),
      Categories(name: "Bags", image: "images/bag.gif"),
    ];

    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: Category.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 8,
                backgroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
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
        });
  }
}

class Categories {
  final String name;
  final String image;

  Categories({
    required this.name,
    required this.image,
  });
}
