import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/blocs/weather_cubit/weather_cubit.dart';
import 'package:weather_app/blocs/weather_cubit/weather_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        DateTime day = DateTime.now();
        var cubit = WeatherCubit.get(context);
        if (cubit.weatherModel?.id == null)
          cubit.getData();
        return Scaffold(
          backgroundColor: Color(0xff1E2863),
          body: Center(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.vertical,
              spacing: 20,
              children: [
                Text('${cubit.weatherModel?.name}', style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
                Text("${cubit.weatherModel?.weather?[0].description}", style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),),
                Image.asset("assets/images/sun 2.png"),
                Text("${cubit.weatherModel?.main?.temp}", style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),),
                Text(DateFormat.yMMMMd('en_US').format(day), style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),),
              ],
            ),
          ),
        );
      },
    );
  }
}
