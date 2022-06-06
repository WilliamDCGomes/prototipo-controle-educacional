import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class DateFormatToBrazil {
  static String formatDate(DateTime? date) {
    if(date != null)
      return DateFormat('dd-MM-yyyy').format(date).replaceAll('-', '/');
    return "";
  }
  static String formatDateFull(DateTime? date) {
    if(date != null)
      return DateFormat.yMMMMd('pt_BR').format(date).replaceAll('-', '/');
    return "";
  }

  static String mounthAndYear(DateTime? date) {
    if(date != null) {
      initializeDateFormatting('pt_BR', null);
      Intl.defaultLocale = 'pt_BR';
      return DateFormat('MMMM-yyyy').format(date).replaceAll('-', ' ').toUpperCase();
    }
    return "";
  }

  static String mounth(DateTime? date) {
    if(date != null) {
      initializeDateFormatting('pt_BR', null);
      Intl.defaultLocale = 'pt_BR';
      return DateFormat('MMMM').format(date).replaceAll('-', ' ');
    }
    return "";
  }
}