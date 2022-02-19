import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shopifie/widget/feeds_products.dart';

class Feeds extends StatelessWidget {
  static const routeName = '/Feeds';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 240 / 290,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: List.generate(100, (index) {
            return FeedProducts();
          }),
        ),
    );
  }
}

// GridView.count(
//         crossAxisCount: 2,
//         childAspectRatio: 250/300,
//         crossAxisSpacing: 8,
//         mainAxisSpacing: 8,
//         children: 
//           List.generate(100, (index) => FeedProducts())
//         ,)