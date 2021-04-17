import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:pigeon/homepages/cart.dart';
import 'package:pigeon/homepages/home.dart';
import 'package:pigeon/homepages/profile.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // final AuthService _auth = AuthService();
  //int _page = 0; //bottom nav bar chosen index by user
  //GlobalKey _bottomNavigationKey = GlobalKey();
  int _page = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /* static List<Widget> pages = <Widget>[
    Homepage(),
    Cart(),
    Profile(),
  ];
*/
  Widget _showPage = new Home();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return Home();
        break;
      case 1:
        return Cart();
        break;
      case 2:
        return Profile();
        break;
      default:
        return new Container(
          color: Colors.red,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(child: _showPage),
        bottomNavigationBar: CurvedNavigationBar(
          // key: _bottomNavigationKey,
          index: 0,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.home, size: 30,color: Colors.orangeAccent,),
            Icon(Icons.shopping_cart, size: 30,color: Colors.orangeAccent),
            Icon(Icons.account_circle, size: 30,color: Colors.orangeAccent),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.black,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) {
            setState(() {
              _showPage = _pageChooser(index);
            });
          }
          // Navigator.pushNamed(context,_page.toString());
          ,
          // letIndexChange: (index) => true,
        ),
      ),
    );
  }
}
