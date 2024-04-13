import 'package:assignment_weath/controller/location_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../controller/weather_controller.dart';
///Initialize our app services that it needs at startup.
///use this class as the 'initialBinding property of GetMaterialApp,
class AppBinding extends Bindings {

  @override
  void dependencies() async {
    if (!kIsWeb) {}
    Get.put<LocationController>(LocationController());
    Get.put<WeatherController>(WeatherController());
  }
}