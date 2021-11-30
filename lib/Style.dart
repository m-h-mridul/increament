// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:incrementapp/AppColor.dart';
import 'package:incrementapp/media.dart';

// make responsive stack ui
double scaleX(originalx, originalwidth, currentwidth) {
  return (originalx * currentwidth / originalwidth);
}

double scaleY(originaly, originalheight, currentheight) {
  return (originaly * currentheight / originalheight);
}

class Style {
  TextStyle h1style = TextStyle(
      color: AppColor().incrementcolor, fontSize: 32, fontFamily: 'Monaco');
  TextStyle h2style = TextStyle(
      color: AppColor().white, fontSize: 24, fontFamily: 'Roboto-Regular');
  TextStyle logh2style =
      TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Roboto-Bold');
  TextStyle logh2styleblack = TextStyle(
      color: Color(0xFF1A1C27), fontSize: 18, fontFamily: 'Roboto-Bold');
  TextStyle logh2stylegreay = TextStyle(
      color: Color(0xFF707070), fontSize: 18, fontFamily: 'Roboto-Bold');
  // for stack positon
  var position = scaleX(
    MediaQuerypage.smallSizeWidth!*2,
    MediaQuerypage.screenWidth,
    MediaQuerypage.screenWidth! / 1.5,
  );
   var rightposition = scaleX(
    MediaQuerypage.smallSizeWidth!*9,
    MediaQuerypage.screenWidth,
    MediaQuerypage.screenWidth! / 1.5,
  );
  var starbottomposition = scaleX(
    MediaQuerypage.smallSizeWidth!*2,
    MediaQuerypage.screenWidth,
    MediaQuerypage.screenWidth! / 1.5,
  );
  var starposition=scaleX(
    MediaQuerypage.smallSizeWidth!*12,
    MediaQuerypage.screenWidth,
    MediaQuerypage.screenWidth! / 1.5,
  );
}
