import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/views/componentsWidgets/richTextTwoDifferentWidget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controllers/loginPageController.dart';
import '../../../helpers/paths.dart';
import '../../componentsWidgets/buttonWidget.dart';
import '../../componentsWidgets/textButtonWidget.dart';
import '../../componentsWidgets/textFieldWidget.dart';
import '../../componentsWidgets/textWidget.dart';
import '../../stylePages/appColors.dart';

class LoginPageTablePhone extends StatefulWidget {
  const LoginPageTablePhone({Key? key}) : super(key: key);

  @override
  State<LoginPageTablePhone> createState() => _LoginPageTablePhoneState();
}

class _LoginPageTablePhoneState extends State<LoginPageTablePhone> {
  late LoginController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.put(LoginController());

    return Material(
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
          child: Scaffold(
            backgroundColor: AppColors().transparentColor,
            body: SafeArea(
              child: Stack(
                children: [
                  SvgPicture.asset(
                    '${Paths().svgsPath}Ilustracao_Topo.svg',
                    width: 30.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 78.h),
                    child: Image.asset(
                      '${Paths().imagesPath}Ilustracao_Rodape.png',
                      width: 100.w,
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: 100.h,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 12.h),
                              child: SvgPicture.asset(
                                '${Paths().svgsPath}Logo_Login.svg',
                                width: 45.w,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15.w, top: 5.h, right: 15.w),
                              child: TextWidget(
                                "O aplicativo oficial para os estudantes terem acesso a todos os conteúdos acadêmico.",
                                textColor: AppColors().purpleDefaultColor,
                                fontSize: 17.sp,
                                textAlign: TextAlign.center,
                                maxLines: 10,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5.h),
                              child: TextFieldWidget(
                                controller: controller.raInputController,
                                hintText: "RA",
                                height: 6.h,
                                width: 75.w,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                              width: 75.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButtonWidget(
                                    hintText: "Esqueceu o RA?",
                                    fontSize: 16.sp,
                                    onTap: () {

                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 1.5.h),
                              child: Obx(() => TextFieldWidget(
                                controller: controller.passwordInputController,
                                hintText: "Digite sua senha",
                                height: 6.h,
                                width: 75.w,
                                isPassword: controller.passwordFieldEnabled.value,
                                iconTextField: GestureDetector(
                                  onTap: () {
                                    controller.passwordFieldEnabled.value =
                                    !controller.passwordFieldEnabled.value;
                                  },
                                  child: Icon(
                                    controller.passwordFieldEnabled.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: AppColors().purpleDefaultColor,
                                  ),
                                ),
                                keyboardType: TextInputType.visiblePassword,
                              ),
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                              width: 75.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButtonWidget(
                                    hintText: "Esqueceu a Senha?",
                                    fontSize: 16.sp,
                                    onTap: () {

                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 3.h),
                              child: ButtonWidget(
                                hintText: "LOGAR",
                                fontWeight: FontWeight.bold,
                                widthButton: 75.w,
                                onPressed: () => controller.loginPressed(),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 3.h),
                              child: TextButtonWidget(
                                onTap: () => controller.createAccount(),
                                richText: RichTextTwoDifferentWidget(
                                  firstText: "Não tem Cadastro? ",
                                  secondText: "Clique Aqui!",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
