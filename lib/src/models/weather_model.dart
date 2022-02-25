import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  WeatherModel({
    this.location,
    this.current,
  });
  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  final Location? location;
  final Current? current;
}

@JsonSerializable()
class Current {
  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
  });
  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  final int? lastUpdatedEpoch;
  final String? lastUpdated;
  final double? tempC;
  final double? tempF;
  final int? isDay;
  final Condition? condition;
  final int? windMph;
  final double? windKph;
  final int? windDegree;
  final String? windDir;
  final int? pressureMb;
  final double? pressureIn;
  final int? precipMm;
  final int? precipIn;
  final int? humidity;
  final int? cloud;
  final double? feelslikeC;
  final double? feelslikeF;
  final int? visKm;
  final int? visMiles;
  final int? uv;
  final double? gustMph;
  final double? gustKph;
}

@JsonSerializable()
class Condition {
  Condition({
    this.text,
    this.icon,
    this.code,
  });
  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  final String? text;
  final String? icon;
  final int? code;
}

@JsonSerializable()
class Location {
  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  final String? name;
  final String? region;
  final String? country;
  final double? lat;
  final double? lon;
  final String? tzId;
  final int? localtimeEpoch;
  final String? localtime;
}
