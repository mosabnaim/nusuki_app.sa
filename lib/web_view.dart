import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';

class WebViewExample extends StatefulWidget {
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  
  bool isLoading = true;
  bool isError = false;
  DateTime currentBackPressTime;

  Future<bool> onWillPop() async{
  if (await controllerGlobal.canGoBack()) {
    print("onwill goback");
    controllerGlobal.goBack();
    // return Future.value(true);
  } else {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'انقر مرة أخرى للمغادرة');

      return Future.value(false);
    }
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(true);

    // Scaffold.of(context).showSnackBar(
    //   const SnackBar(content: Text("No back history item")),
    // );
    // return Future.value(false);
  }
    
  }

  final String url = "https://nusuki.com.sa/";
  int loadNum = 0;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }
  WebViewController controllerGlobal;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              Expanded(
                child: isError
                    ? SingleChildScrollView(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Container(child: Image.asset("assets/top.png",fit: BoxFit.cover,)),

                                Image.asset(
                                  "assets/.gif",
                                  fit: BoxFit.cover,
                                ),

                                // Icon(
                                //   Icons.wifi_off,
                                //   color: Colors.redAccent,
                                //   size: 50,
                                // ),
                                SizedBox(
                                  height: 60,
                                ),
                                Container(
                                    height: 200,
                                    width: 200,
                                    child: Image.asset(
                                      "assets/Logoo.jpg",
                                      fit: BoxFit.cover,
                                    )),
                                // Image.asset("assets/logo.png",fit: BoxFit.cover,)
                              ],
                            ),
                          ),
                        ),
                      )
                    : Stack(
                        children: [
                          WebView(
                          
                            debuggingEnabled: true,
                            allowsInlineMediaPlayback: true,
                            initialUrl: url,
                            javascriptMode: JavascriptMode.unrestricted,
                            navigationDelegate: (NavigationRequest request) {
                              print(request.url);
                              if (request.url.contains("whatsapp")) {
                                launch(request.url);
                                return NavigationDecision.prevent;
                              } else {
                                return NavigationDecision.navigate;
                              }
                            },
                            
                              if (a.domain == null &&
                                  a.failingUrl.contains('phone')) {
                                launch(a.failingUrl);
                              } else {
                                isError = true;
                              }
                              setState(() {});
                            },
                            onProgress: (num) {
                              loadNum = num;
                              setState(() {});
                            },
                            onPageFinished: (finish) {
                              setState(() {
                                isLoading = false;
                              });
                            },
                            onPageStarted: (start) {
                              setState(() {
                                isLoading = true;
                              });
                            },
                            javascriptChannels: <JavascriptChannel>{
                              _toasterJavascriptChannel(context),
                            },
                            gestureNavigationEnabled: true,
                          ),
                          isLoading
                              ? Container(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      LinearProgressIndicator(
                                        color: Color(0xff124734),
                                        backgroundColor: Color(0xff124734).withOpacity(0.5),
                                      ),
                                      CircularPercentIndicator(
                                        radius: 60.0,
                                        lineWidth: 5.0,
                                        percent: loadNum / 100,
                                        center: new Text("$loadNum%"),
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        progressColor: Color(0xff124734).withOpacity(0.5),
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
                      ),
              ),
            ],
          ),
          // floatingActionButton: buildNavigateButton(),
        ));
  }


  // Widget buildNavigateButton() => Padding(
  //       padding: const EdgeInsets.only(bottom: 85, right: 3),
  //       child: Container(
  //         height: 50,
  //         child: FloatingActionButton(
  //           onPressed: (){
  //             launchWhatsapp(number: "+65 9122 7417", message: "مرحبا");
  //           },
  //           child: ClipRRect(
  //               borderRadius: BorderRadius.circular(100),
  //               child: Image.asset(
  //                 "assets/whatsapp.png",
  //                 fit: BoxFit.contain,
  //               )),
  //         ),
  //       ),
  //     );
}




