import 'package:flutter/material.dart';

import 'menubar.dart';
class About extends StatefulWidget {
  final rate;

  const About({Key key, this.rate}) : super(key: key);
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,

        title: Text("ABOUT",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

        backgroundColor: Colors.blueGrey[900],
      ),

      backgroundColor: Colors.white,
      body:Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.mail),
            title: Text('Mail  :  eprintingapp2020@gmail.com'),

          ),
          ListTile(
            leading: Icon(Icons.
            phone),
            title: Text('Phoneno   :  8606576261'),


          ),
          ListTile(
            leading: Icon(Icons.attach_money),
            title: Text("Rate  :  "+widget.rate.toString()),


          ),
        ],),
    );
  }
}
