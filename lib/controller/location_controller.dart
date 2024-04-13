import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../constant/app_routing.dart';
import '../repos/weather.dart';

class LocationController extends GetxController {
  LocationPermission? permission;
  RxBool perm = false.obs;

  dynamic weatherData;

  geoLocationData() async {
    perm.value = await Geolocator.isLocationServiceEnabled();
    if (!perm.value) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    weatherData = await WeatherModelRepo().getLastLocationWeather();

    Get.offNamed(Routes.locationView);
  }
}
