// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:incrementapp/AppColor.dart';
import 'package:incrementapp/media.dart';
import 'package:incrementapp/screen/home/service/api.dart';
import '../../Style.dart';
import 'component/bottomnavigationbar.dart';
import 'controller/Getmovise.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static String name = "home";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'INCREMENTS INC.',
                        style: Style().h1style,
                      ),
                      Container(
                        width: MediaQuerypage.screenWidth! / 6,
                        height: MediaQuerypage.screenHeight! / 12,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Color(0xFF272932),
                            image: DecorationImage(
                                image: AssetImage('assets/notification.png'))),
                      ),
                    ],
                  ),
                ),
                GetBuilder<MoviseController>(
                  init: MoviseController(), // INIT IT ONLY THE FIRST TIME
                  builder: (mcontroller) => SizedBox(
                    height: MediaQuerypage.screenHeight! / 5,
                    child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: mcontroller.m_list.length,
                      itemBuilder: (BuildContext context, int index) => Card(
                        child: Stack(
                          children: [
                            const Image(
                              // width: MediaQuerypage.screenWidth!/1.5,
                              // height: MediaQuerypage.screenHeight! / 6,
                              image: AssetImage('assets/p1.png'),
                            ),
                            Positioned(
                              bottom: Style().position,
                              child: Text('   mcontroller.',
                                  style: Style().logh2style),
                            ),
                            Positioned(
                              right: Style().starposition,
                              bottom: Style().position,
                              child: Image(
                                image: AssetImage('assets/star.png'),
                              ),
                            ),
                            Positioned(
                              right: Style().position,
                              bottom: Style().position,
                              child: Text('7.8', style: Style().logh2style),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Trending Now', style: Style().h2style),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF707070),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuerypage.screenHeight! / 4,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: ClampingScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) => Card(
                      child: Column(
                        children: [
                          Image(
                            //color: AppColor().background,
                            width: MediaQuerypage.screenWidth! / 4,
                            height: MediaQuerypage.screenHeight! / 6,
                            image: AssetImage('assets/p2.png'),
                          ),
                          Text('Movise name', style: Style().logh2styleblack),
                          Text('genere', style: Style().logh2styleblack),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Featured Movie', style: Style().h2style),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF707070),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuerypage.screenHeight! / 4,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) => Card(
                      child: Center(
                          child: Text(
                        'Dummy Card Text',
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Bottomnavigationbar().bottomNavigationBar,
      ),
    );
  }
}
