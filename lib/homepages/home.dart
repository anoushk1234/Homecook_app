import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pigeon/reusables/datasearch.dart';
import 'package:pigeon/reusables/hex.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      //location
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 13),
              child: Container(
                height: 20,
                width: 80,
                color: Colors.grey[350],
              ),
            ),
          ],
        ),
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 0,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: ButtonTheme(
                  height: 45,
                  minWidth: MediaQuery.of(context).size.width,
                  child: FlatButton(
                    child: Text(
                      "Restaurant name,cuisine or a dish...",
                      // textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    /*shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      //side: BorderSide(color: Colors.red)
                    ),*/
                    onPressed: () {
                      showSearch(context: context, delegate: DataSearch());
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.075,
              top: MediaQuery.of(context).size.height * 0.033,
              // top: ,
              child: Icon(
                Icons.search,
                size: 30,
                color: Colors.orangeAccent,
              ),
            ),
          ],
        ), //Search Bar Mechanism
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Near You",
                style: TextStyle(fontSize: 35, fontFamily: "Comfortaa"),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context,'homekitchens');
            //print("Container click registered");
          },
          child: Stack(
            //alignment: AlignmentDirectional.topStart,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 17, right: 17, top: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: HexColor("#EF5354"),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.28,
                    //color: Colors.black54,
                  ),
                ),
              ),

              Positioned(
                left: MediaQuery.of(context).size.width * 0.06,
                top: MediaQuery.of(context).size.height * 0.125,
                child: Text(
                  "Enjoy fresh\nhomecooked\nmeals",
                  style: TextStyle(
                      fontSize: 27.5,
                      color: Colors.white,
                      fontFamily: "Comfortaa",
                      fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.08,
                  top: MediaQuery.of(context).size.height * 0.25,
                  child: Icon(
                    Icons.arrow_right_alt_outlined,
                    color: Colors.white,
                    size: 50,
                  )),

              Positioned(
                left: MediaQuery.of(context).size.width * 0.515,
                top: MediaQuery.of(context).size.height * 0.0001,
                child: Image.asset(
                  'assets/tikka.png',
                  width: 190.0,
                  height: 240.0,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
