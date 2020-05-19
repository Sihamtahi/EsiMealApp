import 'package:flutter/material.dart';
import 'dataModels.dart';
class CategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<Category> _categories=[


      Category(
          name:"Breakfast",imagePath: "images/breakfast.png",numberItems: 16
      ),

      Category(
          name:"Coffee",imagePath: "images/coffee-cup.png",numberItems: 10
      ),

      Category(
          name:"Burgers",imagePath: "images/burger.png",numberItems: 20
      ),

      Category(
          name:"Pizzas",imagePath: "images/pizza.png",numberItems: 16
      ),

      Category(
          name:"Dishes",imagePath: "images/turkey.png",numberItems: 32
      ),

      Category(
          name:"Drinks",imagePath: "images/beer.png",numberItems: 32
      ),

      Category(
          name:"Deserts",imagePath: "images/cupcake.png",numberItems: 32
      ),

    ];

    return Container(
      height: 90.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _categories.length,
          itemBuilder: (context,index){
            Category item=_categories[index];
            return FoodCard(category: item);
          }),
    );
  }
}


class FoodCard extends StatelessWidget {

  final Category category;

  const FoodCard({@required this.category});

  @override
  Widget build(BuildContext context) {
    int nb=category.numberItems;
    return Card(
      elevation:2.0,
      child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right:20.0,left: 20.0),
              child: Image.asset(
                category.imagePath,
                width: 60.0,
                height: 60.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right:20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  Text(category.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),),
                  Text("$nb Kinds"),

                ],

              ),
            )
          ],
        ),

    );
  }
}

