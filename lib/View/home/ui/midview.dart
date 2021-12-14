import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forecast_app/Models/weather_model.dart';
import 'package:forecast_app/util/forecast_util.dart';
import 'package:forecast_app/util/get_the_desired_icon.dart';
import 'package:get/get.dart';

class MidView extends StatelessWidget {
  final AsyncSnapshot<WeatherModel> snapshot;

  MidView(this.snapshot);
  @override
  Widget build(BuildContext context) {
    String? city = snapshot.data!.city!.name;
    String? country = snapshot.data!.city!.country;
    List<ListElement>? forecastList = snapshot.data!.list;

    var formattedDate = DateTime.fromMillisecondsSinceEpoch(
      forecastList![0].dt! * 1000,
    );
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              city! + " , " + country!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
              ),
              child: Text(
                "${Util.getFormattedDate(formattedDate)}",
                style: TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: getWeatherIcon(
                weatherDescription: forecastList[0].weather![0].main,
                size: 198,
                color: Colors.pink[300],
                // color: Color(0xffF59D46),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  forecastList[0].main!.temp!.toStringAsFixed(0) + " °C",
                  style: TextStyle(fontSize: 34),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(forecastList[0]
                    .weather![0]
                    .description
                    .toString()
                    .toUpperCase()
                    .replaceAll("DESCRIPTION.", '')),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "${forecastList[0].wind!.speed!.toStringAsFixed(1)} km/h"),
                        Icon(
                          FontAwesomeIcons.wind,
                          size: 20,
                          // color: Colors.brown,
                          color: Color(0xff2CB26F),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "${forecastList[0].main!.humidity!.toStringAsFixed(1)} %"),
                        Icon(
                          FontAwesomeIcons.solidGrinBeamSweat,
                          size: 20,
                          color: Color(0xff2CB26F),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "${forecastList[0].main!.tempMax!.toStringAsFixed(0)} °C"),
                        Icon(
                          FontAwesomeIcons.temperatureHigh,
                          size: 20,
                          color: Color(0xff2CB26F),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget midView(AsyncSnapshot<WeatherModel> snapshot) {
  String? city = snapshot.data!.city!.name;
  String? country = snapshot.data!.city!.country;
  List<ListElement>? forecastList = snapshot.data!.list;

  var formattedDate = DateTime.fromMillisecondsSinceEpoch(
    forecastList![0].dt! * 1000,
  );
  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            city! + " , " + country!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
            ),
            child: Text(
              "${Util.getFormattedDate(formattedDate)}",
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: getWeatherIcon(
              weatherDescription: forecastList[0].weather![0].main,
              size: 198,
              color: Colors.pink[300],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                forecastList[0].main!.temp!.toStringAsFixed(0) + " °C",
                style: TextStyle(fontSize: 34),
              ),
              SizedBox(
                width: 10,
              ),
              Text(forecastList[0]
                  .weather![0]
                  .description
                  .toString()
                  .toUpperCase()
                  .replaceAll("DESCRIPTION.", '')),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "${forecastList[0].wind!.speed!.toStringAsFixed(1)} km/h"),
                      Icon(
                        FontAwesomeIcons.wind,
                        size: 20,
                        color: Colors.brown,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "${forecastList[0].main!.humidity!.toStringAsFixed(1)} %"),
                      Icon(
                        FontAwesomeIcons.solidGrinBeamSweat,
                        size: 20,
                        color: Colors.brown,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "${forecastList[0].main!.tempMax!.toStringAsFixed(0)} °C"),
                      Icon(
                        FontAwesomeIcons.temperatureHigh,
                        size: 20,
                        color: Colors.brown,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
  return midView;
}
