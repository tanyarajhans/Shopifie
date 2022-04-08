import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopifie/provider/products.dart';
import 'package:shopifie/screens/wishlist.dart';
import 'package:shopifie/widget/feeds_products.dart';

import '../consts/colors.dart';
import '../models/product.dart';
import '../provider/cart_provider.dart';
import '../provider/wishlist_provider.dart';
import 'cart.dart';

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
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        title: Text('Feeds'),
        actions: [
          Consumer<WishListProvider>(
                          builder: (context, value, child) => Badge(
                            badgeColor: ColorsConsts.cartBadgeColor,
                            animationType: BadgeAnimationType.slide,
                            toAnimate: true,
                            position: BadgePosition.topEnd(top: 5, end: 7),
                            badgeContent: Text(value.getWishListItems.length.toString(),
                            style: TextStyle(color: Colors.white)),
                            child: IconButton(
                              icon:Icon(Icons.favorite,
                              color: ColorsConsts.favColor,
                            ),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(Wishlist.routeName);
                            },
                                                
                                            ),
                          ),
                        ),
                        Consumer<CartProvider>(
                          builder: (context, value, child) => Badge(
                            badgeColor: ColorsConsts.cartBadgeColor,
                            animationType: BadgeAnimationType.slide,
                            toAnimate: true,
                            position: BadgePosition.topEnd(top: 5, end: 7),
                            badgeContent: Text(value.getCartItems.length.toString(),
                            style: TextStyle(color: Colors.white)),
                            child: IconButton(
                              icon:Icon(Icons.shopping_cart,
                              color: ColorsConsts.cartColor,
                            ),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(Cart.routeName);
                            },
                                                
                                            ),
                          ),
                        ),
        ],
      ),
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