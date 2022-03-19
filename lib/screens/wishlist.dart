import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopifie/provider/wishlist_provider.dart';
import 'package:shopifie/widget/cart_empty.dart';
import 'package:shopifie/widget/cart_full.dart';
import 'package:shopifie/widget/wishlist_empty.dart';
import 'package:shopifie/widget/wishlist_full.dart';

import '../consts/colors.dart';
import '../services/global_methods.dart';

class Wishlist extends StatelessWidget {
  static const routeName = '/Wishlist';

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishListProvider>(context);
    GlobalMethods globalMethods = GlobalMethods();
    return wishlistProvider.getWishListItems.isEmpty? Scaffold(
      body:  WishlistEmpty()
    ) : Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
        actions: [IconButton(onPressed: (){
          globalMethods.showDialogg('Clear wishlist', 'Wishlist will be cleared', () => wishlistProvider.clearCart(), context);
          // cartProvider.clearCart();
        }, 
        icon: Icon(
          Icons.delete))],
      ),
      body: ListView.builder(
        itemCount: wishlistProvider.getWishListItems.length,
        itemBuilder: (context, index){
        return 
        ChangeNotifierProvider.value(
          value: wishlistProvider.getWishListItems.values.toList()[index],
          child: WishlistFull(wishlistProvider.getWishListItems.keys.toList()[index])
          );
      })
    );
  }

  

}
