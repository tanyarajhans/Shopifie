//using bottombar we can manage our pages

import 'package:flutter/material.dart';
import 'package:shopifie/screens/cart.dart';
import 'package:shopifie/screens/feeds.dart';
import 'package:shopifie/screens/home.dart';
import 'package:shopifie/screens/search.dart';
import 'package:shopifie/screens/user_info.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({ Key? key }) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List _pages = [
    Home(),
    Feeds(),
    Search(),
    Cart(),
    UserInfo()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}