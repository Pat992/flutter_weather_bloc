part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();

  @override
  List<Object> get props => [];
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();

  @override
  List<Object> get props => [];
}

class WeatherLoaded extends WeatherState {
  final Weather _weather;
  const WeatherLoaded(this._weather);

  @override
  List<Weather> get props => [_weather];
}

class WeatherException extends WeatherState {
  final String _message;

  const WeatherException(this._message);

  @override
  List<String> get props => [_message];
}
