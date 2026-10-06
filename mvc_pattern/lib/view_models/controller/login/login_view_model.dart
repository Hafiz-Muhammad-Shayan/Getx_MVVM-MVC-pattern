
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mvc_pattern/models/login/user_model.dart';
import 'package:mvc_pattern/repository/login_repository/login_repository.dart';
import 'package:mvc_pattern/res/routes/routes_name.dart';
import 'package:mvc_pattern/utils/utils.dart';
import 'package:mvc_pattern/view_models/controller/user_preference/user_preference_view_model.dart';

class LoginViewModel extends GetxController{

  final _api = LoginRepository() ;

  UserPreference userPreference = UserPreference() ;

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;


  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs ;

  void loginApi (){
    loading.value = true ;
    Map data = {
      "email": emailController.value.text,
      "password": passwordController.value.text ,
    } ;

    _api.loginApi(data).then((value) {
      loading.value = false ;
      if (value["error"] == "user not found") {
        Utils.snackBar("Login", value["error"]) ;
      }

      else {

        UserModel userModel = UserModel(
          token: value["token"],
          isLogin: true,
        ) ;

        userPreference.saveUser(userModel).then((value){
          Get.toNamed(RouteName.homeView) ;
        }).onError(((error, stackTrace) {

        }));

        Utils.snackBar("Login", "Login Successfully") ;
      }

    },).onError((error, stackTrace) {
      // print(error.toString(),) ;
      loading.value = false ;
      Utils.snackBar("Error", error.toString(),);

    },);
  }

}