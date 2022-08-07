import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TextFieldValidators {
  static bool _isValidDate(String input) {
    try {
      String datePattern = "dd/MM/yyyy";
      DateTime date = DateFormat(datePattern).parse(input);
      final originalFormatString = _toOriginalFormatString(date);
      return input == originalFormatString;
    } catch (e) {
      return false;
    }
  }

  static String _toOriginalFormatString(DateTime dateTime) {
    final d = dateTime.day.toString().padLeft(2, '0');
    final m = dateTime.month.toString().padLeft(2, '0');
    final y = dateTime.year.toString().padLeft(4, '0');
    return "$d/$m/$y";
  }

  static String? standardValidation(String? value, String errorMessage) {
    if (value == null || value.trim().isEmpty) {
      return errorMessage;
    }
    return null;
  }

  static String? minimumNumberValidation(String? value, int size, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return "Informe o $fieldName";
    }
    if(value.trim().length < size){
      return "$fieldName Inválido";
    }
    return null;
  }

  static String? passwordValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Informe a Senha";
    }
    if (value.trim().length < 6) {
      return "A Senha deve conter no mínimo 6 dígitos";
    }
    return null;
  }

  static String? confirmPasswordValidation(String? firstPassword, String? secondPassword) {
    if (secondPassword == null || secondPassword.trim().isEmpty) {
      return "Informe a Confirmação de Senha";
    }
    if (secondPassword.trim().length < 6) {
      return "A Confirmação de Senha deve conter no mínimo 6 dígitos";
    }
    if (firstPassword != secondPassword) {
      return "As senhas não conferem";
    }
    return null;
  }

  static String? dateValidation(String? value, String fieldName) {
    try {
      if (value == null || value.trim().isEmpty) {
        return "Informe a Data $fieldName";
      }
      if (!_isValidDate(value)) {
        return "A Data $fieldName digitada é Inválida";
      }
    } catch (e) {
      return "A Data $fieldName digitada é Inválida";
    }
    return null;
  }

  static String? birthDayValidation(String? value, String fieldName) {
    try {
      if (value == null || value.trim().isEmpty) {
        return "Informe a Data $fieldName";
      }
      if (!_isValidDate(value)) {
        return "A Data $fieldName digitada é Inválida";
      }
      String datePattern = "dd/MM/yyyy";
      DateTime date = DateFormat(datePattern).parse(value);
      int maxTimeOfHumanLifeInDays = 54750;
      if(DateTime.now().difference(date) > Duration(days: maxTimeOfHumanLifeInDays) || DateTime.now().isBefore(date)){
        return "A Data $fieldName digitada é Inválida";
      }
    } catch (e) {
      return "A Data $fieldName digitada é Inválida";
    }
    return null;
  }

  static String? cpfValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Informe o CPF";
    }
    if (!value.isCpf) {
      return "CPF Inválido";
    }
    return null;
  }

  static String? phoneValidation(String? value) {
    if (value != null && value.trim().length > 0 && value.trim().length != 14) {
      return "Telefone Inválido";
    }
    return null;
  }

  static String? cellPhoneValidation(String? value) {
    if (value != null && value.trim().length > 0 && value.trim().length != 14 && value.trim().length != 15) {
      return "Celular Inválido";
    }
    return null;
  }

  static String? emailValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Informe o E-mail";
    }
    if (!value.trim().isValidEmail()) {
      return "E-mail Inválido";
    }
    return null;
  }

  static String? emailConfirmationValidation(String? email, String? emailConfirmation) {
    if (emailConfirmation == null || emailConfirmation.trim().isEmpty) {
      return "Informe a Confirmação do E-mail";
    }
    if (!emailConfirmation.trim().isValidEmail()) {
      return "E-mail Inválido";
    }
    if(emailConfirmation != email){
      return "Os E-mails Informados não Conferem";
    }
    return null;
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(this);
  }
}