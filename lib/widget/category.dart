

import 'package:flutter/material.dart';

class Category extends StatelessWidget {

  int index;
  Category(this.index);

  List<Map<String, Object>> categories = [
    {
      'categoryName': 'Phones',
      'categoryImagesPath': 'assets/images/CatPhones.png',
    },
    {
      'categoryName': 'Clothes',
      'categoryImagesPath': 'assets/images/CatClothes.jpeg',
    },
    {
      'categoryName': 'Furniture',
      'categoryImagesPath': 'assets/images/CatFurniture.jpeg',
    },
    {
      'categoryName': 'Laptops',
      'categoryImagesPath': 'assets/images/CatLaptops.png',
    },
    {
      'categoryName': 'Beauty',
      'categoryImagesPath': 'assets/images/CatBeauty.jpeg',
    },
    {
      'categoryName': 'Shoes',
      'categoryImagesPath': 'assets/images/CatShoes.jpeg',
    },
    {
      'categoryName': 'Watches',
      'categoryImagesPath': 'assets/images/CatWatches.jpeg',
    }
    

  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: AssetImage(categories[index]['categoryImagesPath'].toString(),
             ),
             fit: BoxFit.cover
            )
          ),
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: 150
        ),

        Positioned(
          bottom:0,
          left:10,
          right: 10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            color: Theme.of(context).backgroundColor,
            child: Text(categories[index]['categoryName'].toString(),
            )
            )
          )
      ],
    );
  }
}