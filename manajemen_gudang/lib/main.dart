import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manajemen_gudang/routes/app_routes.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Manajemen Barang Gudang",
      theme: _buildTheme(),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
    );
  }
}

ThemeData _buildTheme() {
  var baseTheme = ThemeData(brightness: Brightness.light);

  return baseTheme.copyWith(
    textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
  );
}