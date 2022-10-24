import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:projeto_tcc/base/models/course.dart';
import 'package:projeto_tcc/base/models/user.dart';
import 'package:projeto_tcc/base/services/interfaces/istudent_service.dart';
import '../../../../../../base/models/address_information.dart';
import '../../../../../../base/models/discipline_periods.dart';
import '../../../../../../base/models/education_institution.dart';
import '../../../../../../base/models/student.dart';
import '../../../../../../base/services/consult_cep_service.dart';
import '../../../../../../base/services/course_service.dart';
import '../../../../../../base/services/discipline_periods_service.dart';
import '../../../../../../base/services/education_institution_service.dart';
import '../../../../../../base/services/interfaces/iconsult_cep_service.dart';
import '../../../../../../base/services/interfaces/icourse_service.dart';
import '../../../../../../base/services/interfaces/idiscipline_periods_service.dart';
import '../../../../../../base/services/interfaces/ieducation_institution_service.dart';
import '../../../../../../base/services/interfaces/ira_service.dart';
import '../../../../../../base/services/interfaces/iuser_service.dart';
import '../../../../../../base/services/ra_service.dart';
import '../../../../../../base/services/student_service.dart';
import '../../../../../../base/services/user_service.dart';
import '../../../../../utils/brazil_address_informations.dart';
import '../../../../../utils/internet_connection.dart';
import '../../../../../utils/loading.dart';
import '../../../../../utils/valid_cellphone_mask.dart';
import '../../shared/popups/information_tablet_phone_popup.dart';
import '../widgets/body_register_stepper_tablet_phone_widget.dart';
import '../widgets/header_register_stepper_tablet_phone_widget.dart';
import '../../shared/widgets/loading_with_success_or_error_tablet_phone_widget.dart';
import '../pages/registration_completed_tablet_phone_page.dart';
import '../../../../stylePages/masks_for_text_fields.dart';

class RegisterUserTabletPhoneController extends GetxController {
  late String lgpdPhrase;
  late RxInt activeStep;
  late RxBool passwordFieldEnabled;
  late RxBool loadingAnimation;
  late RxBool confirmPasswordFieldEnabled;
  late RxBool nameInputHasError;
  late RxBool birthdayInputHasError;
  late RxBool cpfInputHasError;
  late RxBool cepInputHasError;
  late RxBool cityInputHasError;
  late RxBool streetInputHasError;
  late RxBool neighborhoodInputHasError;
  late RxBool phoneInputHasError;
  late RxBool cellPhoneInputHasError;
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
  late List<EducationInstitution> educationInstitutionList;
  late List<Course> courseFromInstitutionList;
  late RxList<String> periodList;
  late RxList<String> educationInstitutionNameList;
  late RxList<String> courseList;
  late RxList<String> ufsList;
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
  late TextEditingController passwordTextController;
  late TextEditingController confirmPasswordTextController;
  late TextEditingController otherGenderTypeTextController;
  late FocusNode birthDateFocusNode;
  late FocusNode cpfFocusNode;
  late FocusNode streetFocusNode;
  late FocusNode houseNumberFocusNode;
  late FocusNode neighborhoodFocusNode;
  late FocusNode complementFocusNode;
  late FocusNode cellPhoneFocusNode;
  late FocusNode emailFocusNode;
  late FocusNode confirmEmailFocusNode;
  late FocusNode confirmPasswordFocusNode;
  late List<HeaderRegisterStepperTabletPhoneWidget> headerRegisterStepperList;
  late List<BodyRegisterStepperTabletPhoneWidget> bodyRegisterStepperList;
  late LoadingWithSuccessOrErrorTabletPhoneWidget loadingWithSuccessOrErrorTabletPhoneWidget;
  late Student newStudent;
  late Users newUser;
  late IStudentService studentService;
  late ICourseService courseService;
  late IConsultCepService consultCepService;
  late IEducationInstitutionService educationInstitutionService;
  late IDisciplinePeriodsService disciplinePeriodsService;
  late IUserService userService;
  late IRaService raService;

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
    loadingAnimation = false.obs;
    passwordFieldEnabled = true.obs;
    confirmPasswordFieldEnabled = true.obs;
    nameInputHasError = false.obs;
    birthdayInputHasError = false.obs;
    cpfInputHasError = false.obs;
    cepInputHasError = false.obs;
    cityInputHasError = false.obs;
    streetInputHasError = false.obs;
    neighborhoodInputHasError = false.obs;
    phoneInputHasError = false.obs;
    cellPhoneInputHasError = false.obs;
    emailInputHasError = false.obs;
    confirmEmailInputHasError = false.obs;
    passwordInputHasError = false.obs;
    confirmPasswordInputHasError = false.obs;
    showOtherGenderType = false.obs;
    ufsList = [""].obs;
    educationInstitutionNameList = [""].obs;
    educationInstitutionList = <EducationInstitution>[];
    courseFromInstitutionList = <Course>[];
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
      "",
    ].obs;
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
    passwordTextController = TextEditingController();
    confirmPasswordTextController = TextEditingController();
    otherGenderTypeTextController = TextEditingController();
    birthDateFocusNode = FocusNode();
    cpfFocusNode = FocusNode();
    streetFocusNode = FocusNode();
    houseNumberFocusNode = FocusNode();
    neighborhoodFocusNode = FocusNode();
    complementFocusNode = FocusNode();
    cellPhoneFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    confirmEmailFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
    loadingWithSuccessOrErrorTabletPhoneWidget = LoadingWithSuccessOrErrorTabletPhoneWidget(
      loadingAnimation: loadingAnimation,
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
        thirdText: "Preencha os dados institucionais para identificarmos você no nosso sistema.",
      ),
      HeaderRegisterStepperTabletPhoneWidget(
        firstText: "PASSO 4 DE 7",
        secondText: "Dados de Contato",
        thirdText: "Preencha os dados de contato para que seja possível a comunicação.",
      ),
      HeaderRegisterStepperTabletPhoneWidget(
        firstText: "PASSO 5 DE 7",
        secondText: "Confirmação Celular",
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
    newStudent = Student();
    newUser = Users();
    newUser.id = newStudent.id;

    studentService = StudentService();
    courseService = CourseService();
    consultCepService = ConsultCepService();
    educationInstitutionService = EducationInstitutionService();
    disciplinePeriodsService = DisciplinePeriodsService();
    userService = UserService();
    raService = RaService();
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

  _validPersonalInformationAndAdvanceNextStep() async {
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
    }
    else if(await studentService.verificationStudentExists(cpfTextController.text)){
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
    else{
      newUser.name = nameTextController.text;
      newUser.birthdate = birthDateTextController.text;
      newUser.cpf = cpfTextController.text;
      newStudent.cpf = cpfTextController.text;
      newUser.gender = genderSelected.value != "" ? genderSelected.value : otherGenderTypeTextController.text;
      _nextPage();
    }
  }

  _validEmailAndAdvanceNextStep() async {
    if(await studentService.verificationEmailExists(emailTextController.text)){
      showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return InformationTabletPhonePopup(
            warningMessage: "O E-mail já está cadastrado no sistema.",
          );
        },
      );
    }
    else{
      newUser.phone = phoneTextController.text;
      newUser.cellPhone = cellPhoneTextController.text;
      newUser.email = emailTextController.text;
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

  bool _validPhoneCode(String code) {
    try{
      if(code == ""){
        showDialog(
          context: Get.context!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return InformationTabletPhonePopup(
              warningMessage: "Informe o código enviado para o seu Celular.",
            );
          },
        );
        return false;
      }
      if(code != "12345"){
        showDialog(
          context: Get.context!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return InformationTabletPhonePopup(
              warningMessage: "O código informado é inválido.",
            );
          },
        );
        return false;
      }
      return true;
    }
    catch(_){
      return false;
    }
  }

  bool _validEmailCode(String code) {
    try{
      if(code == ""){
        showDialog(
          context: Get.context!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return InformationTabletPhonePopup(
              warningMessage: "Informe o código enviado para o seu \nE-mail.",
            );
          },
        );
        return false;
      }
      if(code != "12345"){
        showDialog(
          context: Get.context!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return InformationTabletPhonePopup(
              warningMessage: "O código informado é inválido.",
            );
          },
        );
        return false;
      }
      return true;
    }
    catch(_){
      return false;
    }
  }

  _nextPage() async {
    if(activeStep.value < 6)
      activeStep.value ++;
    else{
      await _saveStudent();
    }
  }

  _saveStudent() async {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    loadingAnimation.value = true;
    await loadingWithSuccessOrErrorTabletPhoneWidget.startAnimation();

    await Future.delayed(Duration(seconds: 1));
    int trys = 0;

    while(true){
      try{
        newStudent.ra = await raService.createNewRA(newStudent.id, newStudent.educationInstitutionId);
        if(await userService.registerNewUser(newUser.email, newStudent.password)){
          bool userSend = await userService.sendNewUser(newUser);
          bool studenteSend = await studentService.sendNewStudent(newStudent);
          if(userSend && studenteSend) {
            await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation(
              destinationPage: RegistrationCompletedTabletPhone(),
            );
            break;
          }
          else{
            throw Exception();
          }
        }
        else{
          await raService.deleteDuplicateRa(newStudent.id);
          throw Exception();
        }
      }
      catch(_){
        if(trys < 2){
          trys++;
          continue;
        }
        await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation(fail: true);
        await showDialog(
          context: Get.context!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return InformationTabletPhonePopup(
              warningMessage: "Erro ao cadastrar usuário.\n Tente novamente mais tarde",
            );
          },
        );
      }
      break;
    }
  }

  searchCoursesOfEducationInstitution() async {
    try{
      courseList.clear();
      courseSelected.value = "";
      periodList.clear();
      periodSelected.value = "";

      if(!await InternetConnection.checkConnection()){
        showDialog(
          context: Get.context!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return InformationTabletPhonePopup(
              warningMessage: "É necessário uma conexão com a internet para localizar os cursos dessa instituição",
            );
          },
        );
        return;
      }
      EducationInstitution educationInstitution = educationInstitutionList.firstWhere(
        (element) => element.name == educationInstitutionSelected.value
      );

      for(var course in educationInstitution.courses){
        var courseReturn = await courseService.getCoursesById(course);
        if(courseReturn != null){
          courseFromInstitutionList.add(courseReturn);
          courseList.add(courseReturn.name);
        }
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

  getDisciplinePeriod(String institutionId) async {
    try{
      periodList.clear();
      periodSelected.value = "";
      if(!await InternetConnection.checkConnection()){
        showDialog(
          context: Get.context!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return InformationTabletPhonePopup(
              warningMessage: "É necessário uma conexão com a internet para localizar os períodos letivos desse curso",
            );
          },
        );
        return;
      }
      List<DisciplinePeriods> periods = await disciplinePeriodsService.getDisciplinePeriods(institutionId);
      DisciplinePeriods disciplinePeriods = periods.firstWhere(
        (element) => element.courseId == courseFromInstitutionList.firstWhere(
          (element) => element.name == courseSelected.value,
        ).id,
      );

      for(var period in disciplinePeriods.period){
        periodList.add(period);
      }
    }
    catch(_){
      await showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return InformationTabletPhonePopup(
            warningMessage: "Não foi possível encontrar os períodos letivos dessa disciplina.",
          );
        },
      );
    }
  }

  nextButtonPressed() async {
    if(!await InternetConnection.validInternet(
      "É necessário uma conexão com a internet para fazer o cadastro",
      loadingAnimation,
      loadingWithSuccessOrErrorTabletPhoneWidget,
    )){
      return;
    }
    switch(activeStep.value){
      case 0:
        if(formKeyPersonalInformation.currentState!.validate()){
          await Loading.startAndPauseLoading(
            () => _validPersonalInformationAndAdvanceNextStep(),
            loadingAnimation,
            loadingWithSuccessOrErrorTabletPhoneWidget,
          );
        }
        break;
      case 1:
        if(formKeyAddressInformation.currentState!.validate()){
          newUser.cep = cepTextController.text;
          newUser.uf = ufSelected.value;
          newUser.city = cityTextController.text;
          newUser.street = streetTextController.text;
          newUser.houseNumber = houseNumberTextController.text;
          newUser.neighborhood = neighborhoodTextController.text;
          newUser.complement = complementTextController.text;
          _nextPage();
        }
        break;
      case 2:
        if(await _validSchoolInformation()){
          newStudent.educationInstitutionId = educationInstitutionList.firstWhere(
            (element) => element.name == educationInstitutionSelected.value
          ).id;
          newStudent.courseId = courseFromInstitutionList.firstWhere(
            (element) => element.name == courseSelected.value
          ).id;

          newStudent.period = periodSelected.value;
          _nextPage();
        }
        break;
      case 3:
        if(formKeyContactInformation.currentState!.validate()){
          Loading.startAndPauseLoading(
            () => _validEmailAndAdvanceNextStep(),
            loadingAnimation,
            loadingWithSuccessOrErrorTabletPhoneWidget,
          );
        }
        break;
      case 4:
        await Loading.startAndPauseLoading(
          () {
            if(_validPhoneCode(pinPutSMSController.text)){
            _nextPage();
            }
          },
          loadingAnimation,
          loadingWithSuccessOrErrorTabletPhoneWidget,
        );
        break;
      case 5:
        await Loading.startAndPauseLoading(
          () {
            if(_validEmailCode(pinPutEmailController.text)){
            _nextPage();
            }
          },
          loadingAnimation,
          loadingWithSuccessOrErrorTabletPhoneWidget,
        );
        break;
      case 6:
        if(formKeyPasswordInformation.currentState!.validate()){
          newStudent.password = passwordTextController.text;
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