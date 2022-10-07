import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/utils/date_format_to_brazil.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../utils/logged_user.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../shared/widgets/copy_bar_code_tablet_phone_widget.dart';
import '../../shared/widgets/information_container_tablet_phone_widget.dart';
import '../../shared/widgets/title_with_back_button_tablet_phone_widget.dart';
import '../controller/student_card_tablet_phone_controller.dart';
import '../../../../../utils/paths.dart';
import '../../../../stylePages/app_colors.dart';
import '../widgets/student_card_tablet_phone_widget.dart';

class StudentCardTabletPhonePage extends StatefulWidget {
  const StudentCardTabletPhonePage({Key? key}) : super(key: key);

  @override
  State<StudentCardTabletPhonePage> createState() => _StudentCardTabletPhonePageState();
}

class _StudentCardTabletPhonePageState extends State<StudentCardTabletPhonePage> {
  late final StudentCardTabletPhoneController controller;

  @override
  void initState() {
    controller = Get.put(StudentCardTabletPhoneController());
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller.getOnlineStudentCard();
    });
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
                Padding(
                  padding: EdgeInsets.only(top: 2.h,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.h,),
                        child: TitleWithBackButtonTabletPhoneWidget(
                          title: "Carteirinha Online",
                        ),
                      ),
                      InformationContainerTabletPhoneWidget(
                        iconPath: Paths.Icone_Exibicao_Carterinho_Online,
                        textColor: AppColors.whiteColor,
                        backgroundColor: AppColors.purpleDefaultColor,
                        informationText: "Carteirinha de Estudante Online",
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.h,),
                          child: ListView(
                            children: [
                              Obx(
                                () => StudentCardTabletPhoneWidget(
                                  imageBasePath: controller.imageBasePath,
                                  cardNumber: controller.onlineStudentCard[0].onlineCardNumber,
                                  raNumber: LoggedUser.ra.toString(),
                                  nameStudent: LoggedUser.name,
                                  validateCard: DateFormatToBrazil.mounthAndYearReduced(controller.onlineStudentCard[0].expirationDate),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.h),
                                child: TextWidget(
                                  "Nome:",
                                  textColor: AppColors.blackColor,
                                  fontSize: 18.sp,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 1.h),
                                child: TextWidget(
                                  LoggedUser.name,
                                  textColor: AppColors.blackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.h),
                                child: TextWidget(
                                  "RA (Registro Acadêmico):",
                                  textColor: AppColors.blackColor,
                                  fontSize: 18.sp,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 1.h),
                                child: TextWidget(
                                  LoggedUser.ra.toString(),
                                  textColor: AppColors.blackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.h),
                                child: TextWidget(
                                  "Número da Carteirinha:",
                                  textColor: AppColors.blackColor,
                                  fontSize: 18.sp,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Obx(
                                      () => CopyBarCodeTabletPhoneWidget(
                                    successText: "Número da Carteirinha copiado com sucesso!",
                                    valueCopy: controller.onlineStudentCard[0].onlineCardNumber,
                                    widgetCustom: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          Paths.Icone_Copiar,
                                          width: 2.h,
                                        ),
                                        TextWidget(
                                          " ${controller.onlineStudentCard[0].onlineCardNumber}",
                                          maxLines: 1,
                                          textColor: AppColors.blueLinkColor,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.h),
                                child: TextWidget(
                                  "Validade:",
                                  textColor: AppColors.blackColor,
                                  fontSize: 18.sp,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 1.h),
                                child: Obx(
                                      () => TextWidget(
                                    DateFormatToBrazil.mounthAndYearReduced(controller.onlineStudentCard[0].expirationDate),
                                    textColor: AppColors.blackColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp,
                                    textAlign: TextAlign.start,
                                  ),
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