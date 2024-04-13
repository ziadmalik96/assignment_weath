import 'package:assignment_weath/repos/weather.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationRepository {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position? position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getLastKnownLocation() async {
    try {
      Position? position = await Geolocator.getLastKnownPosition();
      latitude = position!.latitude;
      longitude = position.longitude;
      WeatherModelRepo().getCityWeather('Lahore');
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
