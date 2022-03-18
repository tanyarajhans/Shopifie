import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopifie/provider/cart_provider.dart';
import 'package:shopifie/widget/cart_empty.dart';
import 'package:shopifie/widget/cart_full.dart';

import '../consts/colors.dart';
import '../services/global_methods.dart';

class Cart extends StatelessWidget {
  static const routeName = '/Cart';

  @override
  Widget build(BuildContext context) {
    GlobalMethods globalMethods = GlobalMethods();
    final cartProvider = Provider.of<CartProvider>(context);
    Future<void> _showDialog(String title, String subtitle, Function fct) async {
    showDialog(context: context, builder: (BuildContext ctx){
      return AlertDialog(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0AVvdQVH2LdtsYFauXEnnrgt2CG1diwowkJ1qLwGXLjJrzStCxFnH4p2rEDA9jkomk54&usqp=CAU',
              height: 20,
              width: 20,),
            ),
            Text(title)
          ],
        ),
        content: Text(subtitle),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel')),
          TextButton(onPressed: (){
            fct();
            Navigator.pop(context);
          }, child: Text('OK')),
        ],
      );
    });
  }
    return cartProvider.getCartItems.isEmpty? Scaffold(
      body:  CartEmpty()
    ) : Scaffold(
      bottomSheet: CheckOutSection(cartProvider.totalAmount),
      appBar: AppBar(
        
        title:  Text('Cart Items Count: (${cartProvider.getCartItems.length})'),
        actions: [IconButton(onPressed: (){
          globalMethods.showDialogg('Clear cart', 'Cart will be cleared', () => cartProvider.clearCart(), context);
          // cartProvider.clearCart();
        }, 
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
    double subtotal;
    CheckOutSection(this.subtotal);
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
                  Text('US ${subtotal.toStringAsFixed(3)}', 
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