import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:marketing_app/ListDishes/dataModels.dart';
import 'package:marketing_app/ListDishes/mainPage.dart';
import 'package:marketing_app/pages/CommandClass.dart';
import 'package:marketing_app/pages/Command_details.dart';
import 'package:marketing_app/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'home.dart';

class RestaurantCommand extends StatefulWidget {
  final int nbPersonne;
  final DateTime time;

  RestaurantCommand({this.nbPersonne,this.time, List<Order> orders});

  @override
  _RestaurantCommandState createState() => _RestaurantCommandState();
}

class _RestaurantCommandState extends State< RestaurantCommand> {

  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  String dropdownValue = 'One';
  TextEditingController _nbChaiseTextController = TextEditingController();
  TextEditingController _nbTableTextController = TextEditingController();


  bool hidePass = true;

  DateTime get time => this.time;

  int get nbPersonne => this.nbPersonne;
  OrderedDish get panier => null;

  List<Order> get orders => this.orders;
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
      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(80.0),
            child: Container(
                alignment: Alignment.topCenter,
                child: Image.asset('images/cart.png', width: 120.0,)),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 180.0),
              child: Center(
                child:

                Form(
                    key: _formKey,
                    child: ListView(
                      children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25.0,8.0,14.0,8.0),
                        child:
                          DropdownButton<String>(
                        value: dropdownValue,
                        elevation: 16,
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>['One', 'Table interne', 'Tbale externe'].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),);}).toList(),
                        ) ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14.0,8.0,14.0,8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.withOpacity(0.2),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left:12.0),
                              child: TextFormField(
                                controller: _nbTableTextController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Numbre of table",
                                  icon: Icon(Icons.confirmation_number),
                                ),
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
                                controller: _nbChaiseTextController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Numbre of chairs",
                                  icon: Icon(Icons.confirmation_number),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Column(
                          children: <Widget>[
                            Padding(padding: const EdgeInsets.fromLTRB(14.0,8.0,14.0,8.0),
                              child: Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.deepOrange.shade700,
                                  elevation: 0.0,
                                  child: MaterialButton(
                                    onPressed: ()async{
                                      Commande cmd = new ConsomResto(
                                         0,0,0,true,1,DateTime.now(),null,int.tryParse(_nbTableTextController.text),int.tryParse(_nbChaiseTextController.text));
                                      var route =  new MaterialPageRoute(builder: (context) => MainPage());
                                      Navigator.of(context).push(route);

                                    },
                                    minWidth: MediaQuery.of(context).size.width,
                                    child: Text("Validate", textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),),
                                  )
                              ),
                            ),
                          ],
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


