import 'package:get_storage/get_storage.dart';

final weatherStorage = GetStorage('weather_storage');

class WeatherStorage {
  static void cacheLocation(String value) =>
      weatherStorage.write('location', value);

  static String get location => weatherStorage.read('location');
}
