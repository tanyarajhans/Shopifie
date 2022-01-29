import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopifie/consts/theme_data.dart';
import 'package:shopifie/provider/dark_theme_provider.dart';
import 'package:shopifie/screens/bottom_bar.dart';
import 'package:shopifie/screens/home.dart';

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
      );
      }
    )
    );
  }
}

