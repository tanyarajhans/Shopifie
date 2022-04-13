import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../../consts/colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);
  static const routeName='/SignUp';
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _emailAddress = '';
  String _fullName = '';
  String _password = '';
  int _phoneNumber=0;
  bool _obscureText = true;
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _phoneFocusNode.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  void _submitForm(){
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if(isValid){
      _formKey.currentState!.save();
    }
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
               
             
          SizedBox(
            height: 30,
          ),
          Form(
              key: _formKey,
              child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    key: ValueKey('Name'),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please enter a valid name';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(_emailFocusNode);
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(border: const UnderlineInputBorder(),
                    filled: true, 
                    prefixIcon: Icon(Icons.person),
                    
                    labelText: 'Full Name',
                    fillColor: Theme.of(context).backgroundColor),
                    onSaved: (value){
                      _fullName=value!;
                    },
                  // onEditingComplete: _submitForm,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    key: ValueKey('Email'),
                    focusNode: _emailFocusNode,
                    validator: (value){
                      if(value!.isEmpty || !value!.contains('@')){
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(_passwordFocusNode);
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(border: const UnderlineInputBorder(),
                    filled: true, prefixIcon: Icon(Icons.email_outlined),
                    labelText: 'Email',
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
                   onEditingComplete: _submitForm,
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
                                       _submitForm();
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'SignUp',
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
                  
        ]),
          )
              ],
            ),
          );
          
  }
}
