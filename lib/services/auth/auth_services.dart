import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? getCurrentUser() {
    return _auth.currentUser;
  }




  void loginService(BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      print(e);
      Navigator.pop(context);
    } catch (e) {
      print(e);
      Navigator.pop(context);
    }
  }




  void registerService(BuildContext context, String email, String password,
      String confirmPassword) async {
    try {
      if (password == confirmPassword) {
        //register
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

      }
      Navigator.pop(context);
      Navigator.pop(context);

    } on FirebaseAuthException catch (e) {
      print(e);
      Navigator.pop(context);
    } catch (e) {
      Navigator.pop(context);
    }
  }

  void logout() {
    FirebaseAuth.instance.signOut();
  }
}
