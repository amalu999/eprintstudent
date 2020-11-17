
import 'package:eprintapp_deco/reading_list_card.dart';
import 'package:flutter/material.dart';


import 'frontpage.dart';
import 'menubar.dart';
//import 'package:book_app/widgets/two_side_rounded_button.dart';

class HomeScreen extends StatelessWidget {
  final String email;

  const HomeScreen({Key key, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: MenuBar(email: email.toString(),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://st.depositphotos.com/2815327/3510/v/600/depositphotos_35105363-stock-video-abstract-blue-background-with-vertical.jpg"),
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: size.height * .1),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.display1,
                        children: [
                          TextSpan(text: "ORDER YOUR"),
                          TextSpan(
                              text: " BOOK?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: <Widget>[
                          ReadingListCard(

                            title: "TEXTBOOK",

                            pressDetails: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Frontpage();
                                  },
                                ),


                              );
                            },
                          ),
                          ReadingListCard(

                            title: "NOTEBOOKS",

                            pressDetails: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Frontpage();
                                  },
                                ),


                              );
                            },
                          ),
                          ReadingListCard(

                            title: "LAB MANUAL",

                            pressDetails: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Frontpage();
                                  },
                                ),


                              );
                            },
                          ),
                        ]
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}