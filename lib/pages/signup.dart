import 'dart:async';
import 'package:marketing_app/ListDishes/dataModels.dart';
import 'package:marketing_app/commons/loading.dart';
import 'package:marketing_app/pages/CommandClass.dart';
import 'package:marketing_app/pages/Reduction.dart';
import 'package:marketing_app/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'Client.dart';
import 'Command_details.dart';
import 'home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _Lastname = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _adress = TextEditingController();
  TextEditingController _adressList = TextEditingController();
  List<String>  ListAddress = List();
  bool hidePass = true;

  List<Order> get orders => null;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    return Scaffold(
      key: _key,
      body: user.status == Statuus.Authenticating ? Loading() : Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left:20, right:20.0, top: 30.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300],
                    blurRadius: 20.0, // has the effect of softening the shadow
                  )
                ],
              ),
              child: Form(
                  key: _formKey,
                  child: ListView(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                            alignment: Alignment.topCenter,
                            child: Image.asset(
                              'images/cart.png',
                              width: 120.0,
//                height: 240.0,
                            )),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.withOpacity(0.2),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                              title: TextFormField(
                                controller: _name,
                                decoration: InputDecoration(
                                    hintText: "name",
                                    icon: Icon(Icons.person_outline),
                                    border: InputBorder.none),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "The name field cannot be empty";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.withOpacity(0.2),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                              title: TextFormField(
                                controller: _Lastname,
                                decoration: InputDecoration(
                                    hintText: "Last name",
                                    icon: Icon(Icons.person_outline),
                                    border: InputBorder.none),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "The name field cannot be empty";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.withOpacity(0.2),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                              title: TextFormField(
                                controller: _email,
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    icon: Icon(Icons.alternate_email),
                                    border: InputBorder.none),
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
                      ),

                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.withOpacity(0.2),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                              title: TextFormField(
                                controller: _password,
                                obscureText: hidePass,
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    icon: Icon(Icons.lock_outline),
                                    border: InputBorder.none),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "The password field cannot be empty";
                                  } else if (value.length < 6) {
                                    return "the password has to be at least 6 characters long";
                                  }
                                  return null;
                                },
                              ),
                              trailing: IconButton(
                                  icon: Icon(Icons.remove_red_eye),
                                  onPressed: () {
                                    setState(() {
                                      hidePass = false;
                                    });
                                  }),
                            ),
                          ),

                        ),
                      ),

                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.withOpacity(0.2),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                              title: TextFormField(
                                controller: _adress,
                                decoration: InputDecoration(
                                    hintText: "Address",
                                    icon: Icon(Icons.location_on),
                                    border: InputBorder.none),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "The name field cannot be empty";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.withOpacity(0.2),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                              title: TextFormField(
                                controller: _phone,
                                decoration: InputDecoration(
                                    hintText: "Phone number",
                                    icon: Icon(Icons.phone_android),
                                    border: InputBorder.none),
                                validator: (value) {

                                  if (value.isEmpty) {
                                    return "The name field cannot be empty";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.withOpacity(0.2),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                              title: TextFormField(
                                controller: _adressList,
                                decoration: InputDecoration(
                                    hintText: "Add your Address list ",
                                    icon: Icon(Icons.add_location),

                                    border: InputBorder.none),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "The name field cannot be empty";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.deepOrange,
                            elevation: 0.0,
                            child: MaterialButton(
                              onPressed:(){
                                ListAddress.add(_adressList.text);
                                _adressList.clear();
                              }  ,
                              minWidth: MediaQuery.of(context).size.width,
                              child: Text(
                                "add adress",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            )),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.deepOrange,
                            elevation: 0.0,
                            child: MaterialButton(
                              onPressed:(){
                                for (String i in ListAddress)
                                  {
                                    print (i);
                                  }





                              }  ,
                              minWidth: MediaQuery.of(context).size.width,
                              child: Text(
                                "display Adresses",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            )),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.deepOrange,
                            elevation: 0.0,
                            child: MaterialButton(
                              onPressed:(){
                                  ClientFid client = new ClientFid("tahi", "siham", "aitazizi", "03323232", 0, "gs_tahi@mail.dz", "siham","a2354", ListAddress);
                                  Etudiant client2 =new Etudiant("tahi", "siham", "aitaiz", "0332665", 0, "abcdef");
                                  client2.setClient(client);
                                  LivreeDomicile cmd = new LivreeDomicile(0,0,0,true,0,DateTime.now(),orders,78,"hhhjf");
                                  cmd.nbrPersonnes = 60;
                                  ReductionEtudiant etudiant = new ReductionEtudiant();
                                  ReductionDomicile domicile = new ReductionDomicile();
                                  ReductionEvenement event = new ReductionEvenement();
                                  ReductionFid fidele = new ReductionFid();
                                  etudiant.setSuivant(domicile);
                                  domicile.setSuivant(event);
                                  event.setSuivant(fidele);
                                  fidele.setSuivant(null);
                                  double k = etudiant.calculerReduction(client2,cmd);
                                  print(k);
                                },
                              minWidth: MediaQuery.of(context).size.width,
                              child: Text(
                                "ChekChainOf resposnsability",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            )),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.deepOrange,
                            elevation: 0.0,
                            child: MaterialButton(
                              onPressed: () async{
                                if(_formKey.currentState.validate()){
                                  if(!await user.signUp(_name.text ,_email.text, _password.text))
                                    _key.currentState.showSnackBar(SnackBar(content: Text("Sign up failed")));
                                }

                                ClientFid client = new ClientFid(_name.text,_Lastname.text,_adress.text,_phone.text,0,_email.text,_password.text,"aaaaa",ListAddress);
                                //List<Client> lis =new List();

                              },
                              minWidth: MediaQuery.of(context).size.width,
                              child: Text(
                                "Sign up",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            )),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "I already have an account",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.deepOrange, fontSize: 16),
                              ))),

              Text("Other login in opntion",textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),),
              Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                            },
                            child: Text("Or", textAlign: TextAlign.center, style: TextStyle(color: Colors.deepOrange,  fontWeight: FontWeight.w400,fontSize: 20.0),)),

                      ),


                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(14.0, 0.0, 14.0, 0.0),
                                    child: Material(
                                        child: MaterialButton(
                                            onPressed: () {},
                                            child: Image.asset("images/fb1.png", width: 60,)
                                        )),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(14.0, 0.0, 14.0, 0.0),
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
                                            child: Image.asset("images/ggg.png", width: 30,)
                                        )),
                                  ),
                                ],
                            ),

                          ],

                      ),
                  )],
                  )),
            ),
          ),
        ],
      ),
    );
  }

}
