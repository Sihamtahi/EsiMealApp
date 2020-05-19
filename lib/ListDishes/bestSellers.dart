import 'package:flutter/material.dart';
import 'dataModels.dart';
import 'dishPage.dart';
import 'addPage.dart';

class BestSellerCard extends StatefulWidget {
  final Dish dish;
  final List<Order> orders;
  @override
  _BestSellerCardState createState() => _BestSellerCardState();

  BestSellerCard({@required this.dish,@required this.orders});
}

class _BestSellerCardState extends State<BestSellerCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        elevation: 3.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            width: 170,
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    return Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return DishPage(dish:widget.dish,orders: widget.orders,);
                    }));
                  },
                  child: Image.asset(
                    widget.dish.imagePath,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    height: 154,
                    width: 170,
                  ),
                ),
                Container(
                  height: 80.0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            return Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return DishPage(dish:widget.dish,orders: widget.orders,);
                            }));
                          },
                          child: Text(
                            "${widget.dish.name}",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16.0),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("${widget.dish.price} DA"),
                            Container(
                              decoration: BoxDecoration(
                                //color: Color.fromRGBO(229, 152, 64, 1.0),
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(8.0)),
                              width: 40.0,
                              height: 40.0,
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (_) {
                                        return AddPage(dish:widget.dish,orders: widget.orders,);
                                      },
                                      //child: Container(color: Colors.greenAccent,)
                                    );
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BestSellerList extends StatefulWidget {
  final List<Dish> bestSellers;
  final List<Order> orders;
  @override
  _BestSellerListState createState() => _BestSellerListState();

  BestSellerList({@required this.bestSellers,@required this.orders});
}

class _BestSellerListState extends State<BestSellerList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.bestSellers.length,
        itemBuilder: (context, index) {
          return BestSellerCard(dish: widget.bestSellers[index],orders: widget.orders,);
        });
  }
}