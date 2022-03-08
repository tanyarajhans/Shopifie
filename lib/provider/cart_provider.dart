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
  
  void addToCart(String productId, double price, String title, String imageUrl){
    if(_cartItems.containsKey(productId)){
      _cartItems.update(productId, (existingCartItem) =>
        CartAttr(
          existingCartItem.id,
          existingCartItem.title,
          existingCartItem.quantity+1,
          existingCartItem.price,
          existingCartItem.imageUrl,
      ));
    }
    else{
      _cartItems.putIfAbsent(productId, ()=>
        CartAttr(
          DateTime.now().toString(),
          title,
          1,
          price,
          imageUrl,
      ));
    }
    notifyListeners();
  }

  void reduceItemByOne(String productId, double price, String title, String imageUrl){
    if(_cartItems.containsKey(productId)){
      _cartItems.update(productId, (existingCartItem) =>
        CartAttr(
          existingCartItem.id,
          existingCartItem.title,
          existingCartItem.quantity-1,
          existingCartItem.price,
          existingCartItem.imageUrl,
      ));
    }
    
    notifyListeners();
  }
}