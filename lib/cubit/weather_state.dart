part of 'weather_cubit.dart';

@immutable
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

  // EQUATABLE PACKAGE
  @override
  List<Weather> get props => [_weather];

  // // NOT NEEDED THANKS TO EQUATABLE PACKAGE
  // // Override equality
  // // needs to be done, else do-states will not be working
  // @override
  // bool operator ==(Object o) {
  //   if (identical(this, o)) return true;
  //
  //   return o is WeatherLoaded && o._weather == _weather;
  // }
  //
  // // override hashCode
  // @override
  // int get hashCode => _weather.hashCode;
}

class WeatherException extends WeatherState {
  final String _message;
  const WeatherException(this._message);

  // EQUATABLE PACKAGE
  @override
  List<String> get props => [_message];
}
