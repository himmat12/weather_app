import 'package:get/get.dart';
import 'package:weather_app/src/configs/routes/routes_const.dart';
import 'package:weather_app/src/views/help_page/help_page.dart';
import 'package:weather_app/src/views/home_page/home_page.dart';

class Routes {
  static List<GetPage> getPages() {
    return [
      GetPage(name: RoutesName.helpPage, page: () => HelpPage()),
      GetPage(name: RoutesName.homePage, page: () => const HomePage()),
    ];
  }
}
