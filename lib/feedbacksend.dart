import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class FeedbackSend extends StatefulWidget {
  @override
  _FeedbackSendState createState() => _FeedbackSendState();
}

class _FeedbackSendState extends State<FeedbackSend> {
  TextEditingController controller = TextEditingController();
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  var urlString = "https://docs.google.com/forms/d/e/1FAIpQLSfmLZ9-TjxHd2pDOXB15F1qqgdqL_7f3hnxdHOnu06WsPz8gA/viewform?usp=sf_link";

  launchUrl() {
    setState(() {
      urlString = controller.text;
      flutterWebviewPlugin.reloadUrl(urlString);
    });
  }

  @override
  void initState() {
    super.initState();

    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged wvs) {
      print(wvs.type);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        brightness: Brightness.dark,

        title: Text("FEEDBACK",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

        backgroundColor: Colors.blueGrey[900],

      ),
      url: urlString,
      withZoom: false,
    );
  }
}