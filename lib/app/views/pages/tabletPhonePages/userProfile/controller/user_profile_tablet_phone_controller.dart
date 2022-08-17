import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:projeto_tcc/app/utils/logged_user.dart';
import '../../../../../utils/brazil_address_informations.dart';
import '../../../../../utils/valid_cellphone_mask.dart';
import '../../../../stylePages/masks_for_text_fields.dart';
import '../../shared/popups/information_tablet_phone_popup.dart';
import '../../shared/widgets/loading_with_success_or_error_tablet_phone_widget.dart';
import '../widgets/edit_academic_tab_tablet_phone_widget.dart';
import '../widgets/edit_address_tab_tablet_phone_widget.dart';
import '../widgets/edit_contact_tab_tablet_phone_widget.dart';
import '../widgets/edit_profile_tab_tablet_phone_widget.dart';

class UserProfileTabletPhoneController extends GetxController {
  late String nameInitials;
  late String disciplineName;
  late RxString userName;
  late RxString ufSelected;
  late RxString periodSelected;
  late RxString buttonText;
  late RxBool hasPicture;
  late RxBool currentPasswordFieldEnabled;
  late RxBool newPasswordFieldEnabled;
  late RxBool confirmNewPasswordFieldEnabled;
  late RxBool profileIsDisabled;
  late RxBool loadingAnimation;
  late TabController tabController;
  late TextEditingController nameTextController;
  late TextEditingController raTextController;
  late TextEditingController birthDateTextController;
  late TextEditingController cpfTextController;
  late TextEditingController cepTextController;
  late TextEditingController cityTextController;
  late TextEditingController streetTextController;
  late TextEditingController houseNumberTextController;
  late TextEditingController neighborhoodTextController;
  late TextEditingController complementTextController;
  late TextEditingController phoneTextController;
  late TextEditingController cellPhoneTextController;
  late TextEditingController emailTextController;
  late TextEditingController confirmEmailTextController;
  late TextEditingController institutionTextController;
  late TextEditingController courseTextController;
  late TextEditingController currentPasswordTextController;
  late TextEditingController newPasswordTextController;
  late TextEditingController confirmNewPasswordTextController;
  late MaskTextInputFormatter maskCellPhoneFormatter;
  late List<Widget> tabsList;
  late List<String> periodList;
  late RxList<String> ufsList;
  late LoadingWithSuccessOrErrorTabletPhoneWidget loadingWithSuccessOrErrorTabletPhoneWidget;

  UserProfileTabletPhoneController(){
    _initializeVariables();
    _getUfsNames();
    _getUserInformation();
    _initializeLists();
  }

  _initializeVariables(){
    nameInitials = LoggedUser.nameInitials;
    disciplineName = LoggedUser.courseName;
    userName = LoggedUser.nameAndLastName.obs;
    ufSelected = "".obs;
    periodSelected = "".obs;
    buttonText = "EDITAR".obs;
    hasPicture = false.obs;
    profileIsDisabled = true.obs;
    loadingAnimation = false.obs;
    currentPasswordFieldEnabled = true.obs;
    newPasswordFieldEnabled = true.obs;
    confirmNewPasswordFieldEnabled = true.obs;
    ufsList = [""].obs;
    nameTextController = TextEditingController();
    raTextController = TextEditingController();
    birthDateTextController = TextEditingController();
    cpfTextController = TextEditingController();
    cepTextController = TextEditingController();
    cityTextController = TextEditingController();
    streetTextController = TextEditingController();
    houseNumberTextController = TextEditingController();
    neighborhoodTextController = TextEditingController();
    complementTextController = TextEditingController();
    phoneTextController = TextEditingController();
    cellPhoneTextController = TextEditingController();
    emailTextController = TextEditingController();
    confirmEmailTextController = TextEditingController();
    institutionTextController = TextEditingController();
    courseTextController = TextEditingController();
    currentPasswordTextController = TextEditingController();
    newPasswordTextController = TextEditingController();
    confirmNewPasswordTextController = TextEditingController();
    maskCellPhoneFormatter = MasksForTextFields.phoneNumberAcceptExtraNumberMask;
    loadingWithSuccessOrErrorTabletPhoneWidget = LoadingWithSuccessOrErrorTabletPhoneWidget(
      loadingAnimation: loadingAnimation,
    );
  }

  _getUfsNames() async {
    ufsList.clear();
    List<String> states = await BrazilAddressInformations.getUfsNames();
    for(var uf in states) {
      ufsList.add(uf);
    }
  }

  _getUserInformation(){
    nameTextController.text = LoggedUser.name;
    raTextController.text = LoggedUser.ra.toString();
    birthDateTextController.text = LoggedUser.birthdate;
    cpfTextController.text = LoggedUser.cpf;
    cepTextController.text = LoggedUser.cep;
    cityTextController.text = LoggedUser.city;
    streetTextController.text = LoggedUser.street;
    houseNumberTextController.text = LoggedUser.houseNumber.toString();
    neighborhoodTextController.text = LoggedUser.neighborhood;
    complementTextController.text = LoggedUser.complement;
    phoneTextController.text = LoggedUser.phone ?? "";
    cellPhoneTextController.text = LoggedUser.cellPhone ?? "";
    emailTextController.text = LoggedUser.email;
    institutionTextController.text = LoggedUser.educationInstitutionName;
    courseTextController.text = LoggedUser.courseName;
  }

  _initializeLists(){
    periodList = [
      "Matutino",
      "Vespertino",
      "Noturno",
      "Integral",
    ];

    tabsList = <Widget> [
      EditProfileTabTabletPhoneWidget(),
      EditAddressTabTabletPhoneWidget(),
      EditContactTabTabletPhoneWidget(),
      EditAcademicTabTabletPhoneWidget(),
    ];
  }

  phoneTextFieldEdited(String cellPhoneTyped){
    cellPhoneTextController.value = ValidCellPhoneMask.updateCellPhoneMask(
      cellPhoneTyped,
      maskCellPhoneFormatter,
    );
  }

  editButtonPressed() async {
    if(profileIsDisabled.value){
      buttonText.value = "SALVAR";
      profileIsDisabled.value = false;
    }
    else{
      loadingAnimation.value = true;
      await loadingWithSuccessOrErrorTabletPhoneWidget.startAnimation();
      await Future.delayed(Duration(milliseconds: 500));
      await showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return InformationTabletPhonePopup(
            warningMessage: "Informações Atualizadas com Sucesso",
          );
        },
      );
      buttonText.value = "EDITAR";
      profileIsDisabled.value = true;
    }
  }
}