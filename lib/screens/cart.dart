import 'package:flutter/material.dart';
import 'package:shopifie/screens/cart_empty.dart';
import 'package:shopifie/screens/cart_full.dart';

class Cart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List products = [];
    return !products.isEmpty? Scaffold(
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
        child: ListView.builder(itemCount: 5,itemBuilder: (context, index) => CartFull())),
      
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
            child: Material(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.red,
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