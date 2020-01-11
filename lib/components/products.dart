import 'package:flutter/material.dart';
import 'package:marketing_app/pages/product_details.dart';
class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  //group of things
  var product_list = [
    {
      "name":"Soupe",
      "picture":"images/products/repas1.jpg",
      "old_price":120,
      "price":85,
    },
    {
      "name":"Tacos",
      "picture":"images/products/repas2.jpg",
      "old_price":140,
      "price":65,
    },
    {
      "name":"Pasta",
      "picture":"images/products/met4.jpeg",
      "old_price":100,
      "price":55,
    },
    {
      "name":"Humberger",
      "picture":"images/products/repas3.jpg",
      "old_price":100,
      "price":55,
    },
    {
      "name":"Pizza",
      "picture":"images/products/repas4.jpg",
      "old_price":100,
      "price":55,
    },
    {
      "name":"pants",
      "picture":"images/products/repas5.jpg",
      "old_price":100,
      "price":55,
    },
    {
      "name":"Coca",
      "picture":"images/products/met5.jpeg",
      "old_price":120,
      "price":85,
    },
    {
      "name":"Jus d'orange",
      "picture":"images/products/met3.jpeg",
      "old_price":140,
      "price":65,
    },
    {
      "name":"Red Bull",
      "picture":"images/products/met1.jpeg",
      "old_price":100,
      "price":55,
    },

      ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (BuildContext context , int index){
        return Single_prod(
          prod_name: product_list[index]['name'],
          prod_picture: product_list[index]['picture'],
          prod_old_price: product_list[index]['old_price'],
          prod_price: product_list[index]['price'],

        );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  const Single_prod({this.prod_name, this.prod_picture, this.prod_old_price, this.prod_price}) ;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(tag: new Text("hero 1"), child: Material(
        child: InkWell(
          onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new ProductDetails(
            product_detail_name: prod_name,
            product_detail_new_price: prod_price,
            product_detail_old_price: prod_old_price,
            product_detail_picture: prod_picture,
          ))),
          child: GridTile(
            footer: Container(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(

                    child: Text(prod_name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),),
                  ),
                  new Text("\$${prod_price}",style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold,fontSize: 16.0)),
                ],
              ),
              /* ListTile(
                leading: Text(prod_name,style: TextStyle(fontWeight: FontWeight.bold),),
                title: Text("\$$prod_price",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w800),),
                subtitle: Text("\$$prod_old_price",style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w800,decoration: TextDecoration.lineThrough),),
              ),*/

            ),
              child:Image.asset(prod_picture,fit: BoxFit.cover,)
          ),
        ),
      )),
    );
  }
}
