
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:marketing_app/ListDishes/dataModels.dart';
import 'package:marketing_app/ListDishes/mainPage.dart';
import 'package:marketing_app/pages/CommandClass.dart';
import 'package:marketing_app/pages/Command_details.dart';
import 'package:marketing_app/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'home.dart';

class HomeDelivery extends StatefulWidget {
  final int nbPersonne;
  final DateTime time;
  HomeDelivery({this.nbPersonne,this.time, List<Order> orders});


  @override
  _HomeDeliveryState createState() => _HomeDeliveryState();
}

class _HomeDeliveryState extends State<HomeDelivery> {

  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  TextEditingController _distanceTextController = TextEditingController();
  TextEditingController _addresseTextController = TextEditingController();


  bool hidePass = true;

  DateTime get time => this.time;

  int get nbPersonne => this.nbPersonne;

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
                                controller: _distanceTextController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Distance",
                                  icon: Icon(Icons.directions),
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
                                controller: _addresseTextController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Addresse",
                                  icon: Icon(Icons.edit_location),
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
                                    onPressed: (){
                                     Commande cmd =  new LivreeDomicile(0,0,0,true,1,DateTime.now(),null,double.tryParse(_distanceTextController.text), (_addresseTextController.text).toString());

                                       var route =  new MaterialPageRoute(builder: (context) => MainPage());
                                      Navigator.of(context).push(route);
                                        },
                                    minWidth: MediaQuery.of(context).size.width,
                                    child: Text("Valider", textAlign: TextAlign.center,
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


