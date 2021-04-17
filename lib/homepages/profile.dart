import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton.icon(
          onPressed: () async {
            await _auth.signOut();
          },
          icon: Icon(Icons.person),
          label: Text(
            "log out",
          )),
    );
  }
}

