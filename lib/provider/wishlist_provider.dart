import 'package:flutter/cupertino.dart';
import 'package:shopifie/models/wishlist_attributes.dart';

class WishListProvider with ChangeNotifier{
  Map<String, WishListAttr> _wishlistItems = {};


  Map<String, WishListAttr> get getWishListItems{
    return _wishlistItems;
  }

  // double get totalAmount{
  //   var total = 0.0;
  //   _cartItems.forEach((key, value) {
  //     total+=value.price*value.quantity;
  //   });
  //   return total;
  // }
  
  void addToWishList(String productId, double price, String title, String imageUrl){
    if(_wishlistItems.containsKey(productId)==false){
      _wishlistItems.putIfAbsent(productId, ()=>
        WishListAttr(
          DateTime.now().toString(),
          title,
          price,
          imageUrl,
      ));
    }
    else{
      removeItem(productId);
    }
    notifyListeners();
  }

  // void reduceItemByOne(String productId, ){
  //   if(_cartItems.containsKey(productId)){
  //     _cartItems.update(productId, (existingCartItem) =>
  //       CartAttr(
  //         existingCartItem.id,
  //         existingCartItem.title,
  //         existingCartItem.quantity-1,
  //         existingCartItem.price,
  //         existingCartItem.imageUrl,
  //     ));
  //   }
    
  //   notifyListeners();
  // }

  void removeItem(String productId){
    _wishlistItems.remove(productId);
    notifyListeners();
  }

  void clearCart(){
    _wishlistItems.clear();
    notifyListeners();
  }
}