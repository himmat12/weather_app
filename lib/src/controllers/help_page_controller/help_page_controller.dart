import 'package:get/get.dart';
import 'package:weather_app/src/configs/routes/routes_const.dart';
import 'package:weather_app/src/controllers/base_controller.dart';

class HelpPageController extends BaseController {
  @override
  void onInit() {
    splashAndNavigate();
    super.onInit();
  }

  /// skip btn state
  void skipSplash() {
    Get.offNamed(RoutesName.homePage);
  }

  /// splash screen state
  Future<void> splashAndNavigate() async {
    await Future.delayed(const Duration(seconds: 5));
    Get.offNamed(RoutesName.homePage);
  }
}
