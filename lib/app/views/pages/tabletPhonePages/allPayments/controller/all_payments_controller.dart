import 'package:get/get.dart';
import 'package:projeto_tcc/app/enums/enums.dart';
import '../../../../../../base/viewController/card_payment_view_controller.dart';

class AllPaymentsController extends GetxController {
  late RxBool statusOpen;
  late RxBool statusClose;
  late RxBool statusLate;
  late List<CardPaymentViewController> cardPaymentList;

  AllPaymentsController(){
    _initializeVariables();
    _initializeLists();
  }

  _initializeVariables(){
    statusOpen = true.obs;
    statusClose = true.obs;
    statusLate = true.obs;
  }

  _initializeLists(){
    cardPaymentList = [
      CardPaymentViewController(
        "William Douglas Costa Gomes",
        "48467",
        "Mensalidade",
        "BANCO ITAÚ UNIBANCO S/A",
        "60.701.190/0001-01",
        "04/07/2022",
        "05/07/2022",
        "743,99",
        paymentStatus.finished,
      ),
      CardPaymentViewController(
        "William Douglas Costa Gomes",
        "48467",
        "Mensalidade",
        "BANCO ITAÚ UNIBANCO S/A",
        "60.701.190/0001-01",
        "",
        "05/08/2022",
        "743,99",
        paymentStatus.late,
      ),
      CardPaymentViewController(
        "William Douglas Costa Gomes",
        "48467",
        "Mensalidade",
        "BANCO ITAÚ UNIBANCO S/A",
        "60.701.190/0001-01",
        "",
        "05/09/2022",
        "743,99",
        paymentStatus.next,
      ),
      CardPaymentViewController(
        "William Douglas Costa Gomes",
        "48467",
        "Mensalidade",
        "BANCO ITAÚ UNIBANCO S/A",
        "60.701.190/0001-01",
        "",
        "05/10/2022",
        "743,99",
        paymentStatus.future,
      ),
      CardPaymentViewController(
        "William Douglas Costa Gomes",
        "48467",
        "Mensalidade",
        "BANCO ITAÚ UNIBANCO S/A",
        "60.701.190/0001-01",
        "",
        "05/11/2022",
        "743,99",
        paymentStatus.future,
      ),
      CardPaymentViewController(
        "William Douglas Costa Gomes",
        "48467",
        "Mensalidade",
        "BANCO ITAÚ UNIBANCO S/A",
        "60.701.190/0001-01",
        "",
        "05/12/2022",
        "743,99",
        paymentStatus.future,
      ),
      CardPaymentViewController(
        "William Douglas Costa Gomes",
        "48467",
        "Mensalidade",
        "BANCO ITAÚ UNIBANCO S/A",
        "60.701.190/0001-01",
        "",
        "05/01/2023",
        "785,99",
        paymentStatus.future,
      ),
      CardPaymentViewController(
        "William Douglas Costa Gomes",
        "48467",
        "Mensalidade",
        "BANCO ITAÚ UNIBANCO S/A",
        "60.701.190/0001-01",
        "",
        "05/02/2023",
        "785,99",
        paymentStatus.future,
      ),
    ];
  }

  setTagFilter(billStatus status){
    switch(status){
      case billStatus.open:
        statusOpen.value = !statusOpen.value;
        break;
      case billStatus.close:
        statusClose.value = !statusClose.value;
        break;
      case billStatus.late:
        statusLate.value = !statusLate.value;
        break;
    }
  }
}