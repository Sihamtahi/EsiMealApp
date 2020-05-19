import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marketing_app/commons/loading.dart';
import 'package:marketing_app/db/auth.dart';
import 'package:marketing_app/pages/signup.dart';
import 'package:marketing_app/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'cart.dart';
import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();



  bool hidePass = true;

  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 3;
    final user = Provider.of<UserProvider>(context);

    return Scaffold(
      key: _key,
      body: user.status == Statuus.Authenticating ? Loading() :Stack(
       // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(120.0),
            child: Container(
                alignment: Alignment.topCenter,
                child: Image.asset('images/cart.png', width: 120.0,)),
          ),


          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 250.0),
              child: Center(
                child: Form(
                    key: _formKey,
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14.0,8.0,14.0,8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.withOpacity(0.2),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left:12.0),
                              child: TextFormField(
                                controller: _emailTextController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Email",
                                  icon: Icon(Icons.alternate_email),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    Pattern pattern =
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                    RegExp regex = new RegExp(pattern);
                                    if (!regex.hasMatch(value))
                                      return 'Please make sure your email address is valid';
                                    else
                                      return null;
                                  }
                                },
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(14.0,8.0,14.0,8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.withOpacity(0.2),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left:12.0),
                              child: TextFormField(
                                controller: _passwordTextController,
                                obscureText: hidePass,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  icon: Icon(Icons.lock_outline),
                                ),
                                validator: (value){
                                  if(value.isEmpty){
                                    return "The password field cannot be empty";
                                  }else if(value.length < 6){
                                    return "the password has to be at least 6 characters long";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(14.0,8.0,14.0,8.0),
                          child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                               color: Colors.deepOrange.shade700,
                              elevation: 0.0,

                              child: MaterialButton(onPressed: ()async{
                                if(_formKey.currentState.validate()){
                                  if(!await user.signIn(_emailTextController.text, _passwordTextController.text)){
                                    _key.currentState.showSnackBar(SnackBar(content: Text("Sign in failed")));
                                  }
                                }
                              },
                                minWidth: MediaQuery.of(context).size.width,
                                child: Text("Login", textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),),
                              )
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                              child: Text("Forgot password", textAlign: TextAlign.center, style: TextStyle(color: Colors.black,  fontWeight: FontWeight.w400,fontSize: 16.0),),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                              child: InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                                  },
                                  child: Text("Create an account", textAlign: TextAlign.center, style: TextStyle(color: Colors.black,  fontWeight: FontWeight.w400,fontSize: 16.0),)),

                            ),
                          ],

                        ),


                        Text("Other login in opntion",textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                                  child: InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                                      },
                                      child: Text("Or", textAlign: TextAlign.center, style: TextStyle(color: Colors.black,  fontWeight: FontWeight.w400,fontSize: 16.0),)),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                                      child: Material(
                                          child: MaterialButton(
                                              onPressed: () {},
                                              child: Image.asset("images/fb1.png", width: 60,)
                                          )),
                                    ),

                                    Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                                      child: Material(
                                          child: MaterialButton(
                                              onPressed: () async{
                                           if(await user.googleSignIn()==true){
                                             Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                                             }
                                             else{
                                             _key.currentState.showSnackBar(SnackBar(content: Text("Sign in with Google failed")));
                                           }

                                              },
                                              child: Image.asset("images/ggg.png", width: 60,)
                                          )),
                                    ),
                                  ],
                                ),
                                Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: <Widget>[
                                     Padding( padding:
                                         const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                                         child: Material(
                                         child: MaterialButton(
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                                          },
                                          child: Text("Login without account", textAlign: TextAlign.center, style: TextStyle(color: Colors.red,  fontWeight: FontWeight.w400,fontSize: 16.0),)
                                          )),
                                     ),
                                ]),
                              ],
                            )
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),

        ],

      ),
    );
  }
}


