import 'package:flutter/material.dart';
import 'package:shopifie/widget/cart_empty.dart';
import 'package:shopifie/widget/cart_full.dart';
import 'package:shopifie/widget/wishlist_empty.dart';
import 'package:shopifie/widget/wishlist_full.dart';

import '../consts/colors.dart';

class Wishlist extends StatelessWidget {
  static const routeName = '/Wishlist';

  @override
  Widget build(BuildContext context) {
    List wishlist = [];
    return !wishlist.isEmpty? Scaffold(
      body:  WishlistEmpty()
    ) : Scaffold(
      appBar: AppBar(
        title: Text('WIshlist'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index){
        return WishlistFull();
      })
    );
  }

  

}
