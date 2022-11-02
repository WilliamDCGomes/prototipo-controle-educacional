import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/mainMenu/widgets/tabLoadingWidget/academic_tab_loading_tablet_phone_widget.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/mainMenu/widgets/tabViewWidgetAfterLoading/academic_tab_view_after_loading_tablet_phone_widget.dart';
import '../controller/main_menu_tablet_phone_controller.dart';

class AcademicTabTabletPhoneWidget extends StatefulWidget {
  late final MainMenuTabletPhoneController controller;
  AcademicTabTabletPhoneWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<AcademicTabTabletPhoneWidget> createState() => _AcademicTabTabletPhoneWidgetState();
}

class _AcademicTabTabletPhoneWidgetState extends State<AcademicTabTabletPhoneWidget> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
          () => Visibility(
          visible: widget.controller.isLoadingMainMenu.value,
          child: AcademicTabLoadingTabletPhoneWidget(controller: widget.controller),
          replacement: AcademicTabViewAfterLoadingTabletPhoneWidget(controller: widget.controller),
        ),
      ),
    );
  }
}