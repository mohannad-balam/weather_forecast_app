import 'package:flutter/material.dart';
import 'package:forecast_app/Controller/weather_controller.dart';
import 'package:forecast_app/Models/weather_model.dart';
import 'package:forecast_app/View/home/ui/bottomview.dart';
import 'package:forecast_app/View/home/ui/midview.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherController weatherController = Get.put(WeatherController());
  var weatherFuture;
  var cityName = "Tokyo";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weatherFuture = weatherController.getData(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Forecast",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white),
      body: SafeArea(
        child: ListView(
          children: [
            textFieldView(),
            Container(
              child: FutureBuilder<WeatherModel>(
                future: weatherController.getData(cityName),
                builder: (BuildContext context,
                    AsyncSnapshot<WeatherModel>? snapshot) {
                  if (snapshot!.hasData) {
                    return Column(
                      children: [
                        MidView(snapshot),
                        BottomView(snapshot),
                        // bottomView(snapshot, context)
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.pinkAccent,
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget textFieldView() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        child: TextField(
          decoration: InputDecoration(
              hintText: "Enter City Name",
              prefixIcon: Icon(Icons.search),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              contentPadding: EdgeInsets.all(8)),
          onSubmitted: (value) {
            setState(() {
              cityName = value;
              weatherController.getData(cityName);
            });
          },
        ),
      ),
    );
  }
}
