
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopifie/models/wishlist_attributes.dart';
import 'package:shopifie/models/wishlist_attributes.dart';

import '../consts/colors.dart';
import '../models/wishlist_attributes.dart';
import '../provider/wishlist_provider.dart';
import '../services/global_methods.dart';

class WishlistFull extends StatefulWidget {
  final String productId;

  const WishlistFull(this.productId);
  
  @override
  _WishlistFullState createState() => _WishlistFullState();
}

class _WishlistFullState extends State<WishlistFull> {
  @override
  Widget build(BuildContext context) {
    final wishListAttr = Provider.of<WishListAttr>(context);
    
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: 30.0, bottom: 10.0),
          child: Material(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(5.0),
            elevation: 3.0,
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 80,
                      child: Image.network(wishListAttr.imageUrl),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            wishListAttr.title,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            wishListAttr.price.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        positionedRemove(widget.productId)
      ],
    );
  }

  Widget positionedRemove(String productId) {
    final wishlistProvider = Provider.of<WishListProvider>(context);
    GlobalMethods globalMethods = GlobalMethods();
    return Positioned(
      top: 20,
      right: 15,
      child: Container(
        height: 30,
        width: 30,
        child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            padding: EdgeInsets.all(0.0),
            color: ColorsConsts.favColor,
            child: Icon(
              Icons.clear,
              color: Colors.white,
            ),
            onPressed: () => {
              globalMethods.showDialogg('Clear wishlist', 'This product will be removed from wishlist', () => wishlistProvider.removeItem(productId), context),
              
            }
        )
      ),
    );
  }
}