class FormatNumbers {
  static String getNumberAverage(double firstValue, double secondValue) {
    return ((firstValue + secondValue)/2).toStringAsFixed(2).replaceAll('.', ',');
  }

  static String numbersToString(double? value) {
    if(value != null) {
      return value.toStringAsFixed(2).replaceAll('.', ',');
    }
    return "";
  }
}