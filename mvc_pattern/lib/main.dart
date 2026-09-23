import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_pattern/res/getx_localization/languages.dart';
import 'package:mvc_pattern/res/routes/routes.dart';
import 'package:mvc_pattern/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      translations:  Languages(),
      locale: Locale("ur" , "PK"),
      fallbackLocale: Locale("en" , "US"),
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashScreen(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}

