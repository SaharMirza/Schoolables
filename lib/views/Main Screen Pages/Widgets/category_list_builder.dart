import 'package:flutter/material.dart';

class CatergoryListBuilder extends StatelessWidget {
  const CatergoryListBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    borderRadius: BorderRadius.circular(20.0)),
              ),
              child: Row(
                children: [
                  Image.asset(
                    Category[index].image,
                    height: 100,
                    width: 30,
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
