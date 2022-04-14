import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/views/componentsWidgets/textWidget.dart';
import 'package:projeto_tcc/app/views/stylePages/appColors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controllers/welcomePageController.dart';
import '../../../helpers/paths.dart';
import '../../componentsWidgets/buttonWidget.dart';
import '../../componentsWidgets/textButtonWidget.dart';

class WelcomePageTabletPhonePage extends StatefulWidget {
  const WelcomePageTabletPhonePage({Key? key}) : super(key: key);

  @override
  State<WelcomePageTabletPhonePage> createState() => _WelcomePageTabletPhonePageState();
}

class _WelcomePageTabletPhonePageState extends State<WelcomePageTabletPhonePage> {
  late WelcomePageController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.put(WelcomePageController());

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.5.h),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors().backgroundFirstScreenColor,
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors().transparentColor,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 2.h, right: 2.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextFieldWidget(

                          hintText: "Pular Introdução",
                          onTap: () => controller.jumpIntroduction(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          '${Paths().svgsPath}Ilustracao_01.svg',
                          height: 30.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 3.h),
                          child: TextWidget(
                            "Bem vindo ao",
                            textColor: AppColors().purpleDefaultColor,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        TextWidget(
                          "Protótipo de Controle Educacional",
                          textColor: AppColors().purpleDefaultColor,
                          fontSize: 19.sp,
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.w, top: 2.h, right: 5.w),
                          child: TextWidget(
                            "O aplicativo oficial para os universitários terem acesso a todos os conteúdos acadêmico.",
                            textColor: AppColors().purpleDefaultColor,
                            fontSize: 17.sp,
                            textAlign: TextAlign.center,
                            maxLines: 10,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5.h),
                          child: ButtonWidget(
                            hintText: "PRÓXIMO",
                            fontWeight: FontWeight.bold,
                            widthButton: 75.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 70.h),
                child: SvgPicture.asset(
                  '${Paths().svgsPath}Ilustracao_Rodape.svg',
                  height: 30.h,
                  width: 100.w,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
