import 'package:flutter/material.dart';
import 'package:pigeon/Services/auth_services.dart';
import 'package:pigeon/authentication_pages/register.dart';
import 'package:pigeon/authentication_pages/sign_in.dart';
import 'file:///C:/Users/Anoushk/AndroidStudioProjects/pigeon/lib/homepages/bottomnavpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pigeon/cook_pages/homekitchen_listpage.dart';
import 'package:pigeon/homepages/cart.dart';
import 'package:pigeon/homepages/home.dart';
import 'package:pigeon/homepages/profile.dart';
import 'package:provider/provider.dart';
import 'authentication_pages/auth_listener.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthListener(),
        routes: {
          'register': (context) => Register(),
          "signin": (context) => SignIn(),
          "0": (context) => Homepage(),
          "1": (context) => Cart(),
          "2": (context) => Profile(),
          "home": (context) => Home(),
          "homekitchens": (context) => HomekitchenList()
        },
      ),
    );
  }
}

/*class AuthWrapper extends StatefulWidget {
  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {


  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}*/
