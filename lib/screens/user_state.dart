import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopifie/screens/landing_page.dart';
import 'package:shopifie/screens/main_screen.dart';

class UserState extends StatelessWidget {
  const UserState({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, userSnapshot) {
        if(userSnapshot.connectionState == ConnectionState.waiting){
          return Center(
          child: CircularProgressIndicator(),
          );
        }
        else if(userSnapshot.connectionState == ConnectionState.active){
          if(userSnapshot.hasData){
            print('The user is already logged in');
            return MainScreen();
          }
          else{
            print('The user hasn\'t logged in yet');
            return LandingPage();
          }
            
        }
        else if(userSnapshot.hasError){
          return Center(
            child: Text('Error ocurred'),
          );
        }
        throw Exception();
      }
    );
  }
}