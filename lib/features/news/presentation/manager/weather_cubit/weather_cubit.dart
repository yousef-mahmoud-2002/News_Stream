import 'package:flutter_bloc/flutter_bloc.dart';

import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherLoading());

  void getWeather({required String cityName}) {}
}
