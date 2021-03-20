import 'package:chat_app/screens/home_page/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../modules/authentication.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _email, _password;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[100],
      body: SafeArea(
        child: Center(
          child: Container(
            height: 340,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: emailController,
                    style: TextStyle(color: Colors.black),
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please type email';
                      }
                    },
                    onSaved: (input) {
                      _email = input;
                      emailController.clear();
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    style: TextStyle(color: Colors.black),
                    // ignore: missing_return
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please type password';
                      }
                      if (input.length < 6) {
                        return 'Password must be more than 6 charactors';
                      }
                    },
                    onSaved: (input) {
                      _password = input;
                      passwordController.clear();
                    },
                    decoration: InputDecoration(labelText: 'Password'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    color: Colors.amber,
                    onPressed: () {
                      signUp();
                    },
                    child: Text('Sign Up'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account ? ',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => MyApp()));
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signUp() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        Authentication auth = Authentication();
        auth.signUp(_email, _password, context);
      } catch (e) {
        print(e.message);
      }
    }
  }
}
