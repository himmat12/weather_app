import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_app/src/controllers/base_controller.dart';
import 'package:weather_app/src/controllers/home_page_controller/home_page_controller.dart';
import 'package:weather_app/src/core/service_locators.dart';
import 'package:weather_app/src/core/storages/weather_storage.dart';

void main() async {
  HomePageController? controller;
  slSetUp();
  await GetStorage.init('weather_storage');

  setUp(
    () {
      Get.testMode = true;
      controller = Get.put(HomePageController());
    },
  );

  tearDown(
    () {
      Get.reset();
    },
  );
  // test("getInitialWeatherInfo() test", () async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   await controller?.getInitialWeatherInfo();
  //   expect(controller?.position != null, true);
  //   expect(controller?.weatherModel.value != null, true);
  // });

  test("fetchWeatherInfo() test", () async {
    expect(weatherStorage.read('location') != null, true);
    await controller?.fetchWeatherInfo("dharan");
    expect(weatherStorage.read('location'), "dharan");
    expect(controller?.weatherModel.value != null, true);
    expect(controller?.weatherState.value, ViewState.retrived);
  });
}
