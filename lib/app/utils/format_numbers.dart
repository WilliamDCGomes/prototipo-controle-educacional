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

  static double stringToNumber(String? value) {
    if(value != null) {
      try{
        return double.tryParse(value.replaceAll('R\$', '').replaceAll(',', '.').trim()) ?? 0;
      }
      catch(_){
        return 0;
      }
    }
    return 0;
  }
}