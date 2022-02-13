import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/model/weather.dart';
import '../data/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherBloc(this._weatherRepository) : super(const WeatherInitial()) {
    // BLOC uses a stream, CUBIT uses them as well but hides it
    on<GetWeather>((event, emit) async {
      // emit loading-state
      emit(const WeatherLoading());
      try {
        // fetch weather from repo -> City Name is given via event
        final Weather weather =
            await _weatherRepository.fetchWeather(event._cityName);
        // emit loaded-state
        emit(WeatherLoaded(weather));
      } catch (e) {
        // emit error-state
        emit(const WeatherException('Failed to get weather from API'));
      }
    });
  }
}
