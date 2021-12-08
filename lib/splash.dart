import 'package:nusuki/animate_do.dart';
import 'package:nusuki/animation.dart';
import 'package:nusuki/animation_arabic.dart';
import 'package:nusuki/isload.dart';
import 'package:nusuki/web_view.dart';
import 'package:flutter/material.dart';
// import 'package:stayandtravel/animate_do.dart';
// import 'package:stayandtravel/animation.dart';
// import 'package:stayandtravel/animation_arabic.dart';
// import 'package:stayandtravel/isload.dart';
// import 'package:stayandtravel/web_view.dart';
// import 'package:wazzfny/animate_do.dart';
// import 'package:wazzfny/animation.dart';
// import 'package:wazzfny/animation_arabic.dart';
// import 'package:wazzfny/isload.dart';
// import 'package:wazzfny/web_view.dart';
// import 'package:webview/animate_do.dart';
// import 'package:webview/isload.dart';
// import 'package:webview/web_view.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  initState() {
    super.initState();

    var delay = Duration(seconds: 3);
    Future.delayed(delay, () {
      Navigator.pushAndRemoveUntil<void>(
        context,
        MaterialPageRoute<void>(
            builder: (BuildContext context) => WebViewExample()),
        ModalRoute.withName('/'),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff124734),
      body: Container(child: CustomLogo()),
    );
  }
}

class CustomLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlipInX(
            child: FlipInY(
              child: Center(
                child: Image.asset(
                  'assets/Logoo.jpg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Animations(),
          AnimationArabic(),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      Positioned(bottom: 100, left: 0, right: 0, child: IsLoad()),
    ]);
  }
}
