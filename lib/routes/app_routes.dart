import 'package:flutter/material.dart';
import '../core/app_export.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/details_page_screen/details_page_screen.dart';
import '../presentation/loading_page_screen/loading_page_screen.dart';
import '../presentation/log_in_page_screen/log_in_page_screen.dart';
import '../presentation/main_page_screen/main_page_screen.dart';
import '../presentation/sign_up_page_screen/sign_up_page_screen.dart';

class AppRoutes {
  static const String loadingPageScreen = '/loading_page_screen';

  static const String signUpPageScreen = '/sign_up_page_screen';

  static const String logInPageScreen = '/log_in_page_screen';

  static const String mainPageScreen = '/main_page_screen';

  static const String detailsPageScreen = '/details_page_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        loadingPageScreen: LoadingPageScreen.builder,
        signUpPageScreen: SignUpPageScreen.builder,
        logInPageScreen: LogInPageScreen.builder,
        mainPageScreen: MainPageScreen.builder,
        detailsPageScreen: DetailsPageScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: LoadingPageScreen.builder
      };
}
