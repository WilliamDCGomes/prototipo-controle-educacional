import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/enums/enums.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../helpers/paths.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/button_widget.dart';
import '../../../widgetsShared/text_field_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../shared/widgets/RadioListTileWidget.dart';
import '../../shared/widgets/title_with_back_button_tablet_phone_widget.dart';
import '../controller/request_registration_cancellation_tablet_phone_controller.dart';

class RequestRegistrationCancellationTabletPhonePage extends StatefulWidget {
  const RequestRegistrationCancellationTabletPhonePage({Key? key}) : super(key: key);

  @override
  State<RequestRegistrationCancellationTabletPhonePage> createState() => _RequestRegistrationCancellationTabletPhonePageState();
}

class _RequestRegistrationCancellationTabletPhonePageState extends State<RequestRegistrationCancellationTabletPhonePage> {
  late RequestRegistrationCancellationTabletPhoneController controller;

  @override
  void initState() {
    controller = Get.put(RequestRegistrationCancellationTabletPhoneController());

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
                  padding: EdgeInsets.fromLTRB(2.h, 2.h, 2.h, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TitleWithBackButtonTabletPhoneWidget(
                        title: "Cancelamento de Matrícula",
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 3.h,),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.purpleDefaultColorWithOpacity,
                                  borderRadius: BorderRadius.circular(10.h),
                                ),
                                padding: EdgeInsets.all(3.h),
                                child: Image.asset(
                                  Paths.Cancelar_Conta,
                                  height: 14.h,
                                ),
                              ),
                              Expanded(
                                child: ListView(
                                  shrinkWrap: true,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 1.h),
                                      child: TextWidget(
                                        "Deseja solicitar o cancelamento da sua matrícula?",
                                        textColor: AppColors.purpleDefaultColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp,
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
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
                                            height: 18.h,
                                            keyboardType: TextInputType.text,
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
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.h),
                                child: ButtonWidget(
                                  hintText: "ENVIAR SOLICITAÇÃO",
                                  fontWeight: FontWeight.bold,
                                  widthButton: double.infinity,
                                  onPressed: () => controller.buttonCancelRegistrationPressed(),
                                ),
                              ),
                            ],
                          ),
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
