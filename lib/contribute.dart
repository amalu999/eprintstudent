import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Contribute extends StatefulWidget {
  @override
  _ContributeState createState() => _ContributeState();
}

class _ContributeState extends State<Contribute> {
  TextEditingController controller = TextEditingController();
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  var urlString = "https://docs.google.com/forms/d/10IELQAw-36Cc6vOMDznspSHrBLbpdTdnjQ_58YLp2B0/edit";

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

        title: Text("CONTRIBUTE",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

        backgroundColor: Colors.blueGrey[900],

      ),
      url: urlString,
      withZoom: false,
    );
  }
}