import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pigeon/reusables/loading.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:pigeon/reusables/imagegetter.dart';
import 'package:pigeon/Services/firestorageservice.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomekitchenList extends StatefulWidget {
  @override
  _HomekitchenListState createState() => _HomekitchenListState();
}

class _HomekitchenListState extends State<HomekitchenList> {
  Future<Widget> _getImage(BuildContext context, String imageName) async {
    ClipRRect image;
    await FireStorageService.loadImage(context, imageName).then((value) {
      image = ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Image.network(
          value.toString(),
          fit: BoxFit.fill,
        ),
      );
    });
    return image;
  }

  int homecookquantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection("Homekitchens").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            print("snapshot from homecooks doesnt have any data");
            return Loading(); //replace with popup in future and a timeout feature
          } else {
            return ListView.builder(
              itemCount: homecookquantity=snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot homekitchens = snapshot.data.docs[index];

                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 11),
                      child: PhysicalModel(
                        //clipBehavior: Clip.hardEdge,
                        elevation: 6,
                        color: Colors.white,
                        shadowColor: Colors.grey[350],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                bottom: 55,
                                child: FutureBuilder(
                                  future: _getImage(
                                      context,
                                      "Front Images/" +
                                          "${homekitchens.id}" +
                                          ".jpg"),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      //print(snapshot.data);
                                      return Container(
                                        child: SpinKitCircle(
                                          size: 20,
                                          color: Colors.blue,
                                        ),
                                      );
                                    } else if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      return Container(
                                        child: snapshot.data,
                                      );
                                    } else {
                                      return Container();
                                    }
                                  },
                                ),
                              ),
                              Positioned(
                                bottom: 25,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  //change later
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, bottom: 5),
                                      child: Text(
                                        "${homekitchens.id}",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: "Comfortaa",
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  //change later
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text(
                                        "${homekitchens["cuisine"]}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            //fontFamily: "Comfortaa",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}

class FireStorageService extends ChangeNotifier {
  FireStorageService();

  static Future<dynamic> loadImage(BuildContext context, String Image) async {
    return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
  }
}
/*
Text(
"${homekitchens.id}",
style: TextStyle(
fontFamily: "Comfortaa",
// ignore: missing_return
fontSize: 30),
),*/
