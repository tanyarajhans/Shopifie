import 'package:flutter/cupertino.dart';
import 'package:shopifie/models/cart_attributes.dart';

class CartProvider with ChangeNotifier{
  Map<String, CartAttr> _cartItems = {};


  Map<String, CartAttr> get getCartItems{
    return _cartItems;
  }

  double get totalAmount{
    var total = 0.0;
    _cartItems.forEach((key, value) {
      total+=value.price*value.quantity;
    });
    return total;
  }

}