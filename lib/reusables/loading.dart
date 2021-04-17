import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        /*width: 400,
        height: 400,*/
        child: Center(
          child: SpinKitDualRing(
            size: 50,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
/*
actions: <Widget>[
FlatButton.icon(
onPressed: () async {
await _auth.signOut();
},
icon: Icon(Icons.person),
label: Text(
"log out",
))
],*/
