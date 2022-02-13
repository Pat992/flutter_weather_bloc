part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

class WeatherLoaded extends WeatherState {
  final Weather _weather;
  const WeatherLoaded(this._weather);

  // EQUATABLE PACKAGE
  Weather get weather => _weather;

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
  String get message => _message;
}
