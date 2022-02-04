import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopifie/consts/colors.dart';
import 'package:shopifie/provider/dark_theme_provider.dart';

class CartFull extends StatefulWidget {
  const CartFull({ Key? key }) : super(key: key);

  @override
  _CartFullState createState() => _CartFullState();
}

class _CartFullState extends State<CartFull> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      height: 135,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
        
        ),
        color: Colors.blueAccent,
      ),
      
      child: Row(
        children: [
          Container(
            width: 130,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage('https://m.media-amazon.com/images/I/71D9ImsvEtL._UY500_.jpg'),
              fit: BoxFit.fill
              )
            ),),
              Flexible(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Module', style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.0
                        )),
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
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      Text('Price: '),
                      SizedBox(width: 5.0,),
                      Text('450', style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                    ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      Text('Sub Total: '),
                      SizedBox(width: 5.0,),
                      Text('450', style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600,
                              color: themeChange.darkTheme? Colors.brown : Theme.of(context).accentColor)),
                    ],
                    ),
                    Row(children: [
                      Text('Ships Free', style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600,
                              color: themeChange.darkTheme? Colors.brown : Theme.of(context).accentColor)),
                      Spacer(),
                      Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap:(){},
                            borderRadius: BorderRadius.circular(4.0),
                            child: Container(
                              padding: EdgeInsets.all(5.0),
                              child: Icon(Icons.remove, color: Colors.red)
                            )
                          ),
                        ),
                        Card(
                          elevation: 12,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.12,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                ColorsConsts.gradiendLStart,
                                ColorsConsts.gradiendLEnd,
                              ], stops: [
                                0.0,
                                0.7
                              ]),
                            ),
                            child: Text(
                              'q',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap:(){},
                            borderRadius: BorderRadius.circular(4.0),
                            child: Container(
                              padding: EdgeInsets.all(5.0),
                              child: Icon(Icons.add, color: Colors.green)
                            )
                          ),
                        ),
                    ],)
                  ],
                ),
              ),
            )
      ],
      )
    );
  }
}