// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Emailpasswordregistation {
  final _auth = FirebaseAuth.instance;
  Epregistation(String name, String email, String password) async {
    try {
      // creat an acccout in firebase database
      // by gmail and password
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      //add name & email of user
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({'name': name, 'email': email, 'online': true});
    } catch (e) {
      print(e);
    }
  }
}
