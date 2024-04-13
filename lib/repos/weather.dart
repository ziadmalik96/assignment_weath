
import 'package:assignment_weath/constant/app_keys.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'location.dart';
import 'networking.dart';


class WeatherModelRepo {
  LocationPermission? permission;
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
      '${AppSecretKeys.openWeatherMapURL}?'
          'q=$cityName&'
          'appid=${AppSecretKeys.apiKey}&'
          'units=metric'
    );
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCurrentLocationWeather() async {
    LocationRepository location = LocationRepository();
    try {
      await location.getCurrentLocation();
    } catch(e)  {
      debugPrint(e.toString());
    }

    var weatherData;
    weatherData = getWeatherUsingLocation(location);
    return weatherData;
  }

  Future<dynamic> getLastLocationWeather() async {
    LocationRepository location = LocationRepository();
    try {
      await location.getLastKnownLocation();
    } catch (e) {
      debugPrint(e.toString());
    }

    var weatherData;
    weatherData = getWeatherUsingLocation(location);
    return weatherData;
  }

  Future<dynamic> getWeatherUsingLocation(LocationRepository location) async {
    NetworkHelper networkHelper = NetworkHelper(
        '${AppSecretKeys.openWeatherMapURL}?'
            'lat=${location.latitude}&'
            'lon=${location.longitude}&'
            'appid=${AppSecretKeys.apiKey}&'
            'units=metric'
    );

    var weatherData;

    try {
      weatherData = await networkHelper.getData();
    } catch(e)  {
      debugPrint(e.toString());
    }

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp, String cityName) {
    if (temp > 25) {
      return 'It\'s 🍦 time in $cityName';
    } else if (temp > 20) {
      return 'Time for shorts and 👕 in $cityName';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤 in $cityName';
    } else {
      return 'Bring a 🧥 just in case in $cityName';
    }
  }
}
