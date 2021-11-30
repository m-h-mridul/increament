import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:incrementapp/AppColor.dart';
import 'package:incrementapp/pushnotification.dart';
import 'package:incrementapp/screen/home/home.dart';
import 'package:incrementapp/screen/login/login.dart';
import 'package:incrementapp/screen/registation/registation.dart';
import 'package:incrementapp/screen/welcome/welcome.dart';

Future<void> main() async {
  //
  WidgetsFlutterBinding.ensureInitialized();
  // intitialize firebase
  await Firebase.initializeApp();
  // remove status bar and change the icon view
  await PushNotificationService().setupInteractedMessage();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // status bar color
      statusBarColor: Color(0xFFFFFFFF),
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light));
  runApp(const MyApp());
  RemoteMessage? initialMessage =
      await FirebaseMessaging.instance.getInitialMessage();
  if (initialMessage != null) {
    // App received a notification when it was killed
}
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // declear media query for responsive app

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColor().background,
      ),
      initialRoute: Welcome.name,
      routes: {
        Welcome.name: (context) => Welcome(),
        Login.name: (context) => Login(),
        Home.name: (context) =>  Home(),
        Registation.name: (context) => Registation(),
      },
    );
  }
}
