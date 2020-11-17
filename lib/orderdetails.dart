import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'confirm_order.dart';
import 'customrange.dart';



class OrderDetails extends StatefulWidget {
  final String nameOfBook;
  final String author;
  final String subject;
  final noofpages;
  final price;
  final url;
  var amount;
  var copies;
  OrderDetails({Key key, this.subject, this.nameOfBook, this.author, this.noofpages, this.price, this.url});

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {

  var emailId;
  var resId;
  var author;
  var subject;
  var nopages;
  var price;
  var url;
  var nameOfBook;

  TextEditingController copyctrl;
  void getValues() async {
    print('Getting Values from shared Preferences');
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    emailId = sharedPrefs.getString('email');
    nameOfBook= sharedPrefs.getString('name_of_book');
    author = sharedPrefs.getString('author');
    subject = sharedPrefs.getString('subject');
    nopages = sharedPrefs.getString('no_of_pages');
    price = sharedPrefs.getInt('price');
    url = sharedPrefs.getString('url');
    resId= sharedPrefs.getString('res_id');
    print('user_name: $emailId');
    print('resId: $resId');
    print('book = $nameOfBook');

  }
  void setValues(copies) async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    // set values
    sharedPrefs.setString('copies', copyctrl.text);
    print('Values Set in Shared Prefs!!');
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    copyctrl = new TextEditingController();}

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  void confirmOrder(subject, name, author, pages, price, copies,amount) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>
          ConfirmOrder(subject: subject,
            nameOfBook: name,
            author: author,
            noofpages: pages,
            price: price,
            copies: copies,
            amount: amount,),
    ),);
  }


  noOfCopiesDialog() {
    Widget okButton = FlatButton(
      child: Center(child: Text("OK",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold),)),
      onPressed: () {
        setValues(copyctrl);
        confirmOrder(
            widget.subject, widget.nameOfBook, widget.author, widget.noofpages,
            widget.price, int.parse(copyctrl.text),widget.amount);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text('Number of Copies') ,
      content: TextField(
        controller: copyctrl,
        decoration: InputDecoration(
            hintText: "Enter the required number of copies you want"
        ),
        keyboardType: TextInputType.numberWithOptions(),
      ),
      //Text("Enter the required number of copies you want"),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );

  }





  showAlertDialog() {

    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("YES",style: TextStyle(color: Colors.blueGrey)),
      onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CustomRange(subject:widget.subject,nameOfBook:widget.nameOfBook,author:widget.author,noofpages: widget.noofpages,)),);



      },



    );
    Widget continueButton = FlatButton(
        child: Text("NO",style: TextStyle(color: Colors.blueGrey),),
        onPressed:(){ noOfCopiesDialog();}
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(""),
      content: Text("Would you like to customize the textbook?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  @override
  void initState1() {
    super.initState();
    getValues();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,

          title: Text("DETAILS",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

          backgroundColor: Colors.blueGrey[900],


        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                      text: "SUBJECT:   ",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
                      children: [
                        TextSpan(text: widget.subject,style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.blueGrey
                        ))
                      ]
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                      text: "NAME OF BOOK:   ",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
                      children: [
                        TextSpan(text: widget.nameOfBook,style: TextStyle(
                            fontWeight: FontWeight.normal,color: Colors.blueGrey
                        ))
                      ]
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                      text: "AUTHOR:   ",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
                      children: [
                        TextSpan(text: widget.author,style: TextStyle(
                            fontWeight: FontWeight.normal,color: Colors.blueGrey
                        ))
                      ]
                  ),
                ),
              ),

              SizedBox(height: 70,),
              Row(children: <Widget>[
                SizedBox(height: 30,width: 20),


                RaisedButton(
                    child: Icon(Icons.chrome_reader_mode),
                    color: Colors.blueGrey,
                    onPressed:() {_launchInBrowser(widget.url);}
                ),
                SizedBox(width: 40,),
                RaisedButton(child:Icon(Icons.print),
                    color: Colors.blueGrey,
                    onPressed:(){
                      showAlertDialog();
                    } )
              ],)


            ],

          ),
        )
    );
  }
}