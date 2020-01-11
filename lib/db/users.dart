import 'package:cloud_firestore/cloud_firestore.dart';


class UserServices{
  Firestore _firestore = Firestore.instance;
  String ref = "users";

  createUser(Map data){

   // _database.reference().child(ref).push().set(value).catchError((e)=> {print(e.toString())});
   _firestore.collection(ref).document(data["userId"]).setData(data);
   print('maaaaaaaaaaaaaaa');
  }
}