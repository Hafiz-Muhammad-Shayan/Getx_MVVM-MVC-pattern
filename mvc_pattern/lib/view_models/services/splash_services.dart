
import 'dart:async';

import 'package:get/get.dart';
import 'package:mvc_pattern/res/routes/routes_name.dart';

class SplashServices {

  void islogin (){

    Timer(
        const Duration(seconds: 3),
        () => Get.toNamed(RoutesName.loginView),);
  }
}