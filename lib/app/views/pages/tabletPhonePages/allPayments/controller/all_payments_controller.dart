import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/enums/enums.dart';
import '../../../../../../base/viewController/card_payment_view_controller.dart';

class AllPaymentsController extends GetxController {
  late TextEditingController billSearchController;
  late List<CardPaymentViewController> cardPaymentList;

  AllPaymentsController(){
    _initializeVariables();
    _initializeLists();
  }

  _initializeVariables(){
    billSearchController = TextEditingController();
  }

  _initializeLists(){
    cardPaymentList = [
      CardPaymentViewController(
        "William Douglas Costa Gomes",
        "Mensalidade",
        "BANCO ITAÚ UNIBANCO S/A",
        "60.701.190/0001-01",
        "04/07/2022",
        "05/07/2022",
        "R\$ 743,99",
        paymentStatus.finished,
      ),
      CardPaymentViewController(
        "William Douglas Costa Gomes",
        "Mensalidade",
        "BANCO ITAÚ UNIBANCO S/A",
        "60.701.190/0001-01",
        "",
        "05/08/2022",
        "R\$ 743,99",
        paymentStatus.late,
      ),
      CardPaymentViewController(
        "William Douglas Costa Gomes",
        "Mensalidade",
        "BANCO ITAÚ UNIBANCO S/A",
        "60.701.190/0001-01",
        "",
        "05/09/2022",
        "R\$ 743,99",
        paymentStatus.next,
      ),
      CardPaymentViewController(
        "William Douglas Costa Gomes",
        "Mensalidade",
        "BANCO ITAÚ UNIBANCO S/A",
        "60.701.190/0001-01",
        "",
        "05/10/2022",
        "R\$ 743,99",
        paymentStatus.future,
      ),
      CardPaymentViewController(
        "William Douglas Costa Gomes",
        "Mensalidade",
        "BANCO ITAÚ UNIBANCO S/A",
        "60.701.190/0001-01",
        "",
        "05/11/2022",
        "R\$ 743,99",
        paymentStatus.future,
      ),
      CardPaymentViewController(
        "William Douglas Costa Gomes",
        "Mensalidade",
        "BANCO ITAÚ UNIBANCO S/A",
        "60.701.190/0001-01",
        "",
        "05/12/2022",
        "R\$ 743,99",
        paymentStatus.future,
      ),
      CardPaymentViewController(
        "William Douglas Costa Gomes",
        "Mensalidade",
        "BANCO ITAÚ UNIBANCO S/A",
        "60.701.190/0001-01",
        "",
        "05/01/2023",
        "R\$ 785,99",
        paymentStatus.future,
      ),
      CardPaymentViewController(
        "William Douglas Costa Gomes",
        "Mensalidade",
        "BANCO ITAÚ UNIBANCO S/A",
        "60.701.190/0001-01",
        "",
        "05/02/2023",
        "R\$ 785,99",
        paymentStatus.future,
      ),
    ];
  }
}