import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:incrementapp/AppColor.dart';
import 'package:incrementapp/screen/home/home.dart';
import 'package:incrementapp/screen/login/login.dart';
import 'package:incrementapp/screen/welcome/welcome.dart';

void main() {
  // remove status bar and change the icon view
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // status bar color
      statusBarColor: Color(0xFFFFFFFF),
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light));
  runApp(const MyApp());
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
        scaffoldBackgroundColor:AppColor().background ,
      ),
      initialRoute: Welcome.name,
      routes: {
        Welcome.name: (context) =>  Welcome(),
        Login.name: (context) =>  Login(),
        Home.name: (context) =>  Home(),
      },
    );
  }
}
