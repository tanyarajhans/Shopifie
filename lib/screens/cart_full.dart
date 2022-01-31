import 'package:flutter/material.dart';

class CartFull extends StatefulWidget {
  const CartFull({ Key? key }) : super(key: key);

  @override
  _CartFullState createState() => _CartFullState();
}

class _CartFullState extends State<CartFull> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
        
        ),
        color: Theme.of(context).backgroundColor,
      ),
      
      child: Row(
        children: [
          Container(
            width: 130,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage('https://pbs.twimg.com/profile_images/1283958620359516160/p7zz5dxZ.jpg'),
              fit: BoxFit.fill
              )
            ),),
            Column(
              
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Module', style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0
                    )),
                    SizedBox(width:130),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap:(){},
                        borderRadius: BorderRadius.circular(32.0),
                        child: Container(
                          height: 50,
                          width: 50,
                          child: Icon(Icons.close, color: Colors.red)
                        )
                      ),
                    )
                  ],
                )
              ],
            )
      ],
      )
    );
  }
}