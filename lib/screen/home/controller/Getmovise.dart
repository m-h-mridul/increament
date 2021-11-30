// ignore_for_file: file_names, invalid_use_of_protected_member, non_constant_identifier_names, unused_local_variable, avoid_print

import 'dart:convert';
import 'package:get/get.dart';
import 'package:incrementapp/screen/home/model/MoviseModel.dart';
import 'package:incrementapp/screen/home/model/PTvseries.dart';
import 'package:incrementapp/screen/home/model/episoodeslistmodel.dart';
import 'package:incrementapp/screen/home/service/api.dart';

class MoviseController extends GetxController {
  List<String> seriesname = [
    'The Wheel of Time',
    'Arcane',
    'Hawkeye',
    'Cowboy Bebop',
    'Yellowstone',
    'Hellbound',
    'Succession',
    'The Beatles: Get Back'
  ];
  RxList<TvseriesModel> tvseries_list = RxList<TvseriesModel>();
  List<TvseriesModel> mdetailslength() => tvseries_list.value;
  //
  RxList<PtvseriesModel> ptvseries_list = RxList<PtvseriesModel>();
  List<PtvseriesModel> ptvseries_length() => ptvseries_list.value;
  // all episodes
  RxList<EpisodeslistModel> episodeslist = RxList<EpisodeslistModel>();
  List<EpisodeslistModel> get allepisodeslist => episodeslist.value;

  //  working on instance creat
  @override
  Future<void> onInit() async {
    for (int i = 1; i < 11; i++) {
      tvseries_list.value.add(TvseriesModel.fromJson(
          jsonDecode(await Api().fetchmovises(i.toString()))));
      update();
    }
    print("api buttom");
    print('get data from api is ' + tvseries_list.value.length.toString());
    //
    for (var e in seriesname) {
      ptvseries_list.value.add(PtvseriesModel.fromJson(
          jsonDecode(await Api().popularseries(e.toString()))));
      update();
    }
    print('popular tv series');
    Iterable l = json.decode(await Api().allepiso());
    // List<Post> posts = List<Post>.from(l.map((model)=> Post.fromJson(model)));
    episodeslist.value = List<EpisodeslistModel>.from(l.map((e) => EpisodeslistModel.fromJson(e)));
    update();
    print('all episodes tv series');
    super.onInit();
  }
}
