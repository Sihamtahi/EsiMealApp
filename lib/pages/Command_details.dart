
import 'package:flutter/material.dart';
import 'package:marketing_app/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'EventPage.dart';
import 'HomeDeliveryPage.dart';
import 'RestaurantCommandPage.dart';


class Command extends StatefulWidget {
  @override
  _CommandState createState() => _CommandState();
}

class _CommandState extends State<Command> {

  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _lastnameTextController = TextEditingController();
  TextEditingController _nbTextController = TextEditingController();
  TextEditingController _timeTextController = TextEditingController();

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
                                controller: _nameTextController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Last name",
                                  icon: Icon(Icons.person_outline),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                      return "Please enter your name";
                                    }else return null;
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
                                controller: _lastnameTextController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "First name",
                                  icon: Icon(Icons.person_outline),
                                ),
                                validator: (value){
                                  if (value.isEmpty) {
                                    return "Please enter your name";
                                  }else return null;
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
                                controller: _nbTextController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Number of persons",
                                  icon: Icon(Icons.confirmation_number),
                                ),
                                validator: (value){
                                if (value.isEmpty) {
                                        return "Please enter number of persons";
                                 }else return null;
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
                                controller: _timeTextController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Time",
                                  icon: Icon(Icons.access_time),
                                ),
                                validator: (value){
                                  if (value.isEmpty) {
                                    return "Please enter time";
                                  }else return null;
                                },
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
                                      var route = new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                        new RestaurantCommand(nbPersonne: int.tryParse(_nbTextController.text),time: DateTime.tryParse(_timeTextController.text)),
                                      );
                                      Navigator.of(context).push(route);
                                    },
                                    minWidth: MediaQuery.of(context).size.width,
                                    child: Text("To consume in the restaurant", textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),),
                                  )
                              ),
                            ),
                            Padding(padding: const EdgeInsets.fromLTRB(14.0,8.0,14.0,8.0),
                                child:
                                Material(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Colors.deepOrange.shade700,
                                    elevation: 0.0,
                                    child: MaterialButton(
                                      onPressed: ()async{
                                        var route = new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                          new HomeDelivery(nbPersonne: int.tryParse(_nbTextController.text),time: DateTime.tryParse(_timeTextController.text)),
                                        );
                                        Navigator.of(context).push(route);
                                      },
                                      minWidth: MediaQuery.of(context).size.width,
                                      child: Text("Home delivery", textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),),
                                    )
                                ),
                            ),
                            Padding(padding: const EdgeInsets.fromLTRB(14.0,8.0,14.0,8.0),
                                child:
                                Material(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Colors.deepOrange.shade700,
                                    elevation: 0.0,
                                    child: MaterialButton(
                                      onPressed: ()async{
                                        var route = new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                          new  EventCommand(nbPersonne: int.tryParse(_nbTextController.text),time: DateTime.tryParse(_timeTextController.text)),
                                        );
                                        Navigator.of(context).push(route);
                                      },
                                      minWidth: MediaQuery.of(context).size.width,
                                      child: Text("For an event", textAlign: TextAlign.center,
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


