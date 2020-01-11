import 'package:flutter/material.dart';
import 'package:marketing_app/pages/Command_details.dart';
import 'package:marketing_app/pages/home.dart';
import 'package:marketing_app/pages/login.dart';
import 'package:marketing_app/pages/splash.dart';
import 'package:marketing_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(ChangeNotifierProvider(builder: (_) => UserProvider.initialize(),
  child: MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.deepOrange,
    ),
    home: ScreensController(),
  ),
  ));
  
}
// return a page % status of the user
class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    /*switch(user.status){
      case Statuus.Uninitialized:
        return Splash();
      case Statuus.Unauthenticated:
      case Statuus.Authenticating:
        return  Login();
      case Statuus.Authenticated:
        return HomePage();
        default: return Login();
    }*/
    return Command();
  }
}

