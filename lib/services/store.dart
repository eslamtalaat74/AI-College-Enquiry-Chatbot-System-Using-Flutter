import 'package:chat_bot/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Store {
  /// Take Instance From FireStore
  Firestore firestore = Firestore.instance;
  /// Add new User With Email And Password To FireStore DataBase
  adduser(User user) {
   /* firestore.collection("Users").document(user.userId).setData({
      "FistName": user.firstName,
      "LastName": user.lastName,
      "Uid": user.userId,
      "Address" :user.address,
      "Gender":user.gender,
      "BirthDay":user.birthDay
    });  */
  }
}