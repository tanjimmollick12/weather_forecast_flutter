import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forecast/weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_forecast/weather_forecast/util/convert_icon.dart';
import 'package:weather_forecast/weather_forecast/util/forecast_util.dart';
Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot,int index){
  var forecastList = snapshot.data!.list;
  var dayOfweek =["Day1","Day2","Day3","Day4","Day5","Day6","Day7"];
  DateTime date = new  DateTime.fromMicrosecondsSinceEpoch(forecastList[index].dt*10000);
  //var fullDate = Util.getFormattedDate(date);
 // dayOfweek = fullDate.split(",")[0];
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Center(child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(dayOfweek[index]),
    )),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
            child: getWeatherIcon(weatherDescription: forecastList[index].weather[0].main, color: Colors.blueAccent, size: 45),

          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("${forecastList[index].temp.min!.toStringAsFixed(0)} °F"),
                  ),
                  Icon(FontAwesomeIcons.solidArrowAltCircleDown,color: Colors.white, size: 17,)
                  
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text("${forecastList[index].temp.max!.toStringAsFixed(0)} °F"),
                    Icon(FontAwesomeIcons.solidArrowAltCircleUp,color: Colors.white, size: 17,)

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text("Hum: ${forecastList[index].humidity!.toStringAsFixed(0)} %"),
                   // Icon(FontAwesomeIcons.solidGrinBeamSweat,color: Colors.white, size: 17,)

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text("Win: ${forecastList[index].speed!.toStringAsFixed(1)} mi/h"),
                    Icon(FontAwesomeIcons.solidGrinBeamSweat,color: Colors.white, size: 17,)

                  ],
                ),
              )



            ],
          )
        ],
      ),


    ],

  );

}