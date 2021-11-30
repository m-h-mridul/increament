// ignore: file_names
// ignore_for_file: unnecessary_null_comparison, file_names, duplicate_ignore, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Emailpassword {
  final _auth = FirebaseAuth.instance;
  login(String email, String passsword) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: passsword);
      if (userCredential != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .update({'online': true});
      } else {
        print('finding some errors \nuser not creat');
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
