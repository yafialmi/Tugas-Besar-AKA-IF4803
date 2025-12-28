import 'package:get/get.dart';
import 'package:manajemen_gudang/pages/create/create_page.dart';
import 'package:manajemen_gudang/pages/dashboard/dashboard_page.dart';
import 'package:manajemen_gudang/pages/splashscreen/splashscreen_page.dart';

class AppPages {
  AppPages._();
  static const String initialRoute = '/dashboard';
  static final routes = [
    GetPage(name: '/splashscreen', page: () => const SplashScreenView()),
    GetPage(name: '/dashboard', page: () => const DashboardView()),
    GetPage(name: '/create', page: () => const CreateView())
  ];
}
