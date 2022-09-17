import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/paths.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../../../utils/reorderer_lists.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controller/settings_app_tablet_phone_controller.dart';
import '../../shared/widgets/information_container_tablet_phone_widget.dart';
import '../../shared/widgets/title_with_back_button_tablet_phone_widget.dart';

class SettingsAppTabletPhonePage extends StatefulWidget {
  const SettingsAppTabletPhonePage({Key? key}) : super(key: key);

  @override
  State<SettingsAppTabletPhonePage> createState() => _SettingsAppTabletPhonePageState();
}

class _SettingsAppTabletPhonePageState extends State<SettingsAppTabletPhonePage> {
  late SettingsAppTabletPhoneController controller;

  @override
  void initState() {
    controller = Get.put(SettingsAppTabletPhoneController());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.transparentColor,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: AppColors.backgroundFirstScreenColor,
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: SvgPicture.asset(
                  Paths.Ilustracao_Topo,
                  width: 25.w,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.h),
                      child: TitleWithBackButtonTabletPhoneWidget(
                        title: "Configurações",
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InformationContainerTabletPhoneWidget(
                            iconPath: Paths.Icone_Configuracao,
                            textColor: AppColors.whiteColor,
                            backgroundColor: AppColors.purpleDefaultColor,
                            informationText: "Configurações do Aplicativo",
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.h),
                              child: ReorderableListView.builder(
                                itemCount: controller.cardSettingsList.length,
                                itemBuilder: (context, index){
                                  return Container(
                                    key: Key("$index"),
                                    child: controller.cardSettingsList[index],
                                  );
                                },
                                onReorder: (oldIndex, newIndex) {
                                  var newList = ReorderListHelper.reorderList(
                                    oldIndex,
                                    newIndex,
                                    controller.cardSettingsList,
                                  );
                                  //TODO Fazer um método para salvar a nova lista
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
