import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:forecast_app/Models/weather_model.dart';
import 'package:forecast_app/util/forecast_util.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class WeatherController extends GetxController {
  //this function is gonna fetch data from API and retrun it as an object of dart after decoding it from string to json
  //and the turn it to dart object by using fromJosn() method
  Future<WeatherModel> getData(String? cityName) async {
    final url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?q=" +
            cityName.toString() +
            "&appid=f0ff4c2baeefafe6053ac62048f9d32a&units=metric");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      //ok
      //returning dart object form json url

      //or jsonDecode()
      print(response.body);
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }
}
  //end function
