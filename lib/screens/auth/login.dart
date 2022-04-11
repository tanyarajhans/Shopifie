import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../../consts/colors.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);
  static const routeName='/Login';
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _emailAddress = '';
  String _password = '';
  bool _obscureText = true;
  final FocusNode _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.95,
            child: RotatedBox(
              quarterTurns: 2,
              child: WaveWidget(
                config: CustomConfig(
                  gradients: [
                    [ColorsConsts.gradiendFStart, ColorsConsts.gradiendLStart],
                    [ColorsConsts.gradiendFEnd, ColorsConsts.gradiendLEnd],
                  ],
                  durations: [19440, 10800],
                  heightPercentages: [0.20, 0.25],
                  blur: MaskFilter.blur(BlurStyle.solid, 10),
                  gradientBegin: Alignment.bottomLeft,
                  gradientEnd: Alignment.topRight,
                ),
                waveAmplitude: 0,
                size: Size(
                  double.infinity,
                  double.infinity,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  
                  margin: EdgeInsets.only(top: 80),
                  alignment: Alignment.center,
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                          //  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage('assets/images/store.png'),
                    fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle,
                    color: Colors.transparent,
                    
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
           margin: EdgeInsets.only(top:200),
            child: Form(
              key: _formKey,
              child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    key: ValueKey('Email'),
                    validator: (value){
                      if(value!.isEmpty || !value!.contains('@')){
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(border: const UnderlineInputBorder(),
                    filled: true, prefixIcon: Icon(Icons.email),
                    labelText: 'Email Address',
                    fillColor: Theme.of(context).backgroundColor),
                    onSaved: (value){
                      _emailAddress=value!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    key: ValueKey('Password'),
                    validator: (value){
                      if(value!.isEmpty || value.length<7){
                        return 'Please enter a valid password';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    focusNode: _passwordFocusNode,
                    decoration: InputDecoration(border: const UnderlineInputBorder(),
                    filled: true, 
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                      onTap: (){
                        setState(() {
                          _obscureText=!_obscureText;
                        });
                        
                      },
                      child: Icon(_obscureText?Icons.visibility:Icons.visibility_off),
                    ),
                    labelText: 'Password',
                    fillColor: Theme.of(context).backgroundColor),
                    onSaved: (value){
                      _password=value!;
                    },
                    obscureText: _obscureText,
                  //  onEditingComplete: ,
                  ),
                ),
                //  Align(
                //           alignment: Alignment.topRight,
                //           child: Padding(
                //             padding: const EdgeInsets.symmetric(
                //                 vertical: 2, horizontal: 20),
                //             child: TextButton(
                //                 onPressed: () {
                //                   Navigator.pushNamed(
                //                       context, ForgetPassword.routeName);
                //                 },
                //                 child: Text(
                //                   'Forget password?',
                //                   style: TextStyle(
                //                       color: Colors.blue.shade900,
                //                       decoration: TextDecoration.underline),
                //                 )),
                //           ),
                //         ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(width: 10),
                            ElevatedButton(
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          side: BorderSide(
                                              color:
                                                  ColorsConsts.backgroundColor),
                                        ),
                                      )),
                                      onPressed:(){
                                    //    Navigator.pushNamed(context, Login.routeName);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Login',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 17),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.verified_user,
                                            size: 18,
                                          )
                                        ],
                                      )),
                            
                            SizedBox(width: 20),
                          ],
                        ),
                      ],
                    ))
          )
              ],
            ),
          );
          
  }
}

