import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../enums/enums.dart';
import '../../../../../utils/paths.dart';
import '../../../../../utils/platform_type.dart';
import '../../../../../utils/text_field_validators.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/button_widget.dart';
import '../../../widgetsShared/text_field_widget.dart';
import '../../shared/widgets/information_container_tablet_phone_widget.dart';
import '../../shared/widgets/title_with_back_button_tablet_phone_widget.dart';
import '../controller/forgot_information_tablet_phone_controller.dart';

class ForgotInformationTabletPhonePage extends StatefulWidget {
  final forgotInformation information;
  const ForgotInformationTabletPhonePage({
    Key? key,
    required this.information,
  }) : super(key: key);

  @override
  State<ForgotInformationTabletPhonePage> createState() => _ForgotInformationTabletPhonePageState();
}

class _ForgotInformationTabletPhonePageState extends State<ForgotInformationTabletPhonePage> {
  late ForgotInformationTabletPhoneController controller;

  @override
  void initState() {
    controller = Get.put(ForgotInformationTabletPhoneController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
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
                Scaffold(
                  backgroundColor: AppColors.transparentColor,
                  body: Padding(
                    padding: EdgeInsets.only(top: 2.h,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.h,),
                          child: TitleWithBackButtonTabletPhoneWidget(
                            title: widget.information == forgotInformation.ra ? "Esqueceu o RA" : "Esqueceu a Senha",
                          ),
                        ),
                        InformationContainerTabletPhoneWidget(
                          iconPath: widget.information == forgotInformation.ra ? Paths.Icone_Exibicao_Esqueci_Ra : Paths.Icone_Exibicao_Esqueci_Senha,
                          textColor: AppColors.whiteColor,
                          backgroundColor: AppColors.purpleDefaultColor,
                          informationText: "Informe o seu E-mail para recuperar " + (widget.information == forgotInformation.ra ? "o seu RA" : "a sua Senha"),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 2.h,),
                                  child: Form(
                                    key: controller.formKey,
                                    child: Obx(
                                      () => TextFieldWidget(
                                        controller: controller.emailInputController,
                                        hintText: "Informe o E-mail",
                                        height: PlatformType.isTablet(context) ? 6.h : 7.h,
                                        width: double.infinity,
                                        keyboardType: TextInputType.emailAddress,
                                        enableSuggestions: true,
                                        hasError: controller.emailInputHasError.value,
                                        validator: (String? value) {
                                          String? validation = TextFieldValidators.emailValidation(value);
                                          if(validation != null && validation != ""){
                                            controller.emailInputHasError.value = true;
                                          }
                                          else{
                                            controller.emailInputHasError.value = false;
                                          }
                                          return validation;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.h, right: 2.h, bottom: 2.h,),
                                child: ButtonWidget(
                                  hintText: "ENVIAR",
                                  fontWeight: FontWeight.bold,
                                  widthButton: 90.w,
                                  onPressed: () {
                                    FocusScope.of(context).requestFocus(FocusNode());
                                    controller.sendButtonPressed();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                controller.loadingWithSuccessOrErrorTabletPhoneWidget,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
