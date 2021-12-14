import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forecast_app/Models/weather_model.dart';
import 'package:forecast_app/util/forecast_util.dart';
import 'package:forecast_app/util/get_the_desired_icon.dart';

Widget forecastCard(AsyncSnapshot<WeatherModel> snapshot, int index) {
  var forecastList = snapshot.data!.list;
  var dayOfTheWeek = "";
  var date = DateTime.fromMillisecondsSinceEpoch(forecastList![index].dt!);
  var fullDate = Util.getFormattedDate(date);
  dayOfTheWeek = fullDate.split(',')[0]; //.elementAt(0);
  var time = forecastList[index].dtTxt.toString();
  var exactTime = time.split(' ')[1].split(":")[0];
  var intTime = int.parse(exactTime);
  var finalTime = intTime > 12
      ? intTime - 12
      : intTime < 12
          ? intTime + 12
          : intTime == 24
              ? 00
              : 00;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
            child: Text(
          dayOfTheWeek,
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        Center(
          child: Text(finalTime.toString().replaceAll("-", "") + ":00"),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 32,
              child: getWeatherIcon(
                weatherDescription: forecastList[index].weather![0].main,
                color: Color(0xff2CB26F),
                size: 40,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text(
                          "${forecastList[index].main!.tempMin!.toStringAsFixed(1)} °C "),
                      Icon(
                        FontAwesomeIcons.solidArrowAltCircleDown,
                        size: 17,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text(
                          "${forecastList[index].main!.tempMax!.toStringAsFixed(1)} °C "),
                      Icon(
                        FontAwesomeIcons.solidArrowAltCircleUp,
                        size: 17,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text(
                          "Hum: ${forecastList[index].main!.humidity!.toStringAsFixed(0)} %"),
                      // Icon(
                      //   FontAwesomeIcons.solidArrowAltCircleUp,
                      //   size: 17,
                      //   color: Colors.white,
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text(
                          "Win: ${forecastList[index].wind!.speed!.toStringAsFixed(1)} km/h"),
                      // Icon(
                      //   FontAwesomeIcons.solidArrowAltCircleUp,
                      //   size: 17,
                      //   color: Colors.white,
                      // ),
                    ],
                  ),
                ),
              ],
            )
          ],
        )
      ],
    ),
  );
}
