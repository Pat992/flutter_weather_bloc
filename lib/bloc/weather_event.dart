part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class GetWeather extends WeatherEvent {
  final String _cityName;

  const GetWeather(this._cityName);

  @override
  List<Object?> get props => [];
}
