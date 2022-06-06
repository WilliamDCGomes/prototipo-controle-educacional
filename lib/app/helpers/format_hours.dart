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
}