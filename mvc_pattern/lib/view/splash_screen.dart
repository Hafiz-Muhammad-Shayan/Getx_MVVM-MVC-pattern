import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_pattern/res/assets/image_assets.dart';
import 'package:mvc_pattern/res/colors/app_color.dart';
import 'package:mvc_pattern/res/components/general_exception.dart';
import 'package:mvc_pattern/res/components/internet_exception_widget.dart';
import 'package:mvc_pattern/res/components/round_button.dart';
import 'package:mvc_pattern/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
            child: Text("email_hint".tr,)),
      ),

      body: Column(
        children: [
          RoundButton(
            title: "Login",
            onPress: () {  },
            width:  double.infinity,
            height: 60,

          ),
          RoundButton(
            title: "Signup",
            onPress: () {  },
            width:  120,
            height: 60,
            buttonColor: AppColor.secondaryButtonColor,

          ),
        ],
      ),




    );
  }
}
