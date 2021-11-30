// ignore_for_file: prefer_const_constructors, unused_local_variable, must_be_immutable, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:incrementapp/AppColor.dart';
import 'package:incrementapp/Style.dart';
import 'package:incrementapp/media.dart';
import 'package:incrementapp/screen/home/home.dart';
import 'package:incrementapp/screen/login/Controller.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:incrementapp/screen/login/services/EmailPassword.dart';
import 'package:incrementapp/screen/login/services/facebook.dart';
import 'package:incrementapp/screen/login/services/googlogin.dart';
import 'package:incrementapp/screen/registation/registation.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  static String name = 'Login';
  // variable declear
  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController passwordtextEditingController = TextEditingController();
  // getx
  LoginController loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor().background,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Let’s sign you in.', style: Style().h1style),
                Text('Welcome back.\nYou’ve been missed!',
                    style: Style().h2style),
                // Text editor for email & password
                Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: emailtextEditingController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF2F2626),
                      labelText: "Phone, Email or username",
                      labelStyle: Style().logh2stylegreay,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                //
                // // Text editor for password
                //
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 40.0),
                  child: Obx(
                    () => TextFormField(
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      controller: passwordtextEditingController,
                      obscureText: loginController.sspassword,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            loginController.sspassword == true
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Color(0xFF707070),
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            loginController.chenagetheview();
                            print("ans " + loginController.sspassword.toString());
                          },
                        ),
                        filled: true,
                        fillColor: Color(0xFF2F2626),
                        labelStyle: Style().logh2stylegreay,
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(),
                        ),
                        //fillColor: Colors.green
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),
                //
                // forget passsword buttom
                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forget password? ',
                      style: Style().logh2stylegreay,
                    ),
                    Text(
                      ' Reset',
                      style: Style().logh2style,
                    )
                  ],
                ),
                //
                // create account buttom
                //
                Padding(
                  padding: const EdgeInsets.only(top: 80.0, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account? ',
                        style: Style().logh2stylegreay,
                      ),
                      InkWell(
                        onTap:(){
                        Navigator.pushNamed(context, Registation.name);
                        },
                        child: Text(
                          ' Register',
                          style: Style().logh2style,
                        ),
                      )
                    ],
                  ),
                ),
                //
                // button item and some other buttom
                //
                InkWell(
                  onTap: () {
                      // SpinKitRotatingCircle(
                      //   color: Colors.white,
                      //   size: 50.0,
                      // );
                      Emailpassword().login(emailtextEditingController.text.toString().trim(),
                       passwordtextEditingController.text.toString().trim());
                      Navigator.pushNamedAndRemoveUntil(context,
                              Home.name, (Route<dynamic> route) => false);
                  },
                  child: Container(
                    width: MediaQuerypage.screenWidth,
                    height: MediaQuerypage.screenHeight! / 14,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Center(
                      child: Text(
                        'Sign in',
                        style: Style().logh2styleblack,
                      ),
                    ),
                  ),
                ),
                //
                // facebook buttom
                InkWell(
                  onTap:(){
                    signInWithFacebook();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Container(
                      width: MediaQuerypage.screenWidth,
                      height: MediaQuerypage.screenHeight! / 14,
                      decoration: BoxDecoration(
                        color: Color(0xFF1E4E87),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Center(
                        child: Text(
                          'Facebook',
                          style: Style().logh2style,
                        ),
                      ),
                    ),
                  ),
                ),
                //
                // google buttom
                InkWell(
                  onTap:(){
                    GoogleLogin().signInWithGoogle();
                  },
                  child: Container(
                    width: MediaQuerypage.screenWidth,
                    height: MediaQuerypage.screenHeight! / 14,
                    decoration: BoxDecoration(
                      color: Color(0xFF18A82E),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Center(
                      child: Text(
                        'Google',
                        style: Style().logh2style,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
