import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/src/configs/routes/routes_const.dart';
import 'package:weather_app/src/controllers/help_page_controller/help_page_controller.dart';

class HelpPage extends GetView<HelpPageController> {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      initState: (_) {
        controller.splashAndNavigate();
      },
      builder: (_) {
        return Scaffold(
          body: Container(
            key: const Key('asset_image'),
            height: Get.height,
            width: Get.width,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/weather_frame.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "We show weather for you",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  width: Get.width,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offNamed(RoutesName.homePage);
                    },
                    child: const Text("Skip"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
