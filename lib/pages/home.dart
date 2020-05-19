import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:marketing_app/components/products.dart';
import 'package:marketing_app/pages/cart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:marketing_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

import 'Command_details.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _searchController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    Widget image_carousel = new Container(
      height: 200.0,
      child:  Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/met6.jpg'),
          AssetImage('images/met7.jpg'),
          AssetImage('images/met8.jpg'),
          AssetImage('images/met9.jpg'),

        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
        dotBgColor: Colors.transparent,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepOrange),
        elevation: 0.1,
        backgroundColor: Colors.white,
        title: Material(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey[100].withOpacity(0.2),
          elevation: 0.0,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: ListTile(
              title: TextFormField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search...",
                  border: InputBorder.none,

                ),
                validator: (value){
                  if(value.isEmpty){
                    return "The search field cannot be empty";
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search,color: Colors.deepOrange,), onPressed: (){}),
          new IconButton(icon: Icon(Icons.shopping_cart,color: Colors.deepOrange,), onPressed: (){
            Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new Cart()));
          })
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            //     header
            new UserAccountsDrawerHeader(accountName: Text('DOUAIDI Lydia'), accountEmail: Text('gl_douaidi@esi.dz'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage : new AssetImage('images/a.jpg') ,
                ),
              ),
              decoration: new BoxDecoration(
                color: Colors.deepOrange,
              ),
            ),
            //      body
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home,color: Colors.red,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person,color: Colors.red,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_basket,color: Colors.red,),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new Cart()));
              },
              child: ListTile(
                title: Text('Shopping cart'),
                leading: Icon(Icons.shopping_cart,color: Colors.red,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(Icons.favorite,color: Colors.red,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Settigns'),
                leading: Icon(Icons.settings,color: Colors.blue,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help,color: Colors.green,),
              ),
            ),
            InkWell(
              onTap: (){
                user.signOut();
              },
              child: ListTile(
                title: Text('Sign Out'),
                leading: Icon(Icons.account_box,color: Colors.grey,),
              ),
            ),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          image_carousel,
          //new Padding(padding: const EdgeInsets.all(8.0),
            //child: new Text('Categories'),),
          // Horizontal List View Begins here
         // HorizontalList(),
          Row(
            children: <Widget>[
              InkWell(
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (_){
                      return Command();
                    },
                    //child: Container(color: Colors.greenAccent,)

                  );
                },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(253, 241, 141, 1.0),
                            boxShadow: [
                              BoxShadow(color: Colors.grey[300], blurRadius: 10.0)
                            ]),
                        width: MediaQuery.of(context).size.width,
                        height: 55.0,
                        child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Go to menu ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18.0),
                                ),
                              ],
                            ))),
              )

            ],
          ),
          // grid view
          Container(
            height: 320.0,
           child: Products(),
          ),
        ],
      ),
    );
  }


  Future<void> logoutUser() async{
    return _auth.signOut();
  }
  Future <Login> SignOut()  async{
  //  await FirebaseAuth.instance.signOut();
    setState(() {_isLoading = true;});
    try {
      await _auth.signOut();
      setState(() {_isLoading = false;});
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    } catch(e) {
      print(e);}
  }
    //return new Login();
  }


