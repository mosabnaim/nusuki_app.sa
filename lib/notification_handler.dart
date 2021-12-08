
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';


// class NotificationHelper {
//   String token = '';
//   final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =new FlutterLocalNotificationsPlugin();
//   Map<String, dynamic> message = {};
//    initialNotification() {
//     getToken();
//     var initializationSettingsAndroid =
//         new AndroidInitializationSettings('@mipmap/ic_launcher');
//     var initializationSettingsIOS = new IOSInitializationSettings();
//     var initializationSettings = new InitializationSettings(
//         android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
//     flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onSelectNotification: onSelectNotification,
//     );
//     firebaseMessaging.requestNotificationPermissions(
//         const IosNotificationSettings(
//             alert: true, badge: true, provisional: true, sound: true));

//     firebaseMessaging.configure(
//       onMessage: (Map<String, dynamic> message) async {
//         this.message = message;
//         print('onMessage');
//         // ServerUser.serverUser.getMyNotification();

//         showNotification(
//             message['notification']['title'],
//             message['notification']['body']
//                  );


//       },
//       // onBackgroundMessage: myBackgroundMessageHandler,
//       onLaunch: (Map<String, dynamic> message) async {
//         print("onLaunch: $message");
//         this.message = message;
//       },
//       onResume: (Map<String, dynamic> message) async {
//         print("onResume: $message");
//         this.message = message;

//         print('messasaf');
//       },
//     );
//   }

//   Future onSelectNotification(String payload) async {
//     if (payload != null) {}


//    }

//   void showNotification(String title, String body) async {
//     await _demoNotification(
//       title,
//       body,
//     );
//   }

//   Future<void> _demoNotification(String title, String body) async {
//     var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//       'channel_ID',
//       'channel name',
//       'channel description',
//       importance: Importance.max,
//       playSound: true,
//       showProgress: true,
//       priority: Priority.high,
//       ticker: 'test ticker',
//     );

//     var iOSChannelSpecifics = IOSNotificationDetails();
//     var platformChannelSpecifics = NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//       iOS: iOSChannelSpecifics,
//     );
//     await flutterLocalNotificationsPlugin
//         .show(0, title, body, platformChannelSpecifics, payload: 'test');
//   }

//   getToken() async {
//     firebaseMessaging.subscribeToTopic('all');
//     token = await firebaseMessaging.getToken();
//     //  await SHelper.sHelper.addNew('fcmToken',token);
//     print("the token id : $token");
//     // firebaseMessaging.subscribeToTopic(token);

//     return token;
//   }
// }
