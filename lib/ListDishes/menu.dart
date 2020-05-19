import 'package:flutter/material.dart';
import 'dataModels.dart';

class DishCard extends StatefulWidget {
  final Dish dish;
  const DishCard({Key key, @required this.dish}) : super(key: key);
  @override
  _DishCardState createState() => _DishCardState();
}

class _DishCardState extends State<DishCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Stack(alignment: Alignment.bottomLeft, children: <Widget>[
          Container(
            color: Colors.orangeAccent,
            height: 350.0,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              widget.dish.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 80.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black, Colors.black12],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.dish.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      stars(widget.dish.stars, widget.dish.numberReviews)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Price",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        widget.dish.price.toString()+" DA",
                        style: TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget stars(int stars, int reviews) {
    List<Widget> row = List<Widget>();
    for (int i = 0; i < stars; i++) {
      row.add(Icon(
        Icons.star,
        color: Theme.of(context).primaryColor,
      ));
    }
    for (int i = stars; i < 5; i++) {
      row.add(Icon(
        Icons.star_border,
        color: Colors.white,
      ));
    }
    row.add(Text(
      " ($reviews reviews)",
      style: TextStyle(color: Colors.white),
    ));

    return Row(
      children: row,
    );
  }
}

class DishList extends StatefulWidget {
  List<Dish> dishes = [
    Dish(
        name: "Capuccino",
        price: 50.0,
        discount: 0.0,
        imagePath: "images/breakfast.jpeg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Beef burger",
        price: 700.0,
        discount: 0.0,
        imagePath: "images/dishes/beef_burger2.jpg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Caramel milkshake",
        price: 500.0,
        discount: 0.0,
        imagePath: "images/dishes/caramel_coffe_milkshake.jpg",
        stars: 5,
        numberReviews: 40),
    Dish(
        name: "Cesar Salad",
        price: 650.0,
        discount: 0.0,
        imagePath: "images/dishes/cesar_salad.jpg",
        stars: 4,
        numberReviews: 40),
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
    Dish(
        name: "grilled salmon",
        price: 1500.0,
        discount: 0.0,
        imagePath: "images/dishes/grilled_salmon.jpg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Korean noodles",
        price: 800.0,
        discount: 0.0,
        imagePath: "images/dishes/korean_style_noodles.jpg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Lemon tart",
        price: 500.0,
        discount: 0.0,
        imagePath: "images/dishes/lemon_tart.jpg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Mangolian beef",
        price: 1100.0,
        discount: 0.0,
        imagePath: "images/dishes/mongolian_style_beef.jpg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Raspberries milkshake",
        price: 700.0,
        discount: 0.0,
        imagePath: "images/dishes/raspberries_milkshake.jpg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Mushroom rizzoto",
        price: 700.0,
        discount: 0.0,
        imagePath: "images/dishes/shrimp_rizzoto.jpg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Soy sause noodles",
        price:800.0,
        discount: 0.0,
        imagePath: "images/dishes/soy_sauce_noodles.jpg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Strawberry cheesecake",
        price: 700.0,
        discount: 0.0,
        imagePath: "images/dishes/strawberry_cheesecake.jpg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Ice Cream sundae",
        price: 400.0,
        discount: 0.0,
        imagePath: "images/dishes/sundae.jpg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Sweet potatoe soup",
        price: 700.0,
        discount: 0.0,
        imagePath: "images/dishes/sweet_potatoe_soup.jpg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Tiramissu",
        price: 700.0,
        discount: 0.0,
        imagePath: "images/dishes/tiramissu.jpg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Chicken soup",
        price: 700.0,
        discount: 0.0,
        imagePath: "images/dishes/tuskan_style_chicken_soup.jpg",
        stars: 4,
        numberReviews: 40),
    Dish(
        name: "Pizza",
        price: 650.0,
        discount: 0.0,
        imagePath: "images/dishes/vegies_pizza.jpeg",
        stars: 4,
        numberReviews: 40),
  ];
  @override
  _DishListState createState() => _DishListState();
}

class _DishListState extends State<DishList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.dishes.map((item){
        return DishCard(dish:item);
      }).toList(),
    );
  }
}


