import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_pattern/res/assets/image_assets.dart';
import 'package:mvc_pattern/res/colors/app_color.dart';
import 'package:mvc_pattern/res/components/general_exception.dart';
import 'package:mvc_pattern/res/components/internet_exception_widget.dart';
import 'package:mvc_pattern/res/components/round_button.dart';
import 'package:mvc_pattern/utils/utils.dart';
import 'package:mvc_pattern/view_models/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.islogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,

      body: Center(
          child: Text(
              "welcome_back".tr,
            textAlign: TextAlign.center,
          ),
      ),



    );
  }
}
