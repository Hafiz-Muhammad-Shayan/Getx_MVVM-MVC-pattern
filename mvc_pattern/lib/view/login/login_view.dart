
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_pattern/res/components/round_button.dart';
import 'package:mvc_pattern/utils/utils.dart';
import 'package:mvc_pattern/view_models/controller/login/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginVM = Get.put(LoginViewModel());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: Center(
            child: Text(
              "login".tr,
              style: TextStyle(
                color: Colors.white ,
              ),
            )),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
//new code
            Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: loginVM.emailController.value,
                    focusNode: loginVM.emailFocusNode.value,
                    validator: (value) {
                      if (value!.isEmpty){
                        Utils.snackBar("Email", "Enter email");
                      }
                    },
                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(context, loginVM.emailFocusNode.value,loginVM.passwordFocusNode.value, );
                    },
                    decoration: InputDecoration(
                      hintText: "email_hint".tr,
                      border: OutlineInputBorder(

                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  TextFormField(
                    controller: loginVM.passwordController.value,
                    focusNode: loginVM.passwordFocusNode.value,
                    obscureText: true,
                    obscuringCharacter: "*",
                    validator: (value) {
                      if (value!.isEmpty){
                        Utils.snackBar("Password", "Enter Password");
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "password_hint".tr,
                      border: OutlineInputBorder(

                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 40,
            ),
            Obx(() {
              return RoundButton(
                title: "login".tr,
                loading: loginVM.loading.value,
                onPress: (){
                  if (_formkey.currentState!.validate()){
                    loginVM.loginApi() ;
                  }
                },
                width: 200,
              );
            }, ),
          ],
        ),
      ),

    );
  }
}
