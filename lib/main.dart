import 'package:flutter/material.dart';
import 'package:weather_app/service/dio__helper.dart';
import 'package:weather_app/src/app_root.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const AppRoot());
}

