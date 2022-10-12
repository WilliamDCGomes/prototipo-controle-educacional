import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:projeto_tcc/app/enums/enums.dart';
import 'package:projeto_tcc/app/utils/logged_user.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/mainMenu/page/main_menu_tablet_phone_page.dart';
import 'package:projeto_tcc/base/models/user.dart';
import '../../../../../../base/models/address_information.dart';
import '../../../../../../base/services/consult_cep_service.dart';
import '../../../../../../base/services/interfaces/iconsult_cep_service.dart';
import '../../../../../../base/services/interfaces/irequest_registration_cancellation_service.dart';
import '../../../../../../base/services/interfaces/iuser_service.dart';
import '../../../../../../base/services/request_registration_cancellation_service.dart';
import '../../../../../../base/services/user_service.dart';
import '../../../../../utils/brazil_address_informations.dart';
import '../../../../../utils/get_profile_picture_controller.dart';
import '../../../../../utils/internet_connection.dart';
import '../../../../../utils/text_field_validators.dart';
import '../../../../../utils/valid_cellphone_mask.dart';
import '../../../../stylePages/masks_for_text_fields.dart';
import '../../shared/popups/information_tablet_phone_popup.dart';
import '../../shared/widgets/loading_with_success_or_error_tablet_phone_widget.dart';
import '../widget/user_profile_tabs_widget.dart';

class UserProfileTabletPhoneController extends GetxController {
  late String disciplineName;
  late RxString nameInitials;
  late RxString userName;
  late RxString ufSelected;
  late RxString periodSelected;
  late RxString buttonText;
  late RxString genderSelected;
  late RxString profileImagePath;
  late RxBool hasPicture;
  late RxBool loadingPicture;
  late RxBool currentPasswordFieldEnabled;
  late RxBool newPasswordFieldEnabled;
  late RxBool confirmNewPasswordFieldEnabled;
  late RxBool profileIsDisabled;
  late RxBool loadingAnimation;
  late RxBool nameInputHasError;
  late RxBool otherGenderInputHasError;
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
  late RxBool enableRegistrationCancellation;
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
  late MaskTextInputFormatter maskCellPhoneFormatter;
  late List<Widget> tabsList;
  late List<String> periodList;
  late List<String> genderList;
  late RxList<String> ufsList;
  late XFile? profilePicture;
  late final ImagePicker _picker;
  late LoadingWithSuccessOrErrorTabletPhoneWidget loadingWithSuccessOrErrorTabletPhoneWidget;
  late Users user;
  late IConsultCepService consultCepService;
  late IUserService userService;
  late IRequestRegistrationCancellationService _requestRegistrationCancellationService;

  UserProfileTabletPhoneController(){
    _initializeVariables();
    _getUfsNames();
    _initializeLists();
    _getUserInformation();
  }

  @override
  void onInit() async {
    await _checkCancellationVisibility();
    await GetProfilePictureController.loadProfilePicture(
      loadingPicture,
      hasPicture,
      profileImagePath,
      userService,
    );
    super.onInit();
  }

  _initializeVariables(){
    disciplineName = LoggedUser.courseName;
    nameInitials = LoggedUser.nameInitials.obs;
    userName = LoggedUser.nameAndLastName.obs;
    ufSelected = "".obs;
    periodSelected = "".obs;
    buttonText = "EDITAR".obs;
    genderSelected = "".obs;
    profileImagePath = "".obs;
    hasPicture = false.obs;
    loadingPicture = false.obs;
    profileIsDisabled = true.obs;
    loadingAnimation = false.obs;
    currentPasswordFieldEnabled = true.obs;
    newPasswordFieldEnabled = true.obs;
    confirmNewPasswordFieldEnabled = true.obs;
    nameInputHasError = false.obs;
    otherGenderInputHasError = false.obs;
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
    enableRegistrationCancellation = false.obs;
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
    birthDateFocusNode = FocusNode();
    streetFocusNode = FocusNode();
    houseNumberFocusNode = FocusNode();
    neighborhoodFocusNode = FocusNode();
    complementFocusNode = FocusNode();
    cellPhoneFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    confirmEmailFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
    _picker = ImagePicker();
    maskCellPhoneFormatter = MasksForTextFields.phoneNumberAcceptExtraNumberMask;
    loadingWithSuccessOrErrorTabletPhoneWidget = LoadingWithSuccessOrErrorTabletPhoneWidget(
      loadingAnimation: loadingAnimation,
    );
    user = Users();
    consultCepService = ConsultCepService();
    userService = UserService();
    _requestRegistrationCancellationService = RequestRegistrationCancellationService();
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

    tabsList = UserProfileTabsWidget.getList(this);
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

  _checkCancellationVisibility() async {
    enableRegistrationCancellation.value = !await _requestRegistrationCancellationService.checkRegistrationCancellationAlrightExist(LoggedUser.cpf);
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
    user.includeDate = LoggedUser.includeDate;
    user.lastChange = DateTime.now();
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
    LoggedUser.includeDate = user.includeDate;
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

      if(!_validProfile()){
        return;
      }
      else if(_validPersonalInformationAndAdvanceNextStep()){
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

  bool _validProfile(){
    try{
      if(nameTextController.text == ""){
        nameInputHasError.value = true;
        tabController.index = 0;
        throw "Informe o seu Nome";
      }
      else{
        nameInputHasError.value = false;
      }

      String? birthDateValidation = TextFieldValidators.birthDayValidation(birthDateTextController.text, "de Nascimento");
      if(birthDateValidation != null && birthDateValidation != ""){
        birthdayInputHasError.value = true;
        tabController.index = 0;
        throw birthDateValidation;
      }
      else{
        birthdayInputHasError.value = false;
      }

      if(showOtherGenderType.value && otherGenderTypeTextController.text == ""){
        otherGenderInputHasError.value = true;
        tabController.index = 0;
        throw "Informe o seu sexo.";
      }
      else{
        otherGenderInputHasError.value = false;
      }

      String? cepValidation = TextFieldValidators.minimumNumberValidation(
        cepTextController.text,
        9,
        "Cep",
      );
      if(cepValidation != null && cepValidation != ""){
        cepInputHasError.value = true;
        tabController.index = 1;
        throw cepValidation;
      }
      else{
        cepInputHasError.value = false;
      }

      String? cityValidation = TextFieldValidators.standardValidation(cityTextController.text, "Informe a Cidade");
      if(cityValidation != null && cityValidation != ""){
        cityInputHasError.value = true;
        tabController.index = 1;
        throw cityValidation;
      }
      else{
        cityInputHasError.value = false;
      }

      String? streetValidation = TextFieldValidators.standardValidation(streetTextController.text, "Informe o Logradouro");
      if(streetValidation != null && streetValidation != ""){
        streetInputHasError.value = true;
        tabController.index = 1;
        throw streetValidation;
      }
      else{
        streetInputHasError.value = false;
      }

      String? neighborhoodValidation = TextFieldValidators.standardValidation(neighborhoodTextController.text, "Informe o Bairro");
      if(neighborhoodValidation != null && neighborhoodValidation != ""){
        neighborhoodInputHasError.value = true;
        tabController.index = 1;
        throw neighborhoodValidation;
      }
      else{
        neighborhoodInputHasError.value = false;
      }

      String? phoneValidation = TextFieldValidators.phoneValidation(phoneTextController.text);
      if(phoneValidation != null && phoneValidation != ""){
        phoneInputHasError.value = true;
        tabController.index = 2;
        throw phoneValidation;
      }
      else{
        phoneInputHasError.value = false;
      }

      String? cellPhoneValidation = TextFieldValidators.cellPhoneValidation(cellPhoneTextController.text);
      if(cellPhoneValidation != null && cellPhoneValidation != ""){
        cellPhoneInputHasError.value = true;
        tabController.index = 2;
        throw cellPhoneValidation;
      }
      else{
        cellPhoneInputHasError.value = false;
      }

      String? emailValidation = TextFieldValidators.emailValidation(emailTextController.text);
      if(emailValidation != null && emailValidation != ""){
        emailInputHasError.value = true;
        tabController.index = 2;
        throw emailValidation;
      }
      else{
        emailInputHasError.value = false;
      }

      String? confirmEmailvalidation = TextFieldValidators.emailConfirmationValidation(
          emailTextController.text,
          confirmEmailTextController.text,
      );
      if(confirmEmailvalidation != null && confirmEmailvalidation != ""){
        confirmEmailInputHasError.value = true;
        tabController.index = 2;
        throw confirmEmailvalidation;
      }
      else{
        confirmEmailInputHasError.value = false;
      }
      return true;
    }
    catch(e){
      showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return InformationTabletPhonePopup(
            warningMessage: e.toString(),
          );
        },
      );
      return false;
    }
  }

  getProfileImage(imageOrigin origin) async {
    try{
      profilePicture = await _picker.pickImage(
        source: origin == imageOrigin.camera ?
          ImageSource.camera : ImageSource.gallery
      );
      if(profilePicture != null){
        await _saveProfilePicture();
      }
    }
    catch(_){
      showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return InformationTabletPhonePopup(
            warningMessage: "Erro ao atualizar a imagem de perfil.",
          );
        },
      );
    }
  }

  _saveProfilePicture() async {
    await userService.sendUserProfilePicture(profilePicture!, _progressImage);
  }

  _progressImage(TaskSnapshot storageEvent) async {
    if(storageEvent.state == TaskState.running){
      loadingPicture.value = true;
    }
    else if(storageEvent.state == TaskState.success){
      await GetProfilePictureController.loadProfilePicture(
        loadingPicture,
        hasPicture,
        profileImagePath,
        userService,
      );
    }
    else if(storageEvent.state == TaskState.error){
      loadingPicture.value = false;
      hasPicture.value = false;
    }
  }

  Future<bool> _saveStudent() async {
    int trys = 0;

    while(true){
      try{
        if(await userService.updateUser(user)) {
          loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation();
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