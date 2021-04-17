import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pigeon/reusables/loading.dart';
import 'package:provider/provider.dart';
import 'package:pigeon/authentication_pages/auth_listener.dart';
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  String globalemail = "";
  String pass = "";
  FirebaseAuth auth = FirebaseAuth.instance;
  bool loading = false;

  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              elevation: 0.0,
              title: Text('Register'),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Sign In'),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'signin');
                  },
                ),
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      onChanged: (email) {
                        setState(() {
                          globalemail = email;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      obscureText: false,
                      validator: (val) => val.length < 6
                          ? 'Enter a password 6+ chars long'
                          : null,
                      onChanged: (password) {
                        setState(() => pass = password);
                      },
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });
                          dynamic result=await auth.createUserWithEmailAndPassword(email: globalemail, password: pass);

                          if (result == null) {
                            setState(() {
                              loading = false;
                            });
                            print("invalid email");
                          }
                          else{
                            Navigator.pushReplacementNamed(context,'0');
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
