import 'package:bloc/bloc.dart';
import 'package:flutter_weather_bloc/data/model/weather.dart';
import 'package:flutter_weather_bloc/data/weather_repository.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherCubit(this._weatherRepository) : super(const WeatherInitial());

  Future<void> getWeather(String cityName) async {
    // emit loading-state
    emit(const WeatherLoading());
    try {
      // fetch weather from repo
      final Weather weather = await _weatherRepository.fetchWeather(cityName);
      // emit loaded-state
      emit(WeatherLoaded(weather));
    } catch (e) {
      // emit error-state
      emit(const WeatherException('Failed to get weather from API'));
    }
  }
}
