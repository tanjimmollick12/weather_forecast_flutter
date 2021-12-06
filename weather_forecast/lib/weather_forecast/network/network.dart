import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_forecast/weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_forecast/weather_forecast/util/forecast_util.dart';
import 'package:weather_forecast/weather_forecast/weather_forecast.dart';

class Network{
  Future<WeatherForecastModel> getWeatherForecast({ cityName}) async{
    var finalUrl = "https://api.openweathermap.org/data/2.5/forecast/daily?q=$cityName&appid=ed60fcfbd110ee65c7150605ea8aceea&units=imperial";
    final response = await get(Uri.parse(finalUrl));
   // print("URL: ${Uri.encodeFull(finalUrl)}");
    if(response.statusCode == 200){
      print("weather data: ${response.body}");
      return WeatherForecastModel.fromJson(jsonDecode(response.body));

    }else{
      throw Exception("error");
    }
  }
}