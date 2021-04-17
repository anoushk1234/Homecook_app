import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pigeon/reusables/loading.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String globalemail = "";
  String pass = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              elevation: 0.0,
              title: Text('Sign in'),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Register'),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'register');
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
                          globalemail=email;
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
                          'Sign In',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result =
                                await auth.signInWithEmailAndPassword(
                                    email: globalemail, password: pass);
                           // print(result.toString());
                            if (result == null) {
                              setState(() {
                                loading = false;
                              });
                              print("invalid email");
                            }
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
