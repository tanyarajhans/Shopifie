import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopifie/consts/colors.dart';
import 'package:shopifie/models/dark_theme_preferences.dart';

import '../provider/dark_theme_provider.dart';

class CartEmpty extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
        textAlign: TextAlign.center,
        style: TextStyle(
          // ignore: deprecated_member_use
          color: Theme.of(context).textSelectionColor,
          fontSize: 36,
          fontWeight: FontWeight.w600
        )
        ),
        SizedBox(
          height: 30.0
        ),
        Text('Looks like you didn\'t add anything to cart.',
        textAlign: TextAlign.center,
        style: TextStyle(
          // ignore: deprecated_member_use
          color: themeChange.darkTheme? Theme.of(context).disabledColor: ColorsConsts.subTitle,
          fontSize: 26,
          fontWeight: FontWeight.w600
        )
        ),
        SizedBox(
          height: 30.0
        ),
        Container(
          width: MediaQuery.of(context).size.width*0.9,
          height: MediaQuery.of(context).size.height*0.05,
          child: ElevatedButton(
            onPressed: (){}, 
            child: Text('SHOP NOW',
          textAlign: TextAlign.center,
          style: TextStyle(
            // ignore: deprecated_member_use
            color: Theme.of(context).textSelectionColor,
            fontSize: 26,
            fontWeight: FontWeight.w600
           )
          ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: Colors.red)
              )
            )
            )
          ),
        )
      ],  
    );
  }
}