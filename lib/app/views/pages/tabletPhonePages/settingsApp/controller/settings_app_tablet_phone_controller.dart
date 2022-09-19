import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../../../../../enums/enums.dart';
import '../../../../../utils/paths.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../mainMenu/widgets/componentTabWidget/card_profile_tab_list_tablet_phone_widget.dart';

class SettingsAppTabletPhoneController extends GetxController {
  late SharedPreferences sharedPreferences;
  late List<CardProfileTabListTabletPhoneWidget> cardSettingsList;

  SettingsAppTabletPhoneController(){
    _initializeVariables();
    _initializeList();
  }

  @override
  void onInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
    super.onInit();
  }

  _initializeVariables(){

  }

  _initializeList(){
    cardSettingsList = [
      CardProfileTabListTabletPhoneWidget(
        iconCard: Image.asset(
          Paths.Icone_Configuracao_Biometria_Menu,
          height: 4.5.h,
          width: 4.5.h,
        ),
        titleIconPath: "Configuração da Digital",
        page: destinationsPages.fingerPrintSetting,
      ),
      CardProfileTabListTabletPhoneWidget(
        iconCard: SvgPicture.asset(
          Paths.Icone_Redefinir_Senha,
          height: 4.5.h,
          width: 4.5.h,
        ),
        titleIconPath: "Redefinir Senha",
        page: destinationsPages.resetPassword,
      ),
      CardProfileTabListTabletPhoneWidget(
        iconCard: Image.asset(
          Paths.Icone_Scanner_Code,
          height: 4.5.h,
          width: 4.5.h,
        ),
        titleIconPath: "Vincular SmartWatch",
        page: destinationsPages.connectToSmartWatch,
      ),
    ];
  }
}