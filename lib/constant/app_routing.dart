import 'package:assignment_weath/views/city_screen.dart';
import 'package:assignment_weath/views/loading_screen.dart';
import 'package:assignment_weath/views/location_screen.dart';
import 'package:get/get.dart';
import '../unknown_route.dart';

class Routes {
  static const unknown = '/unknown';
  static const splash = '/splash';
  static const locationView = '/locationView';
  static const selectCity = '/city';

  static final List<GetPage> pages = [
    GetPage(name: splash, page: () => const LoadingView()),
    GetPage(name: locationView, page: () => const LocationScreen()),
    GetPage(name: selectCity, page: () => const CityScreen()),
  ];

  static GetPageRoute get unknownPageRoute =>
      GetPageRoute(
        page: () => const UnknownRoute(),
      );

  static GetPage get unknownRoute =>
      GetPage(
        name: unknown,
        page: () => const UnknownRoute(),
      );


}