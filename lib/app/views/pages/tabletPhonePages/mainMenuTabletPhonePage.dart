import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controllers/mainMenuTabletPhoneController.dart';
import '../../../helpers/paths.dart';
import '../../componentsWidgets/tabletPhoneComponentWidget/cardMainMenuWidget.dart';
import '../../componentsWidgets/textButtonWidget.dart';
import '../../componentsWidgets/textWidget.dart';
import '../../stylePages/appColors.dart';

class MainMenuTabletPhonePage extends StatefulWidget {
  const MainMenuTabletPhonePage({Key? key}) : super(key: key);

  @override
  State<MainMenuTabletPhonePage> createState() => _MainMenuTabletPhonePageState();
}

class _MainMenuTabletPhonePageState extends State<MainMenuTabletPhonePage> {
  late MainMenuTabletPhoneController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.put(MainMenuTabletPhoneController());

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
                colors: AppColors().backgroundFirstScreenColor,
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: SvgPicture.asset(
                    '${Paths().svgsPath}Ilustracao_Topo.svg',
                    width: 25.w,
                  ),
                ),
                Scaffold(
                  backgroundColor: AppColors().transparentColor,
                  body: Padding(
                    padding: EdgeInsets.all(2.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 9.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButtonWidget(
                                onTap: (){

                                },
                                borderRadius: 2.h,
                                widgetCustom: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 3.w),
                                      child: Container(
                                        height: 7.h,
                                        width: 7.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3.5.h),
                                          color: AppColors().grayColor,
                                        ),
                                        child: Obx(
                                              () => controller.hasPicture.value ?
                                          Image.asset(
                                              ""
                                          ) :
                                          Center(
                                            child: TextWidget(
                                              controller.nameInitials,
                                              textColor: AppColors().standardColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.sp,
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                          "Olá, William",
                                          textColor: AppColors().blackColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.sp,
                                          textAlign: TextAlign.start,
                                        ),
                                        Obx(() => TextWidget(
                                          controller.welcomePhrase.value,
                                          textColor: AppColors().blackColor,
                                          fontSize: 17.sp,
                                          textAlign: TextAlign.start,
                                        ),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SvgPicture.asset(
                                '${Paths().svgsPath}Logo_Pce_Home.svg',
                                width: 15.w,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 9.h),
                          child: Center(
                            child: CardMainMenuWidget(
                              imagePath: "Icone_Notificacao.svg",
                              firstText: "Meu Painel",
                              secondText: "Ciência da Computação",
                              thirdText: "4º Ano",
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
        ),
      ),
    );
  }
}
