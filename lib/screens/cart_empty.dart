import 'package:flutter/material.dart';

class CartEmpty extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top:80.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.4,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/emptycart.png'), 
            fit: BoxFit.fill)
          ),
        ),
        Text('Your cart is empty.',
        style: TextStyle(
          // ignore: deprecated_member_use
          color: Theme.of(context).textSelectionColor,
          fontSize: 36
        )
        )
      ],  
    );
  }
}