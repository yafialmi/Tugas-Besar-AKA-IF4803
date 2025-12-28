import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manajemen_gudang/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Manajemen Barang Gudang",
      theme: _buildTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initialRoute,
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
