import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'file:///C:/Users/Anoushk/AndroidStudioProjects/pigeon/lib/homepages/bottomnavpage.dart';
import 'package:provider/provider.dart';
import 'package:pigeon/authentication_pages/sign_in.dart';

class AuthListener extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    if (user == null) {
      return SignIn();
    }
    else {
      return Homepage();
    }
  }
}
