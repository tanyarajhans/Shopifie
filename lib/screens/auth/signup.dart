//import 'dart:html';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  File? _pickedImage; 
  bool _obscureText = true;
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
    _auth.createUserWithEmailAndPassword(email: _emailAddress.toLowerCase().trim(), password: _password.trim());
  }

  void _pickImageCamera() async {
    final picker = ImagePicker();
    final pickedImage =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 10);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
    Navigator.pop(context);
  }

  void _pickImageGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
    Navigator.pop(context);
  }

  void _remove() {
    setState(() {
      _pickedImage =File('');
    });
    Navigator.pop(context);
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
          Stack(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: CircleAvatar(
                  radius: 71,
                  backgroundColor: ColorsConsts.gradiendLEnd,
                  child: CircleAvatar(
                    radius: 65,
                    backgroundColor: ColorsConsts.gradiendFEnd,
                    backgroundImage: _pickedImage==null? null: FileImage(_pickedImage!),
                  ),
                ),
              ),
              Positioned(
                top:120,
                left:110,
                child: RawMaterialButton(
                  elevation: 10,
                  fillColor: ColorsConsts.gradiendLEnd,
                  child: Icon(Icons.add_a_photo),
                  padding: EdgeInsets.all(15),
                  shape: CircleBorder(),
                  onPressed: (){
                    showDialog(context: context, builder: (BuildContext context){
                      return AlertDialog(
                        title: Text('Choose option',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: ColorsConsts.gradiendLStart),
                        ),
                        content: SingleChildScrollView(
                                      child: ListBody(
                                        children: [
                                          InkWell(
                                            onTap: _pickImageCamera,
                                            splashColor: Colors.purpleAccent,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    Icons.camera,
                                                    color: Colors.purpleAccent,
                                                  ),
                                                ),
                                                Text(
                                                  'Camera',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          ColorsConsts.title),
                                                )
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: _pickImageGallery,
                                            splashColor: Colors.purpleAccent,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    Icons.image,
                                                    color: Colors.purpleAccent,
                                                  ),
                                                ),
                                                Text(
                                                  'Gallery',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          ColorsConsts.title),
                                                )
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: _remove,
                                            splashColor: Colors.purpleAccent,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    Icons.remove_circle,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                Text(
                                                  'Remove',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.red),
                                                )
                                              ],
                                            ),
                                          ),
                                      

                                       ],
                                      ),
                                    ),
                        
                      );
                    });
                  }
                )
              )
            ],
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
                    textInputAction: TextInputAction.next,
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
                   onEditingComplete: (){
                     FocusScope.of(context).requestFocus(_phoneFocusNode);
                   },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    key: ValueKey('Phone Number'),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please enter a valid phone no.';
                      }
                      return null;
                    },
                    focusNode: _phoneFocusNode,
                    
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(border: const UnderlineInputBorder(),
                    filled: true, 
                    prefixIcon: Icon(Icons.call),
                    
                    labelText: 'Phone Number',
                    fillColor: Theme.of(context).backgroundColor),
                    onSaved: (value){
                      _phoneNumber=int.parse(value!);
                    },
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

