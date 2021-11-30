// ignore_for_file: file_names

import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginController extends GetxController {
  RxBool password = true.obs;
  bool get sspassword => password.value;

  chenagetheview() {
    if (sspassword == false) {
      password.value = true;
    } else {
      password.value = false;
    }
  }
}
