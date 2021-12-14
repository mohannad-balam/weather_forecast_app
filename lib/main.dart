import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'View/home/home_page.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends GetWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // getPages: [
      //   GetPage(
      //     name: '/',
      //     page: () => HomePage(),
      //   )
      // ],
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
