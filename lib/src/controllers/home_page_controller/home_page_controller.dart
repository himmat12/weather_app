import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/src/controllers/base_controller.dart';
import 'package:weather_app/src/core/service_locators.dart';
import 'package:weather_app/src/core/storages/weather_storage.dart';
import 'package:weather_app/src/mixins/exceptions_controller_mixin.dart';
import 'package:weather_app/src/models/weather_model.dart';
import 'package:weather_app/src/services/repos/weather_repo.dart';

class HomePageController extends BaseController with ExceptionsControllerMixin {
  final weatherRepo = sl<WeatherRepo>();
  var weatherState = ViewState.idle.obs;
  var isSaved = false.obs;
  var weatherModel = WeatherModel().obs;

  Position? position;

  // get current position geo-coordinates
  Future<void> getInitialWeatherInfo() async {
    await exceptionsController(
      () async {
        weatherState.value = ViewState.busy;
        bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
        LocationPermission permission = await Geolocator.checkPermission();

        if (!serviceEnabled) {
          return Future.error("Location services are disabled.");
        }

        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            return Future.error("Location permissions are denied.");
          }
        }

        if (permission == LocationPermission.deniedForever) {
          return Future.error(
              'Location permissions are permanently denied, we cannot request permissions.');
        }

        position = await Geolocator.getCurrentPosition();

        weatherModel.value = WeatherModel.fromJson(await weatherRepo
            .fetchWeatherInfo("${position?.latitude},${position?.longitude}"));
        weatherState.value = ViewState.retrived;
      },
    );
  }

  // fetch weather api data
  Future<void> fetchWeatherInfo(String query) async {
    await exceptionsController(
      () async {
        await WeatherStorage.cacheLocation(query);
        isSaved.value = true;
        weatherState.value = ViewState.busy;
        weatherModel.value =
            WeatherModel.fromJson(await weatherRepo.fetchWeatherInfo(query));
        weatherState.value = ViewState.retrived;
      },
      badRequestExceptionHandler: (data) {
        weatherModel.value = WeatherModel();
        weatherState.value = ViewState.retrived;
      },
      networkExceptionsHandler: (data) {
        weatherModel.value = WeatherModel();
        weatherState.value = ViewState.retrived;
      },
      serverExceptionsHandler: (data) {
        weatherModel.value = WeatherModel();
        weatherState.value = ViewState.retrived;
      },
      timeoutExceptionHandler: (data) {
        weatherModel.value = WeatherModel();
        weatherState.value = ViewState.retrived;
      },
      unknownExceptionHandler: (data) {
        weatherModel.value = WeatherModel();
        weatherState.value = ViewState.retrived;
      },
    );
  }
}
