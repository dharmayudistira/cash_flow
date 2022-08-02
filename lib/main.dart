import 'app/data/local_storage/auth_pref.dart';
import 'themes_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemesApp.lightMode,
      darkTheme: ThemesApp.darkMode,
      themeMode: (AuthPref().getDarkModeState()) ? ThemeMode.dark : ThemeMode.light,
    ),
  );
}
