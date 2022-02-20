import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopifie/consts/theme_data.dart';
import 'package:shopifie/inner_screens/brands_navigation_rail.dart';
import 'package:shopifie/inner_screens/product_details.dart';
import 'package:shopifie/provider/dark_theme_provider.dart';
import 'package:shopifie/screens/bottom_bar.dart';
import 'package:shopifie/screens/cart.dart';
import 'package:shopifie/screens/feeds.dart';
import 'package:shopifie/screens/home.dart';
import 'package:shopifie/screens/wishlist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  // This widget is the root of your application.
  void getCurrentAppTheme() async{
    themeChangeProvider.darkTheme = await themeChangeProvider.darkThemePreferences.getTheme();

  }
  @override
  void initState() {
    // TODO: implement initState
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_){
        return themeChangeProvider;
      }),
    ],
     child: Consumer<DarkThemeProvider>(
      builder: (context, value, child){
      return MaterialApp(
        title: 'Flutter Demo',
        theme: Styles.themeData(themeChangeProvider.darkTheme, context),
        home: BottomBar(),
        routes: {
          BrandNavigationRailScreen.routeName: (context) => BrandNavigationRailScreen(),
          Cart.routeName : (context) => Cart(),
          Feeds.routeName : (context) => Feeds(),
          Wishlist.routeName : (context) => Wishlist(),
          ProductDetails.routeName :(context) => ProductDetails()
        },
      );
      }
    )
    );
  }
}

