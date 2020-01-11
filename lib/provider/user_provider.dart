import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:marketing_app/db/users.dart';
import 'package:google_sign_in/google_sign_in.dart';

// a user cab be :
enum Statuus{
  Uninitialized,
  Authenticated,  // the user will be logged in the app
  Authenticating, // show a circular progress indocator
  Unauthenticated //put the user in the login screen
}

class UserProvider with ChangeNotifier{
  FirebaseAuth _auth;
  FirebaseUser _user;
  Statuus _status = Statuus.Uninitialized; // the first status of the user
  Statuus get status => _status; // to get the status
  FirebaseUser get user => _user; // to get the user
  UserServices _userServices= UserServices();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  UserProvider.initialize(): _auth = FirebaseAuth.instance{
    _auth.onAuthStateChanged.listen(_onStateChanged);
  //every time the status of the user is changed this method is going to be called
  }
  Future<bool> signIn(String email, String password) async{
    try{
      _status = Statuus.Authenticating; // change the status of the user
      notifyListeners(); // notify our listeners that something changed inside provider
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true; // execution was perfect
      }catch(e){
           _status = Statuus.Unauthenticated; // in case of error
           notifyListeners();
           print(e.toString());
           return false;
    }
  }
  Future<bool> signUp(String name,String email, String password) async{
    try{
      _status = Statuus.Authenticating; // change the status of the user
      notifyListeners(); // notify our listeners that something changed inside provider
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((user){
        Map<String, dynamic> values = {
          "name": name,
          "email": email,
          "userId": user.uid,
        };
        _userServices.createUser(values);
      });
      return true; // execution was perfect
    }catch(e){
      _status = Statuus.Unauthenticated; // in case of error
      notifyListeners();
      print(e.toString());
      return false;
    }
  }
  Future signOut() async{
    _auth.signOut();
    _status = Statuus.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero); // cuz async
  }
  Future <void> _onStateChanged(FirebaseUser user) async {
  if(user == null){
    _status = Statuus.Unauthenticated;
  }else{
    _user = user;
    _status = Statuus.Authenticated;
  }
  notifyListeners();

  }
  Future<FirebaseUser> googleSignIn() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final GoogleSignInAccount googleAccount = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    try{
      FirebaseUser user = await _firebaseAuth.signInWithCredential(credential);
      return user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}