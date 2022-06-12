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

  static String dayAndMounth(DateTime? date) {
    if(date != null) {
      initializeDateFormatting('pt_BR', null);
      Intl.defaultLocale = 'pt_BR';
      return DateFormat('dd-MM').format(date).replaceAll('-', '/').toUpperCase();
    }
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

  static String weekDay(DateTime? date) {
    if(date != null) {
      switch(date.weekday){
        case 7:
          return "Domingo";
        case 1:
          return "Segunda";
        case 2:
          return "Terça";
        case 3:
          return "Quarta";
        case 4:
          return "Quinta";
        case 5:
          return "Sexta";
        case 6:
          return "Sábado";
      }
    }
    return "";
  }
}