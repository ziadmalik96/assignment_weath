import 'package:assignment_weath/constant/app_routing.dart';
import 'package:assignment_weath/constant/constant_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constant/app_binding.dart';

void main() {
  AppBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppText.title,
      initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: Routes.splash,
      getPages: Routes.pages,
      unknownRoute: Routes.unknownRoute,
    );
  }
}
