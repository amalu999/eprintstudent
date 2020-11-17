
import 'package:eprintapp_deco/readytocollect.dart';
import 'package:flutter/material.dart';

import 'contribute.dart';
import 'feedbacksend.dart';
import 'order_display.dart';
import 'settings.dart';
import 'history.dart';

import 'package:shared_preferences/shared_preferences.dart';

class MenuBar extends StatefulWidget {

  final String email;

  const MenuBar({Key key, this.email}) : super(key: key);
  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://st.depositphotos.com/2815327/3510/v/600/depositphotos_35105363-stock-video-abstract-blue-background-with-vertical.jpg"),
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fill ,
                ),
              ),

              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.account_circle,size: 70,),
                backgroundColor: Colors.blueGrey,

              ),
            ),
            ListTile(
                leading: Icon(Icons.add_shopping_cart),
                title: Text('Your Collect'),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => YourCollect()
                  ),);
                }
            ),
            ListTile(
                leading: Icon(Icons.dashboard),
                title: Text('Order placed'),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => YourOrders()
                  ),);
                }
            ),

            ListTile(
                leading: Icon(Icons.
                history),
                title: Text('History'),
                onTap: (){ Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => YourHistory(),
                ),);

                }
            ),
            ListTile(
                leading: Icon(Icons.control_point),
                title: Text('Contribute'),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Contribute(),
                  ),);

                }
            ),
            ListTile(
                leading: Icon(Icons.feedback),
                title: Text('Feedback'),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FeedbackSend(),
                  ),);
                }
            ),
            ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: (){Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Settings(),
                ),);

                }
            ),

          ]
      ),
    );

  }
}



