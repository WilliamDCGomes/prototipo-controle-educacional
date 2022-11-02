import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/mainMenu/widgets/tabLoadingWidget/home_tab_loading_tablet_phone_widget.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/mainMenu/widgets/tabViewWidgetAfterLoading/home_tab_view_after_loading_tablet_phone_widget.dart';
import '../controller/main_menu_tablet_phone_controller.dart';

class HomeTabTabletPhoneWidget extends StatefulWidget {
  late final MainMenuTabletPhoneController controller;
  HomeTabTabletPhoneWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<HomeTabTabletPhoneWidget> createState() => _HomeTabTabletPhoneWidgetState();
}

class _HomeTabTabletPhoneWidgetState extends State<HomeTabTabletPhoneWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Visibility(
          visible: widget.controller.isLoadingMainMenu.value,
          child: HomeTabLoadingTabletPhoneWidget(controller: widget.controller),
          replacement: HomeTabViewAfterLoadingTabletPhoneWidget(controller: widget.controller),
        ),
      ),
    );
  }
}
