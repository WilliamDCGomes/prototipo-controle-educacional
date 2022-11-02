import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/mainMenu/widgets/tabLoadingWidget/financial_tab_loading_tablet_phone_widget.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/mainMenu/widgets/tabViewWidgetAfterLoading/financial_tab_view_after_loading_tablet_phone_wdiget.dart';
import '../controller/main_menu_tablet_phone_controller.dart';

class FinancialTabTabletPhoneWidget extends StatefulWidget {
  late final MainMenuTabletPhoneController controller;
  FinancialTabTabletPhoneWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<FinancialTabTabletPhoneWidget> createState() => _FinancialTabTabletPhoneWidgetState();
}

class _FinancialTabTabletPhoneWidgetState extends State<FinancialTabTabletPhoneWidget> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Visibility(
          visible: widget.controller.isLoadingMainMenu.value,
          child: FinancialTabLoadingTabletPhoneWidget(controller: widget.controller),
          replacement: FinancialTabViewTabletPhoneWidget(controller: widget.controller),
        ),
      ),
    );
  }
}
