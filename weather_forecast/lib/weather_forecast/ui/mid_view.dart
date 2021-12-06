import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forecast/weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_forecast/weather_forecast/util/forecast_util.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot){
var forecastList = snapshot.data!.list;
  var city = snapshot.data!.city.name;
var country = snapshot.data!.city.country;
var forecast = forecastList[0];
var formatteddate = DateTime.fromMicrosecondsSinceEpoch(forecastList[0].dt *1000, isUtc: true);
  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$city, $country",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black
          ),

          ),


          SizedBox(height: 10,),
          Icon(FontAwesomeIcons.cloud,size: 198,color: Colors.cyanAccent.shade700,),
          //Icon(Icons.wb_sunny,size: 195,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${forecast.temp.day!.toStringAsFixed(0)}°F",
                style: TextStyle(
                  fontSize: 34
                ),),
                Text(" ${forecast.weather[0].description!.toUpperCase()}"),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget> [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                 children:[
                  Text("${forecast.speed!.toStringAsFixed(1)}mi/h"),
                  Icon(FontAwesomeIcons.temperatureHigh,size: 20,)
                  //Icon(Icons.arrow_forward,size: 20,color: Colors.brown, )
                ],

                ),
              ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("${forecast.humidity!.toStringAsFixed(0)}%"),
                      Icon(Icons.hot_tub,size: 20,color: Colors.brown, )
                      ],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${forecast.temp.max}°F"),
                      Icon(Icons.wb_sunny,size: 20,color: Colors.brown, )
                    ],
                  ),
                )
           ] ),
          )
        ],
      ),
    ),
  );
  return midView;

}