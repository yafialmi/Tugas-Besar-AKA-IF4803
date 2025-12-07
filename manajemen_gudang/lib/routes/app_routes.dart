import 'package:get/get.dart';
import 'package:manajemen_gudang/pages/splashscreen/splashscreen_page.dart';

class AppPages {
  AppPages._();
  static const String initialRoute = '/splashscreen';
  static final routes = [
    GetPage(name: 'splashscreen', page: () => const SplashScreenPage()),
  ];
}
