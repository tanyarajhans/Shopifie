import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopifie/inner_screens/brands_navigation_rail.dart';
import 'package:shopifie/inner_screens/product_details.dart';

import '../models/product.dart';

class PopularProducts extends StatelessWidget {
  
  // final String imageUrl;
  // final String title;
  // final String description;
  // final double price;

  // const PopularProducts(this.imageUrl, this.title, this.description, this.price );

  @override
  Widget build(BuildContext context) {
    final productsAttributes = Provider.of<Product>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)
          ),
          
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
            onTap: (){
              Navigator.pushNamed(context, ProductDetails.routeName, arguments: productsAttributes.id);
            },
            child: Column(
              children: [
                Stack(children: [
                  Container(
                    height: 140,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(productsAttributes.imageUrl),
                      fit: BoxFit.contain)
                    ),
                  ),
                  Positioned(
                    right: 12,
                    top:10,
                    child: Icon(Icons.star,
                    color: Colors.grey.shade800,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top:8,
                    child: Icon(Icons.star_outlined,
                    color: Colors.white,
                    ),
                  ),
                  Positioned(
                    right: 12,
                    bottom:32,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: Theme.of(context).backgroundColor,
                      child:Text(productsAttributes.price.toString(),
                      style: TextStyle(
                        color: Theme.of(context).textSelectionColor
                      )),
                    ),
                    
                  ),
                ]),
                Container(
                  
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text(productsAttributes.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      )),
                      Row(
                        children: [
                        Expanded(
                          flex:5,
                          child: Text(productsAttributes.description, 
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,)),
                        Spacer(),
                        Expanded(
                          flex:1,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: (){
                                
                              },
                              borderRadius: BorderRadius.circular(30.0),
                              child: Icon(Icons.shopping_cart_rounded,
                              size: 25,),
                            ),
                          ),
                        )
                      ],)
                    ]
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}