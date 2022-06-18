import 'package:projeto_tcc/app/helpers/date_format_to_brazil.dart';

import '../../app/helpers/format_numbers.dart';

class SelectCardPaymentViewController {
  late String studentName;
  late String requestTitle;
  late String raNumber;
  late double paymentValue;
  late DateTime dateRequest;

  SelectCardPaymentViewController(
    this.studentName,
    this.requestTitle,
    this.raNumber,
    this.paymentValue,
    this.dateRequest,
  );

  get getTitleName => requestTitle.toUpperCase();
  get getDateRequest => DateFormatToBrazil.formatDate(dateRequest);
  get getPaymentValue => "R\$ ${FormatNumbers.numbersToString(paymentValue)}";
}