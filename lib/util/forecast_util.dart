import 'package:intl/intl.dart';

class Util {
  //here i am using my own generated app id (please use yours)
  // u can generate on in (openweathermap.com)
  static String appId = "f0ff4c2baeefafe6053ac62048f9d32a";
  static String unit =
      "metric"; // you can change this to (imperial) if u wanna measure temp by (F) not (C)

  static String getFormattedDate(DateTime dateTime) {
    return new DateFormat("EEEE, MMM d, y").format(dateTime);
  }
}
