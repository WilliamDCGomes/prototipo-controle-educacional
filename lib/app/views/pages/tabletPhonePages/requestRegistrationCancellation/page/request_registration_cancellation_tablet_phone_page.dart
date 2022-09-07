import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/enums/enums.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../utils/paths.dart';
import '../../../../../utils/platform_type.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/button_widget.dart';
import '../../../widgetsShared/text_field_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../shared/widgets/radioListTileWidget.dart';
import '../../shared/widgets/information_container_tablet_phone_widget.dart';
import '../../shared/widgets/title_with_back_button_tablet_phone_widget.dart';
import '../controller/request_registration_cancellation_tablet_phone_controller.dart';

class RequestRegistrationCancellationTabletPhonePage extends StatefulWidget {
  final bool registrationCancellationExist;
  const RequestRegistrationCancellationTabletPhonePage({
    Key? key,
    required this.registrationCancellationExist,
  }) : super(key: key);

  @override
  State<RequestRegistrationCancellationTabletPhonePage> createState() => _RequestRegistrationCancellationTabletPhonePageState();
}

class _RequestRegistrationCancellationTabletPhonePageState extends State<RequestRegistrationCancellationTabletPhonePage> {
  late RequestRegistrationCancellationTabletPhoneController controller;

  @override
  void initState() {
    controller = Get.put(RequestRegistrationCancellationTabletPhoneController(widget.registrationCancellationExist));
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if(controller.registrationCancellationExist) {
        await controller.getRegistrationCancellation();
        setState(() {
          controller.reasonOfCancelation;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
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
                  padding: EdgeInsets.only(top: 2.h,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.h,),
                        child: TitleWithBackButtonTabletPhoneWidget(
                          title: "Cancelamento de Matrícula",
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InformationContainerTabletPhoneWidget(
                              iconPath: Paths.Icone_Exibicao_Cancelar_Matricula,
                              textColor: AppColors.whiteColor,
                              backgroundColor: AppColors.purpleDefaultColor,
                              informationText: widget.registrationCancellationExist ? "O seu pedido de cancelamento de matrícula está em análise!" : "Deseja solicitar o cancelamento da sua matrícula?",
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.h,),
                                child: ListView(
                                  shrinkWrap: true,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: TextWidget(
                                        "Qual é o motivo do cancelamento?",
                                        textColor: AppColors.blackColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp,
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    RadioListTileWidget(
                                      radioText: "Problemas Financeiros",
                                      justRead: widget.registrationCancellationExist,
                                      accountCancelationType: accountCancelation.financialIssues,
                                      accountCancelationGroup: controller.reasonOfCancelation,
                                      onChanged: (accountCancelation? value) {
                                        setState(() {
                                          controller.reasonOfCancelation = value;
                                        });
                                        controller.inputOtherReasonVisible.value = false;
                                      },
                                    ),
                                    RadioListTileWidget(
                                      radioText: "Problemas de Locomoção",
                                      justRead: widget.registrationCancellationExist,
                                      accountCancelationType: accountCancelation.locomotionIssues,
                                      accountCancelationGroup: controller.reasonOfCancelation,
                                      onChanged: (accountCancelation? value) {
                                        setState(() {
                                          controller.reasonOfCancelation = value;
                                        });
                                        controller.inputOtherReasonVisible.value = false;
                                      },
                                    ),
                                    RadioListTileWidget(
                                      radioText: "Transferência para Outra Instituição",
                                      justRead: widget.registrationCancellationExist,
                                      accountCancelationType: accountCancelation.schoolTransfer,
                                      accountCancelationGroup: controller.reasonOfCancelation,
                                      onChanged: (accountCancelation? value) {
                                        setState(() {
                                          controller.reasonOfCancelation = value;
                                        });
                                        controller.inputOtherReasonVisible.value = false;
                                      },
                                    ),
                                    RadioListTileWidget(
                                      radioText: "Troca de Curso",
                                      justRead: widget.registrationCancellationExist,
                                      accountCancelationType: accountCancelation.changeCourse,
                                      accountCancelationGroup: controller.reasonOfCancelation,
                                      onChanged: (accountCancelation? value) {
                                        setState(() {
                                          controller.reasonOfCancelation = value;
                                        });
                                        controller.inputOtherReasonVisible.value = false;
                                      },
                                    ),
                                    RadioListTileWidget(
                                      radioText: "Falta de Tempo para o Estudo",
                                      justRead: widget.registrationCancellationExist,
                                      accountCancelationType: accountCancelation.noTimeToStudy,
                                      accountCancelationGroup: controller.reasonOfCancelation,
                                      onChanged: (accountCancelation? value) {
                                        setState(() {
                                          controller.reasonOfCancelation = value;
                                        });
                                        controller.inputOtherReasonVisible.value = false;
                                      },
                                    ),
                                    RadioListTileWidget(
                                      radioText: "Outros",
                                      justRead: widget.registrationCancellationExist,
                                      accountCancelationType: accountCancelation.others,
                                      accountCancelationGroup: controller.reasonOfCancelation,
                                      onChanged: (accountCancelation? value) {
                                        setState(() {
                                          controller.reasonOfCancelation = value;
                                        });
                                        controller.inputOtherReasonVisible.value = true;
                                      },
                                    ),
                                    Obx(
                                      () => Visibility(
                                        visible: controller.inputOtherReasonVisible.value,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(vertical: 1.h),
                                          child: TextFieldWidget(
                                            controller: controller.otherReason,
                                            justRead: widget.registrationCancellationExist,
                                            height: PlatformType.isTablet(context) ? 18.h : 19.h,
                                            keyboardType: TextInputType.text,
                                            textCapitalization: TextCapitalization.sentences,
                                            textAlignVertical: TextAlignVertical.top,
                                            maxLines: 6,
                                            decoration: InputDecoration(
                                              label: TextWidget(
                                                "Informe qual o motivo",
                                                fontSize: 16.sp,
                                                textColor: AppColors.purpleDefaultColor,
                                              ),
                                              alignLabelWithHint: true,
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: AppColors.purpleDefaultColor,
                                                  width: .25.h,
                                                ),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: AppColors.purpleDefaultColor,
                                                  width: .25.h,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: AppColors.purpleDefaultColor,
                                                  width: .25.h,
                                                ),
                                              ),
                                              contentPadding: EdgeInsets.all(1.5.h),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 2.h,),
                              padding: EdgeInsets.symmetric(vertical: 2.h),
                              child: ButtonWidget(
                                hintText: widget.registrationCancellationExist ? "CANCELAR SOLICITAÇÃO" : "ENVIAR SOLICITAÇÃO",
                                backgroundColor: widget.registrationCancellationExist ? AppColors.orangeColor : AppColors.purpleDefaultColor,
                                borderColor: widget.registrationCancellationExist ? AppColors.orangeColor : AppColors.purpleDefaultColor,
                                fontWeight: FontWeight.bold,
                                widthButton: double.infinity,
                                onPressed: () => widget.registrationCancellationExist ?
                                  controller.buttonDeleteRegistrationCancellationPressed() :
                                  controller.buttonCancelRegistrationPressed(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
