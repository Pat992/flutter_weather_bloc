import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_bloc/bloc/weather_bloc.dart';
import 'package:flutter_weather_bloc/cubit/weather_cubit.dart';
import 'package:flutter_weather_bloc/data/weather_repository.dart';
import 'package:flutter_weather_bloc/pages/weather_search_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather BLOC',
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => WeatherCubit(FakeWeatherRepository()),
          ),
          BlocProvider(
            create: (context) => WeatherBloc(FakeWeatherRepository()),
          ),
        ],
        child: const WeatherSearchPage(),
      ),
    );
  }
}
