import 'package:chat_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        centerTitle: true,
      title: Text('Home'),
        actions: [
          IconButton(icon: Icon(Icons.logout),
          onPressed: (){
            _signOut();
          },
          )
        ],
    ),
      body:
      Column(
        children: [

          Container(
              padding: EdgeInsets.only(top: 150 , bottom: 20),
              child: Center(child: Text('${widget.user.email}'),),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            RaisedButton(
              color: Colors.indigo,
              onPressed: (){

              },
              child: Text('Chats' , style: TextStyle(color: Colors.white),),
            ),
SizedBox(width: 20,),
            RaisedButton(
              color: Colors.indigo,
              onPressed: (){

              },
              child: Text('Tasks' , style: TextStyle(color: Colors.white),),
            ),
          ],)
        ],
      ),
    );
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));

  }
}
