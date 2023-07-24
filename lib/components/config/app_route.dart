// ignore_for_file: unused_import

import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../features/auth/presentation/login/login_screen.dart';
import '../../features/auth/presentation/register/register_screen.dart';
import '../../features/detail/binding/detail_binding.dart';
import '../../features/dummy/binding/dummy_binding.dart';
import '../../features/barnavigation/presentation/dummy_barnavigation.dart';
import '../../features/detail/presentation/detail_screen.dart';
import '../../features/dummy/presentation/dummy_screen.dart';
import '../../features/splash/presentation/splash_screen.dart';
import '../../main.dart';

class AppRoute {
  static const String defaultRoute = '/';
  static const String notFound = '/notFound';
  static const String registerScreen = '/registerScreen';
  static const String loginScreen = '/loginScreen';
  static const String dummy = '/dummy';
  static const String barnavigation = '/barnavigation';
  static const String detail = '/detail';
  static List<GetPage> pages = [
    GetPage(
        name: defaultRoute,
        page: () => const SplashScreen(),
        transitionDuration: const Duration(seconds: 5)),
    GetPage(name: dummy, page: () => DummyScreen(), binding: DummyBinding()),
    GetPage(name: detail, page: () => DetailScreen(), binding: DetailBinding()),
  ];
}
