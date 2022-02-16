import 'package:flutter/material.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            onTap: (){},
            child: Column(
              children: [
                Stack(children: [
                  Container(
                    height: 140,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage('https://m.media-amazon.com/images/I/71D9ImsvEtL._UY500_.jpg'),
                      fit: BoxFit.fill)
                    ),
                  ),
                  Positioned(
                    right: 12,
                    top:10,
                    child: Icon(Icons.star_outlined,
                    color: Colors.grey,
                    ),
                  ),
                  Positioned(
                    right: 12,
                    top:7,
                    child: Icon(Icons.star,
                    color: Colors.white,
                    ),
                  ),
                  Positioned(
                    right: 12,
                    bottom:32,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: Theme.of(context).backgroundColor,
                      child:Text('\$ 122',
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
                      Text('Title'),
                      Row(
                        children: [
                        Text('Description'),
                        Spacer(),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: (){},
                            borderRadius: BorderRadius.circular(30.0),
                            child: Icon(Icons.shopping_cart_rounded,
                            size: 25,),
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