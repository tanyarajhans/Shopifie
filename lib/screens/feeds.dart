import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:shopifie/provider/products.dart';
import 'package:shopifie/widget/feeds_products.dart';

import '../models/product.dart';

class Feeds extends StatelessWidget {
  static const routeName = '/Feeds';
  @override
  Widget build(BuildContext context) {
    final String? popular = ModalRoute.of(context)!.settings.arguments.toString()??"";
    final productsProvider = Provider.of<Products>(context);
    List<Product> productsList = productsProvider.products;
    if(popular=='Popular'){
      productsList = productsProvider.findPopularProducts;
    }
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