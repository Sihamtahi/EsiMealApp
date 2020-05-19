import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dataModels.dart';
import 'dishPage.dart';
import 'addPage.dart';

class Profile extends StatefulWidget {
  final List<Order> orders;
  @override
  _ProfileState createState() => _ProfileState();

  Profile({@required this.orders,});
}

class _ProfileState extends State<Profile> {
  String imagePath = "images/profile.jpg";
  String name = "Mark Braun";
  String address = "75 3rd avenue NY, USA";
  List<Dish> recommandations = [
    Dish(
        name: "Chocolate mousse",
        price: 320.0,
        discount: 0.0,
        imagePath: "images/dishes/chocolate_mousse.jpeg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Fish burger",
        price: 700.0,
        discount: 0.0,
        imagePath: "images/dishes/fish-burger.jpeg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Steak and potatoes",
        price: 1100.0,
        discount: 0.0,
        imagePath:
        "images/dishes/Garlic-Butter-flank-Steak-and-Potatoes-Skillet-800x800.jpg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Grilled chicken",
        price: 1200.0,
        discount: 0.0,
        imagePath: "images/dishes/grilled_chicken.jpg",
        stars: 4,
        numberReviews: 40),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff09031d),
//      appBar: AppBar(
//        elevation: 0,
//        backgroundColor: Color(0xff09031d),
//        actions: <Widget>[
//          Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: Icon(Icons.more_vert),
//          )
//        ],
//      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 300,
            child: Image.asset(
              "images/photo-1519162808019-7de1683fa2ad.jpeg",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                color: Colors.transparent,
                height: 60,
                width: double.infinity,
              ),
              Padding(
                padding:
                const EdgeInsets.only(bottom: 100.0, left: 20, right: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white70,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage(imagePath),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 7.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 28,
                                  color: Colors.black),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.location_on,
                                      color: Colors.black, size: 17),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      address,
                                      style: TextStyle(
                                          wordSpacing: 2,
                                          letterSpacing: 4,
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30)),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30, left: 30, bottom: 30),
                        child: Text(
                          "Dishes You might Like",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 25),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          child: Padding(
                            padding:
                            const EdgeInsets.only(left: 40.0, right: 40.0),
                            child: Container(
                              child: StaggeredGridView.countBuilder(
                                shrinkWrap: true,
                                crossAxisCount: 4,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      return Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                            return DishPage(dish:recommandations[index],orders: widget.orders,);
                                          }));
                                    },
                                    child: Material(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                      elevation: 3.0,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
                                        child: GridTile(
                                          child: Image.asset(
                                            recommandations[index].imagePath,
                                            fit: BoxFit.cover,
                                          ),
                                          footer: Container(
                                            height: 50,
                                            color: Colors.white,
                                            child: Center(
                                              child: Text(
                                                recommandations[index].name,
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.w700),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                staggeredTileBuilder: (index) {
                                  return StaggeredTile.count(
                                      2, index.isEven ? 3 : 2);
                                },
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
              alignment: Alignment.topRight,
              color: Colors.transparent,
              width: double.infinity,
              height:60,
              child: PopupMenuButton(
                  itemBuilder: (context){
                    return <PopupMenuEntry>[
                      PopupMenuItem<String>(
                        child: Text("Modify Profile"),
                      )
                    ];
                  }
              )
          )
        ],
      ),
    );
  }
}
