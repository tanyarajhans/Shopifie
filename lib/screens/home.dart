import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';

import '../consts/colors.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackdropScaffold(
        appBar: BackdropAppBar(
          title: Text("Home"),
          leading: BackdropToggleButton(
        icon: AnimatedIcons.menu_home
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            ColorsConsts.starterColor,
            ColorsConsts.endColor
          ])
        ),
      ),
          actions:  <Widget>[
            IconButton(
              iconSize: 15,
              onPressed: () {
                
              }, 
              icon: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 13,
                  backgroundImage: NetworkImage('https://t3.ftcdn.net/jpg/01/83/55/76/240_F_183557656_DRcvOesmfDl5BIyhPKrcWANFKy2964i9.jpg'),
                )
              )
            )
          ],
        ),
        backLayer: const Center(
          child: Text("Back Layer"),
        ),
        frontLayer: const Center(
          child: Text("Front Layer"),
        ),
      ),
      
    );
  }
}