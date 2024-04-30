import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WebViewContainer(),
  ));
}

class WebViewContainer extends StatefulWidget {
  @override
  _WebViewContainerState createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: "https://hayamystique.com/",
          onWebViewCreated: (WebViewController controller) {
            _controller = controller;
            _clearCache();
          },
          javascriptMode: JavascriptMode.unrestricted,
          initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
          userAgent:
          "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Mobile Safari/537.36",
        ),
      ),
    );
  }

  void _clearCache() async {
    await _controller.clearCache(); // Clear cache before loading new URL
  }
}
