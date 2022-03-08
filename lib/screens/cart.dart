import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopifie/provider/cart_provider.dart';
import 'package:shopifie/widget/cart_empty.dart';
import 'package:shopifie/widget/cart_full.dart';

import '../consts/colors.dart';

class Cart extends StatelessWidget {
  static const routeName = '/Cart';

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    
    return cartProvider.getCartItems.isEmpty? Scaffold(
      body:  CartEmpty()
    ) : Scaffold(
      bottomSheet: CheckOutSection(),
      appBar: AppBar(
        
        title: const Text('Cart Itmes Count:', textAlign: TextAlign.left,),
        actions: [IconButton(onPressed: (){}, 
        icon: Icon(
          Icons.delete))],
      ),
      body: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        child: ListView.builder(itemCount: cartProvider.getCartItems.length,itemBuilder: (context, index) => 
        ChangeNotifierProvider.value(
          value: cartProvider.getCartItems.values.toList()[index],
          child: CartFull(
            cartProvider.getCartItems.keys.toList()[index],
            // cartProvider.getCartItems.keys.toList()[index],
            // cartProvider.getCartItems.values.toList()[index].price,
            // cartProvider.getCartItems.values.toList()[index].quantity,
            // cartProvider.getCartItems.values.toList()[index].title,
            // cartProvider.getCartItems.values.toList()[index].imageUrl
          ),
        ))),
      
    );
  }

  

}

class CheckOutSection extends StatelessWidget {
  
    @override
    Widget build(BuildContext context) {
      return Container(
        decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                              gradient: LinearGradient(colors: [
                                ColorsConsts.gradiendLStart,
                                ColorsConsts.gradiendLEnd,
                              ], stops: [
                                0.0,
                                0.7
                              ]),
                            ),
              child: Material(
                
                color: Colors.transparent,
                child: InkWell(
                  onTap: (){},
                  borderRadius: BorderRadius.circular(30.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Checkout', 
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).textSelectionColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      
                    )),
                  )
                )
              ),
            ),
          ),
          Spacer(),
          Text('Total: ', 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).textSelectionColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    
                  )),
                  Text('US \$170.80', 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    
                  )),
        ]),
      ),
      );
    }
  }