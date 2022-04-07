import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class DateFormatToBrazil {
  static final DateFormatToBrazil _dateFormatToBraziln =
  DateFormatToBrazil._internal();
  factory DateFormatToBrazil() {
    return _dateFormatToBraziln;
  }
  DateFormatToBrazil._internal();

  String formatDate(DateTime? date) {
    if(date != null)
      return DateFormat('dd-MM-yyyy').format(date).replaceAll('-', '/');
    return "";
  }

  String mounthAndYear(DateTime? date) {
    if(date != null) {
      initializeDateFormatting('pt_BR', null);
      Intl.defaultLocale = 'pt_BR';
      return DateFormat('MMMM-yyyy').format(date).replaceAll('-', ' ').toUpperCase();
    }
    return "";
  }
}