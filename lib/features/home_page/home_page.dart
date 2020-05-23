import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        actions: <Widget>[
          IconButton(
            icon : new Icon(Icons.exit_to_app),
            onPressed: ()async{
              await FirebaseAuth.instance.signOut() ;
              print("Signed out");
            },
          )
        ],
      ),
    );
  }
}