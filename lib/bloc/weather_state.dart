part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;
  WeatherLoaded({
    required this.weather,
  });

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;

  //   return other is WeatherLoaded && other.weather == weather;
  // }

  // @override
  // int get hashCode => weather.hashCode;
}

class WeatherError extends WeatherState {
  final String messageError;

  WeatherError(this.messageError);

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;

  //   return other is WeatherError && other.messageError == messageError;
  // }

  // @override
  // int get hashCode => messageError.hashCode;
}
