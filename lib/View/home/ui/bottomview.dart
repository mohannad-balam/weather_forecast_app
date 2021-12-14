import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forecast_app/Models/weather_model.dart';
import 'package:forecast_app/View/home/ui/forecast_card.dart';
import 'package:get/get.dart';

class BottomView extends StatelessWidget {
  final AsyncSnapshot<WeatherModel> snapshot;
  BottomView(this.snapshot);
  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Next 3-Hours Weather Forecast".toUpperCase(),
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(
                    width: 6,
                  ),
              itemCount: forecastList!.length,
              itemBuilder: (context, index) => ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.1,
                      height: MediaQuery.of(context).size.height * 0.20,
                      child: forecastCard(snapshot, index),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xffd81b60), Colors.pink[200]!],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                  )),
        )
      ],
    );
  }
}

Widget bottomView(AsyncSnapshot<WeatherModel> snapshot, BuildContext context) {
  var forecastList = snapshot.data!.list;
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        "Next 3-Hours Weather Forecast".toUpperCase(),
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height * 0.25,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(
                  width: 6,
                ),
            itemCount: forecastList!.length,
            itemBuilder: (context, index) => ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.2,
                    height: MediaQuery.of(context).size.height * 0.22,
                    child: forecastCard(snapshot, index),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.indigo[900]!, Colors.white],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                )),
      )
    ],
  );
}
