import 'package:flutter/material.dart';
import 'dataModels.dart';

class MyOrdersPage extends StatefulWidget {
  final List<Order> orders;
  @override
  _MyOrdersPageState createState() => _MyOrdersPageState();

  MyOrdersPage({@required this.orders});
}

class _MyOrdersPageState extends State<MyOrdersPage>
    with TickerProviderStateMixin {
  TabController tabController;
  List<String> tabs = [];
  double totPrice =0 ;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.orders.length; i++){
      tabs.add(widget.orders[i].name);
      totPrice = totPrice + widget.orders[i].price();
  }
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(180.0),
          child: Stack(
            children: <Widget>[
              AppBar(
                elevation: 5.0,
                backgroundColor: Colors.white,
                bottom: TabBar(
                  indicatorColor: Colors.redAccent,
                  labelPadding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: tabController,
                  labelColor: Colors.redAccent,
                  unselectedLabelColor: Color(0x8a000000),
                  tabs: tabs.map((item) {
                    return Text(item);
                  }).toList(),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 30.0, left: 20.0, bottom: 10.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "My Orders",
                              style: TextStyle(
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black),
                            ),

                            Text("Total price = $totPrice" ,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red)),

                          ],
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            if (tabs.length < 10) {
                              _addTab(this);
                            }
                          },
                          backgroundColor: Colors.white,
                          elevation: 15,
                          child: Icon(
                            Icons.add,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 16.0,
                  )
                ],
              ),
            ],
          )),
      body: TabBarView(
        controller: tabController,
        children: widget.orders.map((item) {
          if (item.orderedDishes.isNotEmpty) {
            return OrderPage(
              index: widget.orders.indexOf(item),
              orders: item.orderedDishes,
            );
          } else {
            return Center(
                child: Text(
                  "No ordered dishes yet",
                  style: TextStyle(color: Colors.grey),
                ));
          }
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (tabs.length > 1) {
            _removeTab(tabController.index);
            setState(() {});
          }
        },
        backgroundColor: Colors.redAccent,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
    );
  }


  void _removeTab(int index) {
    if(index!=0) {
      tabs.removeAt(index);
      widget.orders.removeAt(index);

    }
  }

  void _addTab(TickerProvider tp) {
    var _formKey = GlobalKey<FormState>();
    var alert = AlertDialog(
      content: Form(
          key: _formKey,
          child: TextFormField(
            onSaved: (value) {
              name = value;
            },
            validator: (value) {
              if (value.isEmpty) {
                return "This field cannot be empty";
              }
            },
            decoration: InputDecoration(
              labelText: "Order name",
              //border: InputBorder.none
            ),
          )),
      actions: <Widget>[
        FlatButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
            label: Text("CANCEL")),
        FlatButton.icon(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                tabs.add(name);
                widget.orders.add(Order(orderedDishes: [],name: name));
                tabController =
                    TabController(length: tabs.length,vsync: tp, initialIndex: 0);
                setState(() {});
                Navigator.pop(context);

              }
            },
            icon: Icon(Icons.add),
            label: Text("ADD")),
      ],
    );
    showDialog(context: context, builder: (_) => alert);
  }
}

class OrderPage extends StatefulWidget {
  final int index;
  final List<OrderedDish> orders;

  const OrderPage({@required this.index, @required this.orders});
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.orders.length,
        itemBuilder: (context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 5.0, left: 5.0, top: 2.0),
            child: Dismissible(
                direction: DismissDirection.endToStart,
                key: UniqueKey(),
                dismissThresholds: {DismissDirection.endToStart: 0.95},
                onDismissed: (direction) {
                  if (direction == DismissDirection.endToStart) {
                    setState(() {
                      widget.orders.removeAt(index);
                    });
                  }
                },
                background: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                  color: Colors.red,
                ),

                child: OrderCard(dish: widget.orders[index])),
          );
        });
  }
}

class OrderCard extends StatefulWidget {
  final OrderedDish dish;
  OrderCard({@required this.dish});
  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 120.0,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  widget.dish.dish.imagePath,
                  height: 100.0,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    widget.dish.dish.name,
                    style:
                    TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${widget.dish.dish.price}\$",
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return SupplementPage(
                            orderedDish: widget.dish,
                          );
                        },
                        //child: Container(color: Colors.greenAccent,)
                      );
                    },
                    child: Text(
                      "Supplements",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  padding: EdgeInsets.all(0.0),
                  icon: Icon(
                    Icons.keyboard_arrow_up,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.dish.quantity++;
                    });
                  },
                ),
                Text(
                  widget.dish.quantity.toString(),
                ),
                IconButton(
                  padding: EdgeInsets.all(0.0),
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                  ),
                  onPressed: () {
                    setState(() {
                      if (widget.dish.quantity > 1) {
                        widget.dish.quantity--;
                      }
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SupplementPage extends StatefulWidget {
  final OrderedDish orderedDish;
  @override
  _SupplementPageState createState() => _SupplementPageState();

  SupplementPage({@required this.orderedDish});
}

class _SupplementPageState extends State<SupplementPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          child: Container(
            color: Colors.white,
            height: 600,
            width: MediaQuery.of(context).size.width - 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(color: Colors.grey[300], blurRadius: 10)
                  ]),
                  height: 106.0,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Selected",
                          style: TextStyle(
                              fontSize: 32.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                        Text("supplements",
                            style: TextStyle(
                                fontSize: 32.0,
                                fontWeight: FontWeight.w200,
                                color: Colors.black,
                                decoration: TextDecoration.none)),
                      ],
                    ),
                  ),
                ),
//                    Divider(
//                      color: Colors.grey,
//                    ),
                Container(
                    height: 424,
                    child: ListView(
                        children: widget.orderedDish.dish.supplements
                            .map((supplement) {
                          return SelectedSupplement(
                            supplement: supplement,
                            dish: widget.orderedDish,
                          );
                        }).toList())),

                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    color: Color.fromRGBO(253, 241, 141, 1.0),
                    child: Center(
                        child: Text(
                          "Done",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: 18.0,
                              decoration: TextDecoration.none),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SelectedSupplement extends StatefulWidget {
  final OrderedDish dish;
  final Supplement supplement;

  @override
  _SelectedSupplementState createState() => _SelectedSupplementState();

  @override
  SelectedSupplement({@required this.supplement, @required this.dish});
}

class _SelectedSupplementState extends State<SelectedSupplement> {
  @override
  Widget build(BuildContext context) {
    bool value = widget.dish.selectedSupplements.contains(widget.supplement);
    print(value);
    return Container(
      width: double.infinity,
      height: 60.0,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Checkbox(
                  checkColor: Colors.black,
                  activeColor: Color.fromRGBO(253, 241, 141, 1.0),
                  value: value,
                  onChanged: (checked) {
                    setState(() {
                      value = checked;
                      if (checked) {
                        widget.dish.selectedSupplements.add(widget.supplement);
                      } else {
                        widget.dish.selectedSupplements.removeAt(widget
                            .dish.selectedSupplements
                            .indexOf(widget.supplement));
                      }
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Text(widget.supplement.name),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Text(
                widget.supplement.price.toString() + " DA",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}