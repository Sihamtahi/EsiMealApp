import 'package:flutter/material.dart';
import 'categories.dart';
import 'searchBar.dart';
import 'menu.dart';
import 'bestSellers.dart';
import 'dataModels.dart';
import 'menu2.dart';

class MyHomePage extends StatefulWidget {
  final List<Dish> dishes;
  final List<Order> orders;
  @override
  _MyHomePageState createState() => _MyHomePageState();

  MyHomePage({@required this.dishes,@required this.orders});
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 40.0),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "What would",
                      style: TextStyle(
                          fontSize: 32.0, fontWeight: FontWeight.w700),
                    ),
                    Text("you like to eat ?",
                        style: TextStyle(
                            fontSize: 32.0, fontWeight: FontWeight.w200)),
                  ],
                ),
                Card(
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          CategoriesList(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Our Best Sellers",
                  style:
                  TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.blueAccent,
            endIndent: 300.0,
            indent: 20.0,
          ),
          Container(
              height: 250.0,
              child: BestSellerList(bestSellers: widget.dishes,orders:widget.orders)),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "All Our Dishes and Drinks",
                  style:
                  TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
//                  GestureDetector(
//                      onTap: () {},
//                      child: Text(
//                        "View All",
//                        style: TextStyle(
//                            fontWeight: FontWeight.bold,
//                            fontSize: 18.0,
//                            color: Colors.orangeAccent),
//                      ))
              ],
            ),
          ),
          Divider(
            color: Color.fromRGBO(253, 241, 141, 1.0),
            endIndent: 300.0,
            indent: 20.0,
          ),
          Menu2Page(dishes: widget.dishes,orders: widget.orders,)

        ],
      ),


    );
  }
}