import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:projeto_tcc/app/utils/logged_user.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/mainMenu/page/main_menu_tablet_phone_page.dart';
import 'package:projeto_tcc/base/models/user.dart';
import '../../../../../../base/models/address_information.dart';
import '../../../../../../base/services/consult_cep_service.dart';
import '../../../../../../base/services/interfaces/iconsult_cep_service.dart';
import '../../../../../../base/services/interfaces/iuser_service.dart';
import '../../../../../../base/services/user_service.dart';
import '../../../../../utils/brazil_address_informations.dart';
import '../../../../../utils/internet_connection.dart';
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
  late RxString genderSelected;
  late RxBool hasPicture;
  late RxBool currentPasswordFieldEnabled;
  late RxBool newPasswordFieldEnabled;
  late RxBool confirmNewPasswordFieldEnabled;
  late RxBool profileIsDisabled;
  late RxBool loadingAnimation;
  late RxBool nameInputHasError;
  late RxBool birthdayInputHasError;
  late RxBool showOtherGenderType;
  late RxBool cepInputHasError;
  late RxBool cityInputHasError;
  late RxBool streetInputHasError;
  late RxBool neighborhoodInputHasError;
  late RxBool phoneInputHasError;
  late RxBool cellPhoneInputHasError;
  late RxBool emailInputHasError;
  late RxBool confirmEmailInputHasError;
  late TabController tabController;
  late TextEditingController nameTextController;
  late TextEditingController raTextController;
  late TextEditingController otherGenderTypeTextController;
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
  late FocusNode birthDateFocusNode;
  late FocusNode streetFocusNode;
  late FocusNode houseNumberFocusNode;
  late FocusNode neighborhoodFocusNode;
  late FocusNode complementFocusNode;
  late FocusNode cellPhoneFocusNode;
  late FocusNode emailFocusNode;
  late FocusNode confirmEmailFocusNode;
  late FocusNode confirmPasswordFocusNode;
  late final GlobalKey<FormState> formKeyPersonalInformation;
  late final GlobalKey<FormState> formKeyAddressInformation;
  late final GlobalKey<FormState> formKeyContactInformation;
  late MaskTextInputFormatter maskCellPhoneFormatter;
  late List<Widget> tabsList;
  late List<String> periodList;
  late List<String> genderList;
  late RxList<String> ufsList;
  late LoadingWithSuccessOrErrorTabletPhoneWidget loadingWithSuccessOrErrorTabletPhoneWidget;
  late Users user;
  late IConsultCepService consultCepService;
  late IUserService userService;

  UserProfileTabletPhoneController(){
    _initializeVariables();
    _getUfsNames();
    _initializeLists();
    _getUserInformation();
  }

  _initializeVariables(){
    nameInitials = LoggedUser.nameInitials;
    disciplineName = LoggedUser.courseName;
    userName = LoggedUser.nameAndLastName.obs;
    ufSelected = "".obs;
    periodSelected = "".obs;
    buttonText = "EDITAR".obs;
    genderSelected = "".obs;
    hasPicture = false.obs;
    profileIsDisabled = true.obs;
    loadingAnimation = false.obs;
    currentPasswordFieldEnabled = true.obs;
    newPasswordFieldEnabled = true.obs;
    confirmNewPasswordFieldEnabled = true.obs;
    nameInputHasError = false.obs;
    birthdayInputHasError = false.obs;
    showOtherGenderType = false.obs;
    cepInputHasError = false.obs;
    cityInputHasError = false.obs;
    streetInputHasError = false.obs;
    neighborhoodInputHasError = false.obs;
    phoneInputHasError = false.obs;
    cellPhoneInputHasError = false.obs;
    emailInputHasError = false.obs;
    confirmEmailInputHasError = false.obs;
    ufsList = [""].obs;
    nameTextController = TextEditingController();
    raTextController = TextEditingController();
    otherGenderTypeTextController = TextEditingController();
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
    formKeyPersonalInformation = GlobalKey<FormState>();
    formKeyAddressInformation = GlobalKey<FormState>();
    formKeyContactInformation = GlobalKey<FormState>();
    birthDateFocusNode = FocusNode();
    streetFocusNode = FocusNode();
    houseNumberFocusNode = FocusNode();
    neighborhoodFocusNode = FocusNode();
    complementFocusNode = FocusNode();
    cellPhoneFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    confirmEmailFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
    maskCellPhoneFormatter = MasksForTextFields.phoneNumberAcceptExtraNumberMask;
    loadingWithSuccessOrErrorTabletPhoneWidget = LoadingWithSuccessOrErrorTabletPhoneWidget(
      loadingAnimation: loadingAnimation,
    );
    user = Users();
    consultCepService = ConsultCepService();
    userService = UserService();
  }

  _getUfsNames() async {
    ufsList.clear();
    List<String> states = await BrazilAddressInformations.getUfsNames();
    for(var uf in states) {
      ufsList.add(uf);
    }
  }

  _initializeLists(){
    periodList = [
      "Matutino",
      "Vespertino",
      "Noturno",
      "Integral",
    ];

    genderList = [
      "Masculino",
      "Feminino",
      "Outro (Qual?)",
      "Prefiro não dizer",
    ];

    tabsList = <Widget> [
      Form(
        key: formKeyPersonalInformation,
        child: EditProfileTabTabletPhoneWidget(),
      ),
      Form(
        key: formKeyAddressInformation,
        child: EditAddressTabTabletPhoneWidget(),
      ),
      Form(
        key: formKeyContactInformation,
        child: EditContactTabTabletPhoneWidget(),
      ),
      EditAcademicTabTabletPhoneWidget(),
    ];
  }

  _getUserInformation(){
    nameTextController.text = LoggedUser.name;
    raTextController.text = LoggedUser.ra.toString();
    birthDateTextController.text = LoggedUser.birthdate;
    genderSelected.value = LoggedUser.gender;
    showOtherGenderType.value = genderSelected.value == "Outro (Qual?)";
    otherGenderTypeTextController.text = showOtherGenderType.value ? LoggedUser.gender : "";
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
    confirmEmailTextController.text = LoggedUser.email;
    institutionTextController.text = LoggedUser.educationInstitutionName;
    courseTextController.text = LoggedUser.courseName;
    ufSelected.value = LoggedUser.uf;
    periodSelected.value = LoggedUser.period;
  }

  bool _validPersonalInformationAndAdvanceNextStep() {
    if(genderSelected.value == "" || (genderSelected.value == "Outro (Qual?)" && otherGenderTypeTextController.text == "")){
      showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return InformationTabletPhonePopup(
            warningMessage: "Informe o seu sexo.",
          );
        },
      );
      return false;
    }
    return true;
  }

  phoneTextFieldEdited(String cellPhoneTyped){
    cellPhoneTextController.value = ValidCellPhoneMask.updateCellPhoneMask(
      cellPhoneTyped,
      maskCellPhoneFormatter,
    );
  }

  searchAddressInformation() async {
    int trys = 1;
    while(true){
      try{
        if(cepTextController.text.length == 9){
          AddressInformation? addressInformation = await consultCepService.searchCep(cepTextController.text);
          if(addressInformation != null){
            ufSelected.value = addressInformation.uf;
            cityTextController.text = addressInformation.city;
            streetTextController.text = addressInformation.street;
            neighborhoodTextController.text = addressInformation.neighborhood;
            complementTextController.text = addressInformation.complement;
            formKeyAddressInformation.currentState!.validate();
            break;
          }
          else{
            ufSelected.value = "";
            cityTextController.text = "";
            streetTextController.text = "";
            neighborhoodTextController.text = "";
            complementTextController.text = "";
          }
        }
      }
      catch(_){
        ufSelected.value = "";
        cityTextController.text = "";
        streetTextController.text = "";
        neighborhoodTextController.text = "";
        complementTextController.text = "";
      }
      finally{
        trys++;
        if(trys > 3){
          break;
        }
        else {
          continue;
        }
      }
    }
  }

  _setUserToUpdate(){
    user.name = nameTextController.text;
    user.birthdate = birthDateTextController.text;
    user.gender = genderSelected.value != "" ? genderSelected.value : otherGenderTypeTextController.text;
    user.cep = cepTextController.text;
    user.uf = ufSelected.value;
    user.city = cityTextController.text;
    user.street = streetTextController.text;
    user.houseNumber = houseNumberTextController.text;
    user.neighborhood = neighborhoodTextController.text;
    user.complement = complementTextController.text;
    user.phone = phoneTextController.text;
    user.cellPhone = cellPhoneTextController.text;
    user.email = emailTextController.text;
    user.id = LoggedUser.id;
    user.cpf = LoggedUser.cpf;
    user.lastChange = LoggedUser.lastChange;
  }

  _updateLocaleUser(){
    nameTextController.text = user.name;
    birthDateTextController.text = user.birthdate;
    genderSelected.value = user.gender;
    cepTextController.text = user.cep;
    ufSelected.value = user.uf;
    cityTextController.text = user.city;
    streetTextController.text = user.street;
    houseNumberTextController.text = user.houseNumber ?? "";
    neighborhoodTextController.text = user.neighborhood;
    complementTextController.text = user.complement;
    phoneTextController.text = user.phone ?? "";
    cellPhoneTextController.text = user.cellPhone ?? "";
    emailTextController.text = user.email;
    LoggedUser.id = user.id;
    LoggedUser.cpf = user.cpf;
    LoggedUser.lastChange = user.lastChange;
  }

  editButtonPressed() async {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    if(profileIsDisabled.value){
      buttonText.value = "SALVAR";
      profileIsDisabled.value = false;
    }
    else{
      loadingAnimation.value = true;
      await loadingWithSuccessOrErrorTabletPhoneWidget.startAnimation();

      await Future.delayed(Duration(seconds: 1));

      if(!await InternetConnection.validInternet(
        "É necessário uma conexão com a internet para fazer o cadastro",
        loadingAnimation,
        loadingWithSuccessOrErrorTabletPhoneWidget,
      )){
        return;
      }

      /*if(!formKeyPersonalInformation.currentState!.validate()){
        return;
      }
      else if(!formKeyAddressInformation.currentState!.validate()){
        return;
      }
      else if(!formKeyContactInformation.currentState!.validate()){
        return;
      }
      else */if(_validPersonalInformationAndAdvanceNextStep()){
        _setUserToUpdate();

        if(await _saveStudent()){
          await showDialog(
            context: Get.context!,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return InformationTabletPhonePopup(
                warningMessage: "Perfil atualizado com sucesso!",
              );
            },
          );
          _updateLocaleUser();
          buttonText.value = "EDITAR";
          profileIsDisabled.value = true;
          Get.offAll(() => MainMenuTabletPhonePage());
        }
      }
    }
  }

  Future<bool> _saveStudent() async {
    int trys = 0;

    while(true){
      try{
        if(await userService.updateUser(user)) {
          await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation();
          return true;
        }
        else{
          throw Exception();
        }
      }
      catch(_){
        if(trys < 2){
          trys++;
          continue;
        }
        await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation(justLoading: true);
        showDialog(
          context: Get.context!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return InformationTabletPhonePopup(
              warningMessage: "Erro ao atualizar o perfil.\n Tente novamente mais tarde",
            );
          },
        );
        return false;
      }
    }
  }
}