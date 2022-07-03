import 'package:projeto_tcc/app/views/stylePages/app_colors.dart';
import '../../app/enums/enums.dart';

class CardPaymentViewController {
  late String userName;
  late String raNumber;
  late String paymentType;
  late String bankingInstitution;
  late String bankCnpj;
  late String paymentDate;
  late String dueDate;
  late String billValue;
  late paymentStatus status;

  CardPaymentViewController(
      this.userName,
      this.raNumber,
      this.paymentType,
      this.bankingInstitution,
      this.bankCnpj,
      this.paymentDate,
      this.dueDate,
      this.billValue,
      this.status,
      );

  get getStatusName {
    switch(status){
      case paymentStatus.future:
        return "Futura";
      case paymentStatus.late:
        return "Atrasada";
      case paymentStatus.next:
        return "Aberta";
      case paymentStatus.finished:
        return "Paga";
    }
  }
  get getCardColor {
    switch(status){
      case paymentStatus.future:
        return AppColors.purpleDefaultColor;
      case paymentStatus.late:
        return AppColors.redColor;
      case paymentStatus.next:
        return AppColors.orangeColor;
      case paymentStatus.finished:
        return AppColors.greenColor;
    }
  }

  get getFullStatus {
    return "$paymentType $getStatusName";
  }

  get getPaymentDate {
    return paymentDate != "" ? paymentDate : "N/I";
  }
}