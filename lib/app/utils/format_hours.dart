import 'package:intl/intl.dart';

class FormatHours {
  static String formatHour(String? hour) {
    if(hour != null && hour.length < 5){
      var hourValue = hour.split(":");
      if(hourValue[0].length < 2){
        hourValue[0] = "0${hourValue[0]}";
      }
      if(hourValue[1].length < 2){
        hourValue[1] = "0${hourValue[1]}";
      }
      return "${hourValue[0]}:${hourValue[1]}";
    }
    return hour ?? "";
  }

  static String formatHourFromDateTime(DateTime? hour) {
    if(hour != null)
      return "${DateFormat('HH:mm').format(hour)}";
    return "";
  }

  static String hourToHour(String? firstHour, String? secondHour) {
    if(firstHour != null && secondHour != null)
      return "$firstHour às $secondHour";
    return "";
  }

  static int formatHourStringToMinuteInt(String? hour) {
    try{
      if(hour != null){
        var time = hour.split(':');
        return (int.parse(time[0]) * 60) + int.parse(time[1]);
      }
      return 0;
    }
    catch(_){
      return 0;
    }
  }
}