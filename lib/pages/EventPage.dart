import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:marketing_app/pages/CommandClass.dart';
import 'package:marketing_app/pages/Command_details.dart';
import 'package:marketing_app/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'home.dart';

class EventCommand extends StatefulWidget {
  final int nbPersonne;
  final DateTime time;
  EventCommand({this.nbPersonne,this.time});
  @override
  _EventCommandState createState() => _EventCommandState();
}

class _EventCommandState extends State< EventCommand> {

  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  bool hidePass = true;

  DateTime get time => null;

  int get nbPersonne => null;

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

                        Column(
                          children: <Widget>[
                            Padding(padding: const EdgeInsets.fromLTRB(14.0,8.0,14.0,8.0),
                              child: Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.deepOrange.shade700,
                                  elevation: 0.0,
                                  child: MaterialButton(
                                    onPressed: ()async{
                                      int a = new Random() as int;
                                      double prix = new Random() as double;
                                      double prixRed = new Random() as double;
                                      Commande cmd = new Event(
                                          a, prix,prixRed,true, nbPersonne,time);
                                      cmd.valider();
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


