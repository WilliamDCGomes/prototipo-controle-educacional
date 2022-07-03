import 'package:get/get.dart';
import 'package:projeto_tcc/app/enums/enums.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../base/viewController/card_payment_view_controller.dart';
import '../../../../../helpers/paths.dart';
import '../../../../stylePages/app_colors.dart';
import '../widgets/tag_filter_widget.dart';
import 'package:flutter/material.dart';

class AllPaymentsController extends GetxController {
  late RxBool statusOpen;
  late RxBool statusClose;
  late RxBool statusLate;
  late List<TagFilterWidget> tagsFilterList;
  late List<CardPaymentViewController> cardPaymentList;

  AllPaymentsController(){
    _initializeVariables();
    _initializeLists();
  }

  _initializeVariables(){
    statusOpen = true.obs;
    statusClose = true.obs;
    statusLate = true.obs;

    _addListeners();
  }

  _addListeners(){
    statusOpen.listen((value){
      //TODO Filtrar com a tag de aberta
    });

    statusClose.listen((value){
      //TODO Filtrar com a tag de Pagas
    });

    statusLate.listen((value){
      //TODO Filtrar com a tag de Atrasadas
    });
  }

  _initializeLists(){
    tagsFilterList = <TagFilterWidget> [
      TagFilterWidget(
        cardColor: AppColors.blueMoneyFinancialCardColor,
        cardStatus: "Abertas",
        selected: statusOpen,
        selectedSvgPath: Paths.Icone_Abertas_Selecionado,
        unselectedSvgPath: Paths.Icone_Abertas_Apagada,
      ),
      TagFilterWidget(
        cardColor: AppColors.redColor,
        cardStatus: "Atrasadas",
        selected: statusLate,
        icon: Align(
          alignment: Alignment.bottomRight,
          child: Icon(
            Icons.calendar_month,
            size: 2.5.h,
            color: statusLate.value ? AppColors.redColor : AppColors.lightRedColor,
          ),
        ),
      ),
      TagFilterWidget(
        cardColor: AppColors.greenTagFilterColor,
        cardStatus: "Pagas",
        selected: statusClose,
        selectedSvgPath: Paths.Icone_Pagas_Selecionado,
        unselectedSvgPath: Paths.Icone_Pagas_Apagado,
      ),
    ];

    cardPaymentList = <CardPaymentViewController> [
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
}