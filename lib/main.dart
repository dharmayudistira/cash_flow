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
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF0F1115),
          ),
          useMaterial3: true,
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontFamily: 'Decker',
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            headline2: TextStyle(
              fontFamily: 'Decker',
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            headline3: TextStyle(
              fontFamily: 'Decker',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            subtitle2: TextStyle(
              fontFamily: 'Decker',
              fontSize: 16,
              color: Colors.black87,
            ),
            bodyText1: TextStyle(
              fontFamily: 'Decker',
              fontSize: 14,
              color: Colors.black45,
            ),
          )),
    ),
  );
}
