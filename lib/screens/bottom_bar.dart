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

  int _index=4;

  void _selectedPage(int index){
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: kBottomNavigationBarHeight,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child:BottomNavigationBar(
          onTap: _selectedPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).textSelectionColor,
          selectedItemColor: Colors.purple,
          currentIndex: _index,
          items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  // title: Text('Home'),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.rss_feed), label: 'Feeds'),
                BottomNavigationBarItem(
                    activeIcon: null, icon: Icon(null), label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.shopping_bag,
                    ),
                    label: 'Cart'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'User'),
              ],
        ),
      ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
        backgroundColor: Colors.purple,
          hoverElevation: 10,
          splashColor: Colors.grey,
          tooltip: 'Search',
          elevation: 4,
          child: Icon(Icons.search),
        onPressed: (){
          setState(() {
            _index =2;
          });
        },
      )),
    );
  }
}