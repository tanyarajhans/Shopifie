import 'package:flutter/material.dart';
import 'package:shopifie/screens/cart_empty.dart';
import 'package:shopifie/screens/cart_full.dart';

class Cart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List products = [];
    return Scaffold(
      body: products.isEmpty? CartEmpty(): CartFull()
      
    );
  }
}