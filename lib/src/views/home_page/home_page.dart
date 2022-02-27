import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:weather_app/src/configs/routes/routes_const.dart';
import 'package:weather_app/src/configs/spacing.dart';
import 'package:weather_app/src/controllers/base_controller.dart';
import 'package:weather_app/src/controllers/home_page_controller/home_page_controller.dart';
import 'package:weather_app/src/core/storages/weather_storage.dart';
import 'package:weather_app/src/views/home_page/components/weather_info_widget.dart';

class HomePage extends GetView<HomePageController> {
  HomePage({Key? key}) : super(key: key);
  final textController =
      TextEditingController(text: weatherStorage.read('location'));

  final textFieldDebouncer =
      Debouncer(delay: const Duration(milliseconds: 500));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.offNamed(RoutesName.helpPage);
            },
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      body: GetBuilder(
          id: 'home_page',
          init: controller,
          initState: (_) {
            if (weatherStorage.read('location') == null) {
              controller.getInitialWeatherInfo();
            } else {
              controller.fetchWeatherInfo(weatherStorage.read('location'));
            }
          },
          builder: (context) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: textController,
                    onChanged: (value) {
                      // TODO: implementations..
                      textFieldDebouncer.call(() {
                        controller.fetchWeatherInfo(value);
                      });
                    },
                    decoration: const InputDecoration(
                        hintText: "place or, geo-coordinates"),
                  ),
                  Spacing.sizedBoxH_08(),
                  SizedBox(
                    width: Get.width,
                    child: ElevatedButton(
                      onPressed: () {
                        if (textController.text.isNotEmpty) {
                          controller.fetchWeatherInfo(textController.text);
                        }
                      },
                      child: Obx(
                        () => Text(controller.isSaved.value == true
                            ? "Update"
                            : "Save"),
                      ),
                    ),
                  ),
                  Spacing.sizedBoxH_40(),

                  // weather info
                  Obx(
                    () => controller.weatherState.value == ViewState.busy
                        ? const Center(child: CircularProgressIndicator())
                        : WeatherInfoWdiget(
                            key: const Key('weather_info'),
                            imgUrl: controller.weatherModel.value.current
                                    ?.condition?.icon ??
                                "",
                            tempC:
                                controller.weatherModel.value.current?.tempC ??
                                    0,
                            tempText: controller.weatherModel.value.current
                                    ?.condition?.text ??
                                "--"),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
