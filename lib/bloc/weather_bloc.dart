import 'package:bloc/bloc.dart';
import 'package:bloc_cubit_weather_app/data/weather_repository.dart';
import 'package:meta/meta.dart';

import '../data/model/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      if (event is GetWeather) {
        try {
          emit(WeatherLoading());
          final Weather weather =
              await weatherRepository.fetchWeather(event.cityName);
          emit(WeatherLoaded(weather: weather));
        } on NetworkException {
          emit(WeatherError('An error occured'));
        }
      }
    });
  }
}
