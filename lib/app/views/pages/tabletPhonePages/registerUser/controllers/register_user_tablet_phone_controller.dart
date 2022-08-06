import 'package:crypt/crypt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:projeto_tcc/base/services/interfaces/istudent_service.dart';
import '../../../../../../base/models/address_information.dart';
import '../../../../../../base/models/education_institution.dart';
import '../../../../../../base/models/student.dart';
import '../../../../../../base/services/consult_cep_service.dart';
import '../../../../../../base/services/course_service.dart';
import '../../../../../../base/services/education_institution_service.dart';
import '../../../../../../base/services/interfaces/iconsult_cep_service.dart';
import '../../../../../../base/services/interfaces/icourse_service.dart';
import '../../../../../../base/services/interfaces/ieducation_institution_service.dart';
import '../../../../../../base/services/student_service.dart';
import '../../../../../helpers/brazil_address_informations.dart';
import '../../../../../helpers/loading.dart';
import '../../../../../helpers/valid_cellphone_mask.dart';
import '../../shared/popups/information_tablet_phone_popup.dart';
import '../widgets/body_register_stepper_tablet_phone_widget.dart';
import '../widgets/header_register_stepper_tablet_phone_widget.dart';
import '../../shared/widgets/loading_with_success_or_error_tablet_phone_widget.dart';
import '../pages/registration_completed_tablet_phone_page.dart';
import '../../../../stylePages/masks_for_text_fields.dart';

class RegisterUserTabletPhoneController extends GetxController {
  late String lgpdPhrase;
  late bool cepSearched;
  late RxInt activeStep;
  late RxBool passwordFieldEnabled;
  late RxBool loadingAnimetion;
  late RxBool confirmPasswordFieldEnabled;
  late RxBool nameInputHasError;
  late RxBool birthdayInputHasError;
  late RxBool cpfInputHasError;
  late RxBool cepInputHasError;
  late RxBool cityInputHasError;
  late RxBool streetInputHasError;
  late RxBool neighborhoodInputHasError;
  late RxBool courseDropdownDisable;
  late RxBool emailInputHasError;
  late RxBool confirmEmailInputHasError;
  late RxBool passwordInputHasError;
  late RxBool confirmPasswordInputHasError;
  late RxBool showOtherGenderType;
  late RxString ufSelected;
  late RxString genderSelected;
  late RxString educationInstitutionSelected;
  late RxString courseSelected;
  late RxString periodSelected;
  late List<String> genderList;
  late List<String> periodList;
  late List<EducationInstitution> educationInstitutionList;
  late RxList<String> educationInstitutionNameList;
  late RxList<String> courseList;
  late RxList<String> ufsList;
  late FocusNode cepInputFocusNode;
  late final GlobalKey<FormState> formKeyPersonalInformation;
  late final GlobalKey<FormState> formKeyAddressInformation;
  late final GlobalKey<FormState> formKeyContactInformation;
  late final GlobalKey<FormState> formKeyPasswordInformation;
  late MaskTextInputFormatter maskCellPhoneFormatter;
  late TextEditingController nameTextController;
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
  late TextEditingController pinPutSMSController;
  late TextEditingController pinPutEmailController;
  late TextEditingController emailVerification1TextController;
  late TextEditingController emailVerification2TextController;
  late TextEditingController emailVerification3TextController;
  late TextEditingController emailVerification4TextController;
  late TextEditingController emailVerification5TextController;
  late TextEditingController passwordTextController;
  late TextEditingController confirmPasswordTextController;
  late TextEditingController otherGenderTypeTextController;
  late List<HeaderRegisterStepperTabletPhoneWidget> headerRegisterStepperList;
  late List<BodyRegisterStepperTabletPhoneWidget> bodyRegisterStepperList;
  late LoadingWithSuccessOrErrorTabletPhoneWidget loadingWithSuccessOrErrorTabletPhoneWidget;
  late Student newStudent;
  late IStudentService studentService;
  late ICourseService courseService;
  late IConsultCepService consultCepService;
  late IEducationInstitutionService educationInstitutionService;

  RegisterUserTabletPhoneController(){
    _initializeVariables();
  }

  @override
  void onInit() async {
    await _getUfsNames();
    await _getEducationInstitutionsList();
    super.onInit();
  }

  _initializeVariables(){
    lgpdPhrase = "Ao avançar, você esta de acordo e concorda com as Políticas de Privacidade e com os Termos de Serviço.";
    activeStep = 0.obs;
    ufSelected = "".obs;
    genderSelected = "".obs;
    educationInstitutionSelected = "".obs;
    courseSelected = "".obs;
    periodSelected = "".obs;
    cepSearched = false;
    loadingAnimetion = false.obs;
    passwordFieldEnabled = true.obs;
    confirmPasswordFieldEnabled = true.obs;
    nameInputHasError = false.obs;
    birthdayInputHasError = false.obs;
    cpfInputHasError = false.obs;
    cepInputHasError = false.obs;
    cityInputHasError = false.obs;
    streetInputHasError = false.obs;
    neighborhoodInputHasError = false.obs;
    courseDropdownDisable = true.obs;
    emailInputHasError = false.obs;
    confirmEmailInputHasError = false.obs;
    passwordInputHasError = false.obs;
    confirmPasswordInputHasError = false.obs;
    showOtherGenderType = false.obs;
    ufsList = [""].obs;
    educationInstitutionNameList = [""].obs;
    educationInstitutionList = <EducationInstitution>[].obs;
    genderList = [
      "Masculino",
      "Feminino",
      "Outro (Qual?)",
      "Prefiro não dizer",
    ];
    courseList = [
      "",
    ].obs;
    periodList = [
      "Matutino",
      "Vespertino",
      "Noturno",
      "Integral",
    ];
    maskCellPhoneFormatter = MasksForTextFields.phoneNumberAcceptExtraNumberMask;
    formKeyPersonalInformation = GlobalKey<FormState>();
    formKeyAddressInformation = GlobalKey<FormState>();
    formKeyContactInformation = GlobalKey<FormState>();
    formKeyPasswordInformation = GlobalKey<FormState>();
    nameTextController = TextEditingController();
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
    pinPutSMSController = TextEditingController();
    pinPutEmailController = TextEditingController();
    emailVerification1TextController = TextEditingController();
    emailVerification2TextController = TextEditingController();
    emailVerification3TextController = TextEditingController();
    emailVerification4TextController = TextEditingController();
    emailVerification5TextController = TextEditingController();
    passwordTextController = TextEditingController();
    confirmPasswordTextController = TextEditingController();
    otherGenderTypeTextController = TextEditingController();
    loadingWithSuccessOrErrorTabletPhoneWidget = LoadingWithSuccessOrErrorTabletPhoneWidget(
      loadingAnimetion: loadingAnimetion,
    );
    headerRegisterStepperList = [
      HeaderRegisterStepperTabletPhoneWidget(
        firstText: "PASSO 1 DE 7",
        secondText: "Dados Pessoais",
        thirdText: "Informe os dados pessoais para continuar o cadastro.",
      ),
      HeaderRegisterStepperTabletPhoneWidget(
        firstText: "PASSO 2 DE 7",
        secondText: "Endereço",
        thirdText: "Informe os dados do seu endereço para continuar o cadastro.",
      ),
      HeaderRegisterStepperTabletPhoneWidget(
        firstText: "PASSO 3 DE 7",
        secondText: "Dados Institucionais",
        thirdText: "Preencha os dados institucionais para identificarmos você em nosso sistema.",
      ),
      HeaderRegisterStepperTabletPhoneWidget(
        firstText: "PASSO 4 DE 7",
        secondText: "Dados de Contato",
        thirdText: "Preencha os dados de contato para que seja possível a comunicação.",
      ),
      HeaderRegisterStepperTabletPhoneWidget(
        firstText: "PASSO 5 DE 7",
        secondText: "Confirmação Telefone",
        thirdText: "Informe o código de verificação enviado por SMS para o número informado.",
      ),
      HeaderRegisterStepperTabletPhoneWidget(
        firstText: "PASSO 6 DE 7",
        secondText: "Confirmação E-mail",
        thirdText: "Informe o código de verificação enviado por E-mail para o endereço informado.",
      ),
      HeaderRegisterStepperTabletPhoneWidget(
        firstText: "PASSO 7 DE 7",
        secondText: "Senha de Acesso",
        thirdText: "Crie uma senha para realizar o acesso na plataforma.",
      ),
    ];
    bodyRegisterStepperList = [
      BodyRegisterStepperTabletPhoneWidget(
        indexView: 0,
        controller: this,
      ),
      BodyRegisterStepperTabletPhoneWidget(
        indexView: 1,
        controller: this,
      ),
      BodyRegisterStepperTabletPhoneWidget(
        indexView: 2,
        controller: this,
      ),
      BodyRegisterStepperTabletPhoneWidget(
        indexView: 3,
        controller: this,
      ),
      BodyRegisterStepperTabletPhoneWidget(
        indexView: 4,
        controller: this,
      ),
      BodyRegisterStepperTabletPhoneWidget(
        indexView: 5,
        controller: this,
      ),
      BodyRegisterStepperTabletPhoneWidget(
        indexView: 6,
        controller: this,
      ),
    ];
    cepInputFocusNode = FocusNode();
    cepInputFocusNode.addListener(() async {
      if(!cepSearched && !cepInputFocusNode.hasFocus){
        await Loading.startAndPauseLoading(
          () => _searchAddressInformation(),
          loadingAnimetion,
          loadingWithSuccessOrErrorTabletPhoneWidget,
        );
      }
    });
    newStudent = Student();
    studentService = StudentService();
    courseService = CourseService();
    consultCepService = ConsultCepService();
    educationInstitutionService = EducationInstitutionService();
  }

  _searchAddressInformation() async {
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
        }
        else{
          ufSelected.value = "";
          cityTextController.text = "";
          streetTextController.text = "";
          neighborhoodTextController.text = "";
          complementTextController.text = "";
        }
        cepSearched = true;
      }
    }
    catch(_){
      cepSearched = false;
      ufSelected.value = "";
      cityTextController.text = "";
      streetTextController.text = "";
      neighborhoodTextController.text = "";
      complementTextController.text = "";
    }
  }

  _getUfsNames() async {
    try{
      ufsList.clear();
      List<String> states = await BrazilAddressInformations.getUfsNames();
      for(var uf in states) {
        ufsList.add(uf);
      }
    }
    catch(_){
      ufsList.clear();
    }
  }

  _getEducationInstitutionsList() async {
    try{
      educationInstitutionList.clear();
      educationInstitutionNameList.clear();
      List<EducationInstitution> institutions = await educationInstitutionService.getEducationInstitutions();
      educationInstitutionList.addAll(institutions);

      for(var educationInstitution in educationInstitutionList){
        educationInstitutionNameList.add(educationInstitution.name);
      }
    }
    catch(_){
      educationInstitutionList.clear();
    }
  }

  _checkCpfAlreadyExists() async {
    if(await studentService.verificationStudentExists(cpfTextController.text)){
      showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return InformationTabletPhonePopup(
            warningMessage: "O CPF já está cadastrado no sistema.",
          );
        },
      );
    }
    else if(genderSelected.value == "" || (genderSelected.value == "Outro (Qual?)" && otherGenderTypeTextController.text == "")){
      showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return InformationTabletPhonePopup(
            warningMessage: "Informe o seu sexo.",
          );
        },
      );
    }
    else{
      newStudent.name = nameTextController.text;
      newStudent.birthdate = birthDateTextController.text;
      newStudent.cpf = cpfTextController.text;
      newStudent.gender = genderSelected.value != "" ? genderSelected.value : otherGenderTypeTextController.text;
      _nextPage();
    }
  }

  Future<bool> _validSchoolInformation() async {
    if(educationInstitutionSelected.value == ""){
      await showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return InformationTabletPhonePopup(
            warningMessage: "Informe a Instituição de Ensino.",
          );
        },
      );
      return false;
    }
    else if(courseSelected.value == ""){
      await showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return InformationTabletPhonePopup(
            warningMessage: "Informe o nome do curso.",
          );
        },
      );
      return false;
    }
    else if(periodSelected.value == ""){
      await showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return InformationTabletPhonePopup(
            warningMessage: "Informe o período do curso.",
          );
        },
      );
      return false;
    }

    return true;
  }

  _nextPage() async {
    if(activeStep.value < 6)
      activeStep.value ++;
    else{
      await Loading.starAnimationAndCallOtherPage(
        () => _saveStudent(),
        loadingAnimetion,
        loadingWithSuccessOrErrorTabletPhoneWidget,
        RegistrationCompletedTabletPhone(),
      );
    }
  }

  _saveStudent() async {
    await studentService.sendNewStudent(newStudent);
  }

  searchCoursesOfEducationInstitution() async {
    try{
      courseList.clear();
      courseSelected.value = "";
      EducationInstitution educationInstitution = educationInstitutionList.firstWhere(
        (element) => element.name == educationInstitutionSelected.value
      );

      for(var course in  educationInstitution.courses){
        courseList.add(await courseService.getCourseNameById(course));
      }
    }
    catch(_){
      await showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return InformationTabletPhonePopup(
            warningMessage: "Não foi possível encontrar nenhum curso dessa Instituição.",
          );
        },
      );
    }
  }

  nextButtonPressed() async {
    switch(activeStep.value){
      case 0:
        if(formKeyPersonalInformation.currentState!.validate()){
          Loading.startAndPauseLoading(
            () => _checkCpfAlreadyExists(),
            loadingAnimetion,
            loadingWithSuccessOrErrorTabletPhoneWidget,
          );
        }
        break;
      case 1:
        if(cepTextController.text.length == 9 && !cepSearched){
          await Loading.startAndPauseLoading(
            () => _searchAddressInformation(),
            loadingAnimetion,
            loadingWithSuccessOrErrorTabletPhoneWidget,
          );
          return;
        }
        if(formKeyAddressInformation.currentState!.validate()){
          newStudent.cep = cepTextController.text;
          newStudent.uf = ufSelected.value;
          newStudent.city = cityTextController.text;
          newStudent.street = streetTextController.text;
          newStudent.houseNumber = houseNumberTextController.text;
          newStudent.neighborhood = neighborhoodTextController.text;
          newStudent.complement = complementTextController.text;
          _nextPage();
        }
        break;
      case 2:
        if(await _validSchoolInformation()){
          newStudent.educationInstitutionName = educationInstitutionSelected.value;
          newStudent.course = courseSelected.value;
          newStudent.period = periodSelected.value;
          _nextPage();
        }
        break;
      case 3:
        if(formKeyContactInformation.currentState!.validate()){
          newStudent.phone = phoneTextController.text;
          newStudent.cellPhone = cellPhoneTextController.text;
          newStudent.email = emailTextController.text;
          _nextPage();
        }
        break;
      case 4:
        _nextPage();
        break;
      case 5:
        _nextPage();
        break;
      case 6:
        if(formKeyPasswordInformation.currentState!.validate()){
          newStudent.password = Crypt.sha512(passwordTextController.text).toString();
          _nextPage();
        }
        break;
    }
  }

  backButtonPressed() async {
    int currentIndex = activeStep.value;
    if (activeStep.value > 0) {
      activeStep.value--;
    }

    return await Future.delayed(
      const Duration(
          milliseconds: 100
      ),
      () {
        return currentIndex <= 0;
      }
    );
  }

  backButtonOverridePressed() {
    if (activeStep.value > 0) {
      activeStep.value--;
    }
    else {
      Get.back();
    }
  }

  phoneTextFieldEdited(String cellPhoneTyped){
    cellPhoneTextController.value = ValidCellPhoneMask.updateCellPhoneMask(
      cellPhoneTyped,
      maskCellPhoneFormatter,
    );
  }
}