
import 'dart:async';

import 'package:get/get.dart';
import 'package:mvc_pattern/res/routes/routes_name.dart';
import 'package:mvc_pattern/view_models/controller/user_preference/user_preference_view_model.dart';

class SplashServices {

  void islogin (){

    UserPreference userPreference = UserPreference() ;

    userPreference.getUser().then((value){

      print(value.token) ;
      print(value.isLogin) ;
      if (value.isLogin == false || value.isLogin.toString() == "null"){
        Timer(
          const Duration(seconds: 3),
              () => Get.toNamed(RouteName.loginView),);
      }else{
        Timer(
          const Duration(seconds: 3),
              () => Get.toNamed(RouteName.homeView),);
      }

    }) ;

  }
}