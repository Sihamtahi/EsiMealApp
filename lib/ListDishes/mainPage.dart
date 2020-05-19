import 'package:args/command_runner.dart';
import 'package:flutter/material.dart';
import 'package:marketing_app/pages/EventPage.dart';
import 'package:marketing_app/pages/HomeDeliveryPage.dart';
import 'package:marketing_app/pages/RestaurantCommandPage.dart';
import 'bottomAppBar.dart';
import 'homePage.dart';
import 'orderPage.dart';
import 'dataModels.dart';
import 'parallaxPage.dart';
import 'searchBar.dart';
import 'profilePage.dart';

//TO DO
// pass a Supplement object in addPage




class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  static List<Supplement> supplementsList=[
    Supplement(name: "Potatoes", price: 100.0, discount: 0),
    Supplement(name: "Mayonnaise", price: 50.0, discount: 0),
    Supplement(name: "Cheese", price: 110.0, discount: 0),
    Supplement(name: "Lettuce salad", price: 130.0, discount: 0),
    Supplement(name: "Ketchup", price: 105.0, discount: 0),
    Supplement(name: "French Fries", price: 140.0, discount: 0),
    Supplement(name: "Bread", price: 30.0, discount: 0),

  ];

  List<Dish> dishes = [
    Dish(
        name: "Capuccino",
        price: 50.0,
        discount: 0.0,
        imagePath: "images/breakfast.jpeg",
        stars: 4,
        supplements: supplementsList,
        numberReviews: 40),
    Dish(
        name: "Beef burger",
        price: 700.0,
        discount: 0.0,
        imagePath: "images/dishes/beef_burger2.jpg",
        stars: 4,
        supplements: supplementsList,

        numberReviews: 40),
    Dish(
        name: "Caramel milkshake",
        price: 500.0,
        discount: 0.0,
        imagePath: "images/dishes/caramel_coffe_milkshake.jpg",
        stars: 5,
        supplements: supplementsList,

        numberReviews: 40),
    Dish(
        name: "Cesar Salad",
        price: 650.0,
        discount: 0.0,
        imagePath: "images/dishes/cesar_salad.jpg",
        stars: 4,
        supplements: supplementsList,

        numberReviews: 40),
    Dish(
        name: "Chocolate mousse",
        price: 320.0,
        discount: 0.0,
        imagePath: "images/dishes/chocolate_mousse.jpeg",
        stars: 4,
        supplements: supplementsList,
        numberReviews: 40),
    Dish(
        name: "Fish burger",
        price: 700.0,
        discount: 0.0,
        imagePath: "images/dishes/fish-burger.jpeg",
        stars: 4,
        supplements: supplementsList,

        numberReviews: 40),
    Dish(
        name: "Steak and potatoes",
        price: 1100.0,
        discount: 0.0,
        imagePath:
        "images/dishes/Garlic-Butter-flank-Steak-and-Potatoes-Skillet-800x800.jpg",
        stars: 4,
        supplements: supplementsList,

        numberReviews: 40),
    Dish(
        name: "Grilled chicken",
        price: 1200.0,
        discount: 0.0,
        imagePath: "images/dishes/grilled_chicken.jpg",
        stars: 4,
        supplements: supplementsList,

        numberReviews: 40),
    Dish(
        name: "Grilled salmon",
        price: 1500.0,
        discount: 0.0,
        imagePath: "images/dishes/grilled_salmon.jpg",
        stars: 4,
        supplements: supplementsList,

        numberReviews: 40),
    Dish(
        name: "Korean noodles",
        price: 800.0,
        discount: 0.0,
        imagePath: "images/dishes/korean_style_noodles.jpg",
        stars: 4,
        supplements: supplementsList,

        numberReviews: 40),
    Dish(
        name: "Lemon tart",
        price: 500.0,
        discount: 0.0,
        imagePath: "images/dishes/lemon_tart.jpg",
        stars: 4,
        supplements: supplementsList,

        numberReviews: 40),
    Dish(
        name: "Mangolian beef",
        price: 1100.0,
        discount: 0.0,
        imagePath: "images/dishes/mongolian_style_beef.jpg",
        stars: 4,
        supplements: supplementsList,

        numberReviews: 40),
    Dish(
        name: "Raspberries milkshake",
        price: 700.0,
        discount: 0.0,
        imagePath: "images/dishes/raspberries_milkshake.jpg",
        stars: 4,
        supplements: supplementsList,

        numberReviews: 40),
    Dish(
        name: "Mushroom rizzoto",
        price: 700.0,
        discount: 0.0,
        imagePath: "images/dishes/shrimp_rizzoto.jpg",
        stars: 4,
        supplements: supplementsList,

        numberReviews: 40),
    Dish(
        name: "Soy sause noodles",
        price:800.0,
        discount: 0.0,
        imagePath: "images/dishes/soy_sauce_noodles.jpg",
        stars: 4,
        supplements: supplementsList,

        numberReviews: 40),
    Dish(
        name: "Strawberry cheesecake",
        price: 700.0,
        discount: 0.0,
        imagePath: "images/dishes/strawberry_cheesecake.jpg",
        stars: 4,
        supplements: supplementsList,

        numberReviews: 40),
    Dish(
        name: "Ice Cream sundae",
        price: 400.0,
        discount: 0.0,
        imagePath: "images/dishes/sundae.jpg",
        stars: 4,
        supplements: supplementsList,

        numberReviews: 40),
    Dish(
        name: "Sweet potatoe soup",
        price: 700.0,
        discount: 0.0,
        imagePath: "images/dishes/sweet_potatoe_soup.jpg",
        stars: 4,
        supplements: supplementsList,

        numberReviews: 40),
    Dish(
        name: "Tiramissu",
        price: 700.0,
        discount: 0.0,
        imagePath: "images/dishes/tiramissu.jpg",
        stars: 4,
        supplements: supplementsList,

        numberReviews: 40),
    Dish(
        name: "Chicken soup",
        price: 700.0,
        discount: 0.0,
        imagePath: "images/dishes/tuskan_style_chicken_soup.jpg",
        stars: 4,
        supplements: supplementsList,

        numberReviews: 40),
    Dish(
        name: "Pizza",
        price: 650.0,
        discount: 0.0,
        imagePath: "images/dishes/vegies_pizza.jpeg",
        stars: 4,
        supplements: supplementsList,

        numberReviews: 40),
  ];

  List<Order> orders=[Order(orderedDishes:[],name: "Me")];

  int currentTab=0;
  MyHomePage homePage;
  MyOrdersPage orderPage;
  ParallaxPage parallaxPage;
  SearchPage searchPage;
  Profile profilePage;
  HomeDelivery homeDelivery;
  RestaurantCommand restaurantCommand;
  EventCommand eventCommand;
  List<Widget> pages;
  Widget currentPage;

  @override
  void initState(){
    parallaxPage=ParallaxPage();
    profilePage=Profile(orders: orders,);
    homePage=MyHomePage(dishes: dishes,orders: orders);
    orderPage=MyOrdersPage(orders:orders,);
    searchPage=SearchPage();
    homeDelivery = new HomeDelivery(orders:orders);
    restaurantCommand = new RestaurantCommand(orders: orders);
    eventCommand = new EventCommand(orders: orders);
    pages=[homePage,searchPage,orderPage,profilePage];
    currentPage=homePage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: currentPage),
        bottomNavigationBar: BottomNavyBar(
          iconSize: 26,
          containerHeight: 65,
          selectedIndex: currentTab,
          showElevation: true,
          itemCornerRadius: 30,
          curve: Curves.ease,
          animationDuration: Duration(milliseconds: 300),
          onItemSelected: (index){
            setState(() {
              currentTab=index;
              currentPage=pages[index];
            });
          },
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              activeColor: Colors.blueAccent,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
              activeColor: Colors.grey[800],
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text('Orders',),
              activeColor: Colors.redAccent,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
              activeColor: Colors.green,
              textAlign: TextAlign.center,
            ),
          ],

        )
    );
  }
}