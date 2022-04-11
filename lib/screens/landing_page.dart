
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:shopifie/consts/colors.dart';

import 'auth/login.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({ Key? key }) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override

  void initState(){
    super.initState();
    _animationController=AnimationController(vsync: this, duration: Duration(seconds: 20));
    _animation=CurvedAnimation(parent: _animationController, curve: Curves.linear)
    ..addListener((){
      setState(() {
        
      });
    })..addStatusListener((animationStatus){
      if(animationStatus==AnimationStatus.completed){
        _animationController.reset();
      }
    });
    _animationController.forward();
  }

  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: 'https://st3.depositphotos.com/7375876/i/600/depositphotos_318573922-stock-photo-shopping-bags-hands-hand-young.jpg',
         //  placeholder: (context, url)=>Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0AVvdQVH2LdtsYFauXEnnrgt2CG1diwowkJ1qLwGXLjJrzStCxFnH4p2rEDA9jkomk54&usqp=CAU',
          // fit: BoxFit.contain),
            errorWidget: (context, url, error)=>Icon(Icons.error_outline),
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: FractionalOffset(_animation.value, 0),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30,),
                Text('Welcome',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600
                ),),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Welcome to the biggest online store',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w400
                  ),),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  SizedBox(width: 10,),
                  Expanded(
                    child: ElevatedButton(
                      
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: ColorsConsts.backgroundColor),
                      ),
                    )),
                    
                      onPressed: (){
                        Navigator.pushNamed(context, Login.routeName);
                      }, 
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text('Login',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17
                        ),
                        ),
                        SizedBox(width: 5,),
                        Icon(Icons.supervised_user_circle,
                        size: 20,)
                        ]
                      )
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.pink.shade400),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: ColorsConsts.backgroundColor),
                      ),
                    )),
                      onPressed: (){}, 
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text('Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17
                        ),
                        ),
                        SizedBox(width: 5,),
                        Icon(Icons.verified_user_outlined,
                        size: 20,)
                        ]
                      )
                    ),
                  ),
                  SizedBox(width: 10,),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Divider(
                        color: Colors.white,
                        thickness: 2,
                      ),
                    ),
                  ),
                  Text('Or continue with'),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Divider(
                        color: Colors.white,
                        thickness: 2,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlineButton(onPressed: (){}, 
                  shape: StadiumBorder(),
                  highlightedBorderColor: Colors.red.shade200,
                  borderSide: BorderSide(width: 2, color: Colors.red ),
                  child: Text('Google +')
                  ),
                  OutlineButton(onPressed: (){}, 
                  shape: StadiumBorder(),
                  highlightedBorderColor: Colors.deepPurple.shade200,
                  borderSide: BorderSide(width: 2, color: Colors.deepPurple ),
                  child: Text('Sign In as a Guest')
                  ),
                ],
              ),
              SizedBox(height: 40,),
            ],
          )
        ],
      ),
    );
  }
}