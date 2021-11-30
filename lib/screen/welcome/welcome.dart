// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:incrementapp/Style.dart';
import 'package:incrementapp/media.dart';
import 'package:incrementapp/screen/login/Controller.dart';
import 'package:incrementapp/screen/login/login.dart';

import '../../AppColor.dart';

class Welcome extends StatelessWidget {
   Welcome({Key? key}) : super(key: key);
  static String name = 'Home';
  // #1A1C27 background color
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    MediaQuerypage.init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor().background,
        body: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 30),
                child: Image(
                  width: MediaQuerypage.screenWidth,
                  height: MediaQuerypage.screenHeight! / 3,
                  image: AssetImage('assets/pic1.png'),
                ),
              ),
              Text(
                'Increments Inc.',
                style: Style().h1style
              ),
              Text('      Movies in your palm!',
                  style: Style().h2style),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 25),
                child: Text(
                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur',
                    style: TextStyle(
                        color: AppColor().white,
                        fontSize: 20,
                        fontFamily: 'Roboto-Regular')),
              ),
              Container(
                width: MediaQuerypage.screenWidth,
                height: MediaQuerypage.screenHeight! / 12,
                decoration: BoxDecoration(
                  color: const Color(0xFF5E534E),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Login.name);
                      },
                      child: Container(
                        height: MediaQuerypage.screenHeight! / 12,
                        width: MediaQuerypage.screenWidth! / 2,
                        child: Center(
                            child: Text('Register',
                                style: TextStyle(
                                    color: Color(0XFF070C26),
                                    fontSize: 18,
                                    fontFamily: 'Roboto-Regular'))),
                        decoration: BoxDecoration(
                          color: AppColor().greay,
                          borderRadius: BorderRadius.circular(11.0),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        child: Center(
                            child: Text('Sign in',
                                style: TextStyle(
                                    color: Color(0XFF070C26),
                                    fontSize: 18,
                                    fontFamily: 'Roboto-Regular'))),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
