
import 'package:get/route_manager.dart';
import 'package:mvc_pattern/res/routes/routes_name.dart';
import 'package:mvc_pattern/view/login/login_view.dart';
import 'package:mvc_pattern/view/splash_screen.dart';

class AppRoutes {

  static appRoutes () => [
    GetPage(
        name: RoutesName.splashScreen,
        page: () => SplashScreen(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade ,
    ),

    GetPage(
      name: RoutesName.loginView,
      page: () => LoginView(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
  ];
}