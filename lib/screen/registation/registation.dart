// ignore_for_file: unnecessary_new, unused_local_variable, unnecessary_null_comparison, non_constant_identifier_names, avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:incrementapp/screen/home/home.dart';
import 'package:incrementapp/screen/registation/services/emailpasswordregistation.dart';
import '../../Style.dart';
import '../../media.dart';

class Registation extends StatelessWidget {
  Registation({Key? key}) : super(key: key);
  static String name = "Registation";
  // text field variable
  TextEditingController c_name = new TextEditingController();
  TextEditingController c_email = new TextEditingController();
  TextEditingController c_password = new TextEditingController();
  // controller

  @override
  Widget build(BuildContext context) {
    // button style
    final ButtonStyle style = ElevatedButton.styleFrom(
        primary: const Color(0xFF009688),
        textStyle: const TextStyle(fontSize: 20));
    // border radius
    const BorderRadius borderRadius = BorderRadius.all(
      Radius.circular(12),
    );
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // icon and name  of  the app
                  Text('Let’s sign you in.', style: Style().h1style),
                  Text('Registation', style: Style().h2style),
                  // textfield about the
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 12.0),
                    child: TextField(
                      controller: c_name,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: borderRadius,
                        ),
                        labelText: 'Name',
                        hintText: 'Enter your name',
                      ),
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0, bottom: 12.0),
                    child: TextField(
                      controller: c_email,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: borderRadius,
                        ),
                        labelText: 'Email',
                        hintText: 'Enter your email',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0, bottom: 12.0),
                    child: TextField(
                      controller: c_password,
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: borderRadius,
                        ),
                        labelText: 'Password',
                        hintText: 'Password length might be 6',
                        hintStyle: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuerypage.screenHeight! / 14,
                    width: MediaQuerypage.screenWidth!,
                    child: ElevatedButton(
                      style: style,
                      onPressed: () async {
                        print("registation working .....");
                        Emailpasswordregistation().Epregistation(
                            c_name.text.toString().trim(),
                            c_email.text.toString().trim(),
                            c_password.text.toString().trim());

                       // and goto into the app
                          Navigator.pushNamedAndRemoveUntil(context,
                              Home.name, (Route<dynamic> route) => false);
                      },
                      child: const Text('Registation'),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
