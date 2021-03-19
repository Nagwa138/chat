import 'package:chat_app/screens/home_page/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';

class Authentication
{
  Future <void> signUp(String email , String password , BuildContext context) async {
    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBXFKmVM7d69XmrwoJFzCT3-6o-uOB9ZX4';

    final response = await http.post(url , body: json.encode(
      {
        'email' : email,
        'password' : password,
        'returnSecureToken' : true,
      }
    ));

    final responseData = json.decode(response.body);
    AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    // if(await FirebaseAuth.instance.currentUser() != null) {
    // FirebaseUser user = await FirebaseAuth.instance.currentUser();

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => HomePage(user: user)));
    // }
    print(responseData);


  }
}