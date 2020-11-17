import 'dart:convert';


import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'about.dart';
import 'homepage.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'main.dart';
import 'menubar.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  var rate;
  getMethod() async{
    String theUrl='https://designproject---eprint.000webhostapp.com/getrate.php';
    var res = await http.get(Uri.encodeFull(theUrl),headers: {"Accept":"application/json"});
    if(res.statusCode==200){

      setState(() {
        rate=json.decode(res.body)[0]['RATE'];
        print(rate);
      });
    }else{print('error');}
    // return responseBody;

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMethod();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,

          title: Text("SETTINGS",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

          backgroundColor: Colors.blueGrey[900],
        ),

        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 50,
                child: ListTile(
                    leading: Icon(Icons.info),
                    title: Text('About'),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => About(rate: rate,)
                      ),);
                    }
                ),
              ),
              ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Logout'),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyApp()
                    ),);
                  }
              ),
            ],
          ),
        )


    );
  }
}
