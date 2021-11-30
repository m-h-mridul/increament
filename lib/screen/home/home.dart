// ignore_for_file: prefer_const_constructors, invalid_use_of_protected_member, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:incrementapp/media.dart';
import 'package:incrementapp/screen/search/searchlist.dart';
import '../../Style.dart';
import 'component/bottomnavigationbar.dart';
import 'controller/Getmovise.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  static String name = "home";
  TextEditingController search = TextEditingController();
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
                fortopview(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    textInputAction: TextInputAction.search,
                    controller: search,
                     onEditingComplete:(){
                     Navigator.push(context,  MaterialPageRoute<void>(
                       builder: (BuildContext context)=> Searchlist(search.text.toString())));
                     } ,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search, color: Color(0xFF2F2626)),
                      filled: true,
                      fillColor: Color(0xFF2F2626),
                      labelText: "TV series ",
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
                popularseries(),
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
                // tranding
                treandingseries(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Featured Episode list', style: Style().h2style),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF707070),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                // all episodes list
                listofepisodes(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Bottomnavigationbar().bottomNavigationBar,
      ),
    );
  }

  GetBuilder<MoviseController> listofepisodes() {
    return GetBuilder<MoviseController>(
      builder: (mcontroller) => SizedBox(
        height: MediaQuerypage.screenHeight! / 5,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: mcontroller.allepisodeslist.length,
          itemBuilder: (BuildContext context, int index) => Card(
              child: Column(children: [
            Image.network(
              mcontroller.episodeslist[index].image.medium,
            ),
            Expanded(
              child: Text(mcontroller.episodeslist[index].name,
                  style: Style().logh2styleblack),
            ),
          ])),
        ),
      ),
    );
  }

  GetBuilder<MoviseController> treandingseries() {
    return GetBuilder<MoviseController>(
      builder: (mcontroller) => SizedBox(
        height: MediaQuerypage.screenHeight! / 2.5,
        child: SizedBox(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: ClampingScrollPhysics(),
            itemCount: mcontroller.ptvseries_list.length,
            itemBuilder: (BuildContext context, int index) => Card(
              child: Column(
                children: [
                  Image.network(
                    mcontroller.ptvseries_list[index].image.medium,
                    // width: MediaQuerypage.screenWidth! / 2,
                    // height: MediaQuerypage.screenHeight! / 5,
                  ),
                  Expanded(
                    child: Text(mcontroller.ptvseries_list[index].name,
                        style: Style().logh2styleblack),
                  ),
                  Text(
                    'Genere: ' +
                        mcontroller.ptvseries_list[index].genres[0].toString() +
                        ', ' +
                        mcontroller.ptvseries_list[index].genres[1].toString(),
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  GetBuilder<MoviseController> popularseries() {
    return GetBuilder<MoviseController>(
      init: MoviseController(), // INIT IT ONLY THE FIRST TIME
      builder: (mcontroller) => SizedBox(
        height: MediaQuerypage.screenHeight! / 5,
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: mcontroller.mdetailslength().length,
          itemBuilder: (BuildContext context, int index) => Card(
            child: Stack(
              children: [
                Image.network(
                  mcontroller.tvseries_list[index].image.medium,
                ),
                Positioned(
                  bottom: Style().rightposition,
                  child: Text('${mcontroller.tvseries_list[index].name}.',
                      style: Style().logh2style),
                ),
                Positioned(
                  right: Style().starposition,
                  bottom: Style().starbottomposition,
                  child: Image(
                    image: AssetImage('assets/star.png'),
                  ),
                ),
                Positioned(
                  right: Style().position,
                  bottom: Style().starbottomposition,
                  child: Text('7.8', style: Style().logh2style),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding fortopview() {
    return Padding(
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
    );
  }
}
