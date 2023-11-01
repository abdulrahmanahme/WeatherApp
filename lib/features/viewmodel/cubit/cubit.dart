

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/viewmodel/cubit/states.dart';
import '../../../common/app_const.dart';
import '../../../core/network/weather_remote_data_source.dart';
import '../../model/weather_country.dart';
import '../../model/weather_model.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(InitialState());
  static WeatherCubit get(context) => BlocProvider.of(context);
  WeatherModel? weatherModel;
  WeatherCutrrey? weatherCountry;

  Future getWeather() async {
    emit(LoadingWeatherState());

    await RemoteDataSource.getData(
            url:'/onecall?lat=${APPConst.lat}&lon=${APPConst.long}&appid=${APPConst.key}')
        .then((value) {
      var data = WeatherModel.fromJson(value.data);
      weatherModel = data;

      emit(SuccessWeatherState());
    }).catchError((e) {
      emit(ErrorWeatherState(error: e.toString()));
    });
  }

   Future getWeatherCountry({required String country}) async {
    emit(LoadingWeatherCountryState());

    await RemoteDataSource.getData(
            url:'/weather?q=$country&html&appid=${APPConst.key}')
        .then((value) {
      var data = WeatherCutrrey.fromJson(value.data);
      weatherCountry = data;

      emit(SuccessWeatherCountryState());
    }).catchError((e) {
      emit(ErrorWeatherCountryState(error: e.toString()));
    });
  }
}
