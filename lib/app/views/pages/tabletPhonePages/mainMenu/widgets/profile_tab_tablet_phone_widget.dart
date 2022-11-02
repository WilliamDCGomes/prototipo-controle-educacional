import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/mainMenu/widgets/tabLoadingWidget/profile_tab_loading_tablet_phone_widget.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/mainMenu/widgets/tabViewWidgetAfterLoading/profile_tab_view_after_loading_tablet_phone_widget.dart';
import '../controller/main_menu_tablet_phone_controller.dart';

class ProfileTabTabletPhoneWidget extends StatefulWidget {
  late final MainMenuTabletPhoneController controller;
  ProfileTabTabletPhoneWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<ProfileTabTabletPhoneWidget> createState() => _ProfileTabTabletPhoneWidgetState();
}

class _ProfileTabTabletPhoneWidgetState extends State<ProfileTabTabletPhoneWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
          () => Visibility(
          visible: widget.controller.isLoadingMainMenu.value,
          child: ProfileTabLoadingTabletPhoneWidget(controller: widget.controller),
          replacement: ProfileTabViewAfterLoadingTabletPhoneWidget(controller: widget.controller),
        ),
      ),
    );
  }
}
