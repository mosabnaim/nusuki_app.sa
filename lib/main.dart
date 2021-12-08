import 'package:nusuki/splash.dart';
import 'package:flutter/material.dart';
// import 'package:wazzfny/splash.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:stayandtravel/splash.dart';
// import 'package:webview/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // NotificationHelper().initialNotification();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: "Cairo"),
        debugShowCheckedModeBanner: false,
        locale: Locale('en'),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: Splash());
  }
}
