import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/service/dio__helper.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  static WeatherCubit get(context)=> BlocProvider.of(context);

  WeatherModel? weatherModel;

  void getData(){
    DioHelper.dio.get('https://api.openweathermap.org/data/2.5/weather',
        queryParameters:{
      //q=NewYork&units=metric&appid=ddcdbfe8c6baa50812ec931a2e9e8142
          'q':'New York',
          'units':'metric',
          'appid':'ddcdbfe8c6baa50812ec931a2e9e8142'
        }

    ).then((value) {
      var data =jsonDecode(value.data);
      weatherModel = WeatherModel.fromJson(data);
      emit(UpdateData());
    });
  }

}
