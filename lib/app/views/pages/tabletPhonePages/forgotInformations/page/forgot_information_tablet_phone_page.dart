import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../helpers/paths.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../shared/widgets/information_container_tablet_phone_widget.dart';
import '../../shared/widgets/title_with_back_button_tablet_phone_widget.dart';
import '../controller/forgot_information_tablet_phone_controller.dart';

class ForgotInformationTabletPhonePage extends StatefulWidget {
  const ForgotInformationTabletPhonePage({Key? key}) : super(key: key);

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
    return Material(
      child: SafeArea(
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
                                padding: EdgeInsets.only(top: 2.h),
                                child: TextWidget(
                                  "RA (Registro Acadêmico):",
                                  textColor: AppColors.blackColor,
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
                              Padding(
                                padding: EdgeInsets.only(top: 2.h),
                                child: TextWidget(
                                  "Validade:",
                                  textColor: AppColors.blackColor,
                                  fontSize: 18.sp,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
