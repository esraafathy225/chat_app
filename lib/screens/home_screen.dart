import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  void logout(){
    FirebaseAuth.instance.signOut();
  }

  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        actions: [
          IconButton(onPressed: logout, icon: Icon(Icons.logout,color: Colors.white,))
        ],
      ),
        body: Center(child: Text('Logged In as ${user.email}',style: TextStyle(fontSize: 24),)));
  }

}
