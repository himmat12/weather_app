import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              "We show weather for you ",
              style: TextStyle(
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              width: Get.width,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Skip"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
