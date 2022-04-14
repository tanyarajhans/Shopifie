import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopifie/screens/user_state.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:shopifie/consts/theme_data.dart';
import 'package:shopifie/inner_screens/brands_navigation_rail.dart';
import 'package:shopifie/inner_screens/categories_feeds.dart';
import 'package:shopifie/inner_screens/product_details.dart';
import 'package:shopifie/inner_screens/upload_product.dart';
import 'package:shopifie/provider/cart_provider.dart';
import 'package:shopifie/provider/dark_theme_provider.dart';
import 'package:shopifie/provider/products.dart';
import 'package:shopifie/screens/auth/login.dart';
import 'package:shopifie/screens/auth/signup.dart';
import 'package:shopifie/screens/bottom_bar.dart';
import 'package:shopifie/screens/cart.dart';
import 'package:shopifie/screens/feeds.dart';
import 'package:shopifie/screens/home.dart';
import 'package:shopifie/screens/landing_page.dart';
import 'package:shopifie/screens/main_screen.dart';
import 'package:shopifie/screens/wishlist.dart';

import 'provider/wishlist_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   
   
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

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<Object>(
      future: _initialization,
      builder: (context, snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          );
        }
        else if(snapshot.error != null){
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            )
          );
        }
        return MultiProvider(providers: [
        ChangeNotifierProvider(create: (_){
          return themeChangeProvider;
        }),
        ChangeNotifierProvider(create: (_){
          return Products();
        }),
        ChangeNotifierProvider(create: (_){
          return CartProvider();
        }),
        ChangeNotifierProvider(create: (_){
          return WishListProvider();
        }),
      ],
       child: Consumer<DarkThemeProvider>(
        builder: (context, value, child){
        return MaterialApp(
          title: 'Flutter Demo',
          theme: Styles.themeData(themeChangeProvider.darkTheme, context),
          home: UserState(),
          routes: {
            BrandNavigationRailScreen.routeName: (context) => BrandNavigationRailScreen(),
            Cart.routeName : (context) => Cart(),
            Feeds.routeName : (context) => Feeds(),
            Wishlist.routeName : (context) => Wishlist(),
            ProductDetails.routeName :(context) => ProductDetails(),
            CategoriesFeeds.routeName:(context) => CategoriesFeeds(),
            Login.routeName:(context) => Login(),
            SignUp.routeName:(context) => SignUp(),
            BottomBar.routeName:(context) => BottomBar(),
            UploadProductForm.routeName:(context) => UploadProductForm()
          },
        );
        }
      )
        );
      }
    );
  }
}

