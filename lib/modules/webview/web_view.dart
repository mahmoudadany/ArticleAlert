import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppWebView extends StatelessWidget {
   String url;
   AppWebView({super.key,  required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Article App"),
      ),
      body: WebView(initialUrl: url,),
    );
  }
}
