import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomWebview extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<CustomWebview> {

  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  PullToRefreshController pullToRefreshController;
  String url = "https://www.wazzfny.com/";
  double progress = 0;
  final urlController = TextEditingController();

  @override
  void initState() {
    super.initState();

    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController?.reload();
        } else if (Platform.isIOS) {
          webViewController?.loadUrl(
              urlRequest: URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
  bool isLoading = true;
    int loadNum = 0;
  @override
  Widget build(BuildContext context) {
  return  Stack(
    children: [
      WebviewScaffold(
        

        initialChild: Container(
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
              url: "https://www.wazzfny.com/",
              withLocalStorage: true,
            ),
            isLoading
                              ? Container(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      LinearProgressIndicator(),
                                      CircularPercentIndicator(
                                        radius: 60.0,
                                        lineWidth: 5.0,
                                        percent: loadNum / 100,
                                        center: new Text("$loadNum%"),
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        progressColor: Colors.blueAccent,
                                      ),
                                      Container()
                                    ],
                                  ),
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.grey.withOpacity(0.2),
                                )
                              : Stack(),
            
    ],
  );
  
}}

