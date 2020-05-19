import 'package:flutter/material.dart';
class ParallaxPage extends StatefulWidget {
  @override
  _ParallaxPageState createState() => _ParallaxPageState();
}

class _ParallaxPageState extends State<ParallaxPage> {
  double rateZero = 0;
  double rateOne = 0;
  double rateTwo = 0;
  double rateThree = 0;
  double rateFour = 0;
  double rateFive = 0;
  double rateSix = 0;
  double rateSeven = 0;
  double rateEight = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NotificationListener(
            onNotification: (v){
              if(v is ScrollUpdateNotification){
               print("hello");
               setState(() {
                 rateEight -= v.scrollDelta / 1;
                 rateSeven -= v.scrollDelta / 1.5;
                 rateSix -= v.scrollDelta / 2;
                 rateFive -= v.scrollDelta / 2.5;
                 rateFour -= v.scrollDelta / 3;
                 rateThree -= v.scrollDelta / 3.5;
                 rateTwo -= v.scrollDelta / 4;
                 rateOne -= v.scrollDelta / 4.5;
                 rateZero -= v.scrollDelta / 5;
               });

              }
              return true;
            },
            child:Stack(
              children: <Widget>[
                ParallaxWidget(top: rateZero, asset: "images/parallax/parallax0.png"),
                ParallaxWidget(top: rateOne, asset: "images/parallax/parallax1.png"),
                ParallaxWidget(top: rateTwo, asset: "images/parallax/parallax2.png"),
                ParallaxWidget(top: rateThree, asset: "images/parallax/parallax3.png"),
                ParallaxWidget(top: rateFour, asset: "images/parallax/parallax4.png"),
                ParallaxWidget(top: rateFive, asset: "images/parallax/parallax5.png"),
                ParallaxWidget(top: rateSix, asset: "images/parallax/parallax6.png"),
                ParallaxWidget(top: rateSeven, asset: "images/parallax/parallax7.png"),
                ParallaxWidget(top: rateEight, asset: "images/parallax/parallax8.png"),


                ListView(
                     children: <Widget>[
                       Container(
                         height: 395.0,

                       ),
                       Container(
                        color: Color(0xff210002),
                         //color: Colors.white12,

                         height: 1000.0,
                         child:Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: <Widget>[
                             Text(
                               "Parallax In",
                               style: TextStyle(
                                   fontSize: 30,
                                   fontFamily: "MontSerrat-ExtraLight",
                                   letterSpacing: 1.8,
                                   color: Color(0xffffaf00)),
                             ),
                             Text(
                               "Flutter",
                               style: TextStyle(
                                   fontSize: 51,
                                   fontFamily: "MontSerrat-Regular",
                                   letterSpacing: 1.8,
                                   color: Color(0xffffaf00)),
                             ),
                             SizedBox(
                               height: 20,
                             ),
                             SizedBox(
                               width: 190,
                               child: Divider(
                                 height: 1,
                                 color: Color(0xffffaf00),
                               ),
                             ),
                             SizedBox(
                               height: 20,
                             ),
                             Text(
                               "Made By",
                               style: TextStyle(
                                 fontSize: 15,
                                 fontFamily: "Montserrat-Extralight",
                                 letterSpacing: 1.3,
                                 color: Color(0xffffaf00),
                               ),
                             ),
                             Text(
                               "The CS Guy",
                               style: TextStyle(
                                 fontSize: 20,
                                 fontFamily: "Montserrat-Regular",
                                 letterSpacing: 1.8,
                                 color: Color(0xffffaf00),
                               ),
                             ),
                             SizedBox(
                               height: 50,
                             )
                           ],
                         ),

                       ),

                     ],
                )
              ],
            )
        ),
      ),
    );
  }
}

class ParallaxWidget extends StatelessWidget {
  const ParallaxWidget({
    Key key,
    @required this.top,
    @required this.asset,
  }) : super(key: key);

  final double top;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      //left: -45,
      top: top,
      child: Container(
        height: 400,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(asset, fit: BoxFit.cover,alignment: Alignment.bottomCenter,),
      ),
    );
  }
}
