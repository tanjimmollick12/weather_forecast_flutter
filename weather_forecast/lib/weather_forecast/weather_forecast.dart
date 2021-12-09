import 'package:flutter/material.dart';
import 'package:weather_forecast/weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_forecast/weather_forecast/ui/bottom_view.dart';
import 'package:weather_forecast/weather_forecast/ui/mid_view.dart';
import '';
import 'network/network.dart';
class weatherForecast extends StatefulWidget {
  const weatherForecast({Key? key}) : super(key: key);

  @override
  _weatherForecastState createState() => _weatherForecastState();
}

class _weatherForecastState extends State<weatherForecast> {
 late Future<WeatherForecastModel> forecastObject;
  String _cityName = "dhaka";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = getWeather(cityName: _cityName);


    forecastObject.then((weather) {
      print(weather.city.name);

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          textFieldView(),
          Container(
            child: FutureBuilder<WeatherForecastModel>(
              future: forecastObject,
              builder: (BuildContext conext,AsyncSnapshot<WeatherForecastModel>snapshot){
                  if(snapshot.hasData){
                    return Column(
                      children: [
                           midView(snapshot),
                        bottomView(snapshot, context),
                      ],
                    );
                  }else{
                    return Container(
                      child: Center(child: CircularProgressIndicator(),),
                    );
                  }

              }),
            )
        ],
      ),
    );
  }

  Widget textFieldView() {
  return Container(
  child: TextField(
    decoration: InputDecoration(
      hintText: "Enter City Name",
      prefixIcon: Icon(Icons.search),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10)),
        contentPadding: EdgeInsets.all(8)
      ),
    onSubmitted: (value){
      setState(() {
        _cityName = value;
        forecastObject = getWeather(cityName: _cityName);
      });

    },
    ),

  );

  }

  Future<WeatherForecastModel> getWeather({required String cityName}) => new Network().getWeatherForecast(cityName: _cityName);


}
