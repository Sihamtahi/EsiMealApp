import 'package:flutter/material.dart';
import 'dataModels.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dishPage.dart';
import 'addPage.dart';

class Menu2Page extends StatefulWidget {
  final List<Dish> dishes;
  final List<Order> orders;
  @override
  _Menu2PageState createState() => _Menu2PageState();

  Menu2Page({@required this.dishes,@required this.orders});
}

class _Menu2PageState extends State<Menu2Page> {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
        primary: false,
        shrinkWrap: true,
        //physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        itemCount: widget.dishes.length,
        itemBuilder: (context, index) {
          return MenuElement(dish: widget.dishes[index],orders:widget.orders);
        },
        mainAxisSpacing: 24,
        crossAxisSpacing: 12,
        padding: const EdgeInsets.all(12),
        staggeredTileBuilder: (int index) => StaggeredTile.fit(2));
  }
}

class MenuElement extends StatefulWidget {
  final Dish dish;
  List<Order> orders;

  @override
  _MenuElementState createState() => _MenuElementState();

  MenuElement({@required this.dish,@required this.orders});
}

class _MenuElementState extends State<MenuElement> {
  Widget build(BuildContext context) {
    Icon icon;
    if (widget.dish.favorite == 0) {
      icon = Icon(
        Icons.favorite_border,
        color: Colors.white,
        size: 30,
      );
    } else {
      icon = Icon(
        Icons.favorite,
        color: Color.fromRGBO(253, 241, 141, 1.0),
        size: 30,
      );
    }
    return Material(
      borderRadius: BorderRadius.circular(8.0),
      elevation: 5.0,
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero),
                child: InkWell(
                    onTap: (){

                      return Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return DishPage(dish:widget.dish,orders: widget.orders,);
                      }));

                    },
                    child: Image.asset(widget.dish.imagePath, fit: BoxFit.cover)),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            if (widget.dish.favorite == 0) {
                              widget.dish.favorite = 1;
                              icon = Icon(Icons.favorite,
                                  color: Color.fromRGBO(253, 241, 141, 1.0),
                                  size: 30);
                            } else {
                              widget.dish.favorite = 0;
                              icon = Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                                size: 30,
                              );
                            }
                          });
                        },
                        child: icon),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: (){

                    return Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return DishPage(dish:widget.dish,orders: widget.orders,);
                    }));

                  },
                  child: Text(
                    "${widget.dish.name}",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("${widget.dish.price} DA"),
                    InkWell(
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
                            borderRadius: BorderRadius.circular(8.0)),
                        width: 40.0,
                        height: 40.0,
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}