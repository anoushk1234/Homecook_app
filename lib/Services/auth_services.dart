import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /* MyUser _userFromFirebaseuser(User user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }*/

  //auth change user stream
  Stream<User> get user {
    return _auth.authStateChanges();
  }

//email sign in
  Future signinwithemailandpassword(String email,String pass)async{
    try{
      UserCredential result=await _auth.signInWithEmailAndPassword(email: email, password: pass);
      User user=result.user;
      return user;
    }catch(e){
      print(e.toString());
    }
  }
//email reg
  Future registerwithemailandpassword(String email, String pass) async {
    try{
      UserCredential result=await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      User user=result.user;
      return user;
    }
    catch(e){
      print(e.toString());
    }
  }

//sign out
  Future signOut() async {
    try {
      return _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
