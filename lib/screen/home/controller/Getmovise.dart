// ignore_for_file: file_names, invalid_use_of_protected_member, non_constant_identifier_names

import 'dart:convert';

import 'package:get/get.dart';
import 'package:incrementapp/screen/home/model/MoviseModel.dart';
import 'package:incrementapp/screen/home/service/api.dart';

class MoviseController extends GetxController {
  RxList<MoviseModel> m_list = RxList<MoviseModel>();
  //var m_list=<MoviseModel>[].obs;
  mdetailslength() => m_list.value;
  @override
  Future<void> onInit() async {
    Iterable l = json.decode(await Api().fetchmovises());
    m_list.value=List<MoviseModel>.from(l.map((model)=> MoviseModel.fromJson(model)));
    // m_list.value = (await Api().fetchmovises() as List).map((e) {
    //   return MoviseModel.fromJson(jsonDecode((e)));
    // }).toList();
    print("api buttom");
    print('get data from api is ' + m_list.value.length.toString());
    // movisedetails.bindStream(Api().populermoviseget());
    super.onInit();
  }
}
