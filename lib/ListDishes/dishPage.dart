import 'package:flutter/material.dart';
import 'dataModels.dart';
import 'addPage.dart';

class DishPage extends StatefulWidget {
  final Dish dish;
  final List<Order> orders;

  @override
  _DishPageState createState() => _DishPageState();

  DishPage({@required this.dish,@required this.orders});
}

class _DishPageState extends State<DishPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.clear, color: Colors.black,),
          onPressed: (){
            return Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom:50.0),
            child: ListView(children: <Widget>[
              Container(
                height: 300,
                child: Image.asset(
                  widget.dish.imagePath,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top:10.0,left: 10.0,right:10.0),
                child: Text("${widget.dish.name}",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 32.0),),
              ),
              Divider(
                color: Color.fromRGBO(253, 241, 141, 1.0),
                endIndent: 300.0,
                indent: 20.0,
              ),
              Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text("   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod te"
                      "mpor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, "
                      "quis nostrud exercitati"
                      "on ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute "
                      "irure dolor in reprehenderit in voluptate velit esse"
                      " cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cu"
                      "pidatat non proident, sunt in culpa qui officia deserunt mollit anim id"
                      " est laborum."
                      ,
                      style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16.0)
                  )
              ),
              Container(
                padding: EdgeInsets.only(top:10.0,left: 10.0,right:10.0),
                child: Text("Ingredients",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 28.0),),
              ),
              Divider(
                color: Color.fromRGBO(253, 241, 141, 1.0),
                endIndent: 300.0,
                indent: 20.0,
              ),
              Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text("   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod te"
                      "mpor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, "
                      "quis nostrud exercitati"
                      "on ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute "
                      "irure dolor in reprehenderit in voluptate velit esse"
                      " cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cu"
                      "pidatat non proident, sunt in culpa qui officia deserunt mollit anim id"
                      " est laborum."
                      ,
                      style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16.0)
                  )
              ),

            ]),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: (){
                showDialog(
                  context: context,
                  builder: (_){
                    return AddPage(dish:widget.dish,orders: widget.orders,);
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
                            "Add to cart ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 18.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:10.0),
                            child: Text("${widget.dish.price} DA", style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 18.0),),
                          ),

                        ],
                      ))),
            ),
          )
        ],
      ),
    );
  }
}

class DropDown extends StatefulWidget {
  final List<String> elements;
  final String hint;
  const DropDown({Key key, @required this.elements, @required this.hint})
      : super(key: key);
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  var _selected;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
          elevation: 0,
          isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.grey,
          ),
          hint: Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
            ),
            child: Text(
              widget.hint,
              style: TextStyle(fontSize: 15.0, color: Colors.grey),
            ),
          ),
          value: _selected,
          items: widget.elements.map((elmt) {
            return DropdownMenuItem(value: elmt, child: Text(elmt));
          }).toList(),
          onChanged: (val) {
            setState(() {
              _selected = val;
              //print(val);
            });
          }),
    );
  }
}