import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TextFieldValidators {
  static String? standardValidation(String? value, String errorMessage) {
    if (value!.trim().isEmpty) {
      return errorMessage;
    }
    return null;
  }

  static String? passwordValidation(String? value) {
    if (value!.trim().isEmpty) {
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
        return "Digite a Data de $fieldName";
      }
      if (!isValidDate(value)) {
        return "A data de $fieldName digitada é inválida Inválida";
      }
    } catch (e) {
      return "A data de $fieldName digitada é inválida Inválida";
    }
    return null;
  }

  static bool isValidDate(String input) {
    try {
      String datePattern = "dd/MM/yyyy";
      DateTime birthDate = DateFormat(datePattern).parse(input);
      final originalFormatString = _toOriginalFormatString(birthDate);
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

  static String? cpfValidation(String? value) {
    if (value!.trim().isEmpty) {
      return "Informe o CPF";
    }
    if (value.isCpf) {
      return "CPF inválido";
    }
    return null;
  }

  static String? emailValidation(String? value) {
    if (value!.trim().isEmpty) {
      return "Informe o E-mail";
    } else if (!value.trim().isValidEmail()) {
      return "E-mail inválido";
    }
    return null;
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(this);
  }
}