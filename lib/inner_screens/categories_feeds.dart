import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:shopifie/provider/products.dart';
import 'package:shopifie/widget/feeds_products.dart';

import '../models/product.dart';

class CategoriesFeeds extends StatelessWidget {
  static const routeName = '/CategoriesFeeds';
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context, listen: false);
    final categoryName = ModalRoute.of(context)?.settings.arguments as String;
    List<Product> productsList = productsProvider.findByCategory(categoryName);
    return Scaffold(
      body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 240 / 290,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: List.generate(productsList.length, (index) {
            return ChangeNotifierProvider.value(
              value: productsList[index],
              child: FeedProducts(
                
              ),
            );
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