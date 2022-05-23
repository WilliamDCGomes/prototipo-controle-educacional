import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../shared/widgets/button_widget.dart';
import '../../shared/widgets/text_button_widget.dart';
import '../../shared/widgets/text_field_widget.dart';
import '../../shared/widgets/text_widget.dart';
import '../controller/login_page_controller.dart';
import '../../../../../helpers/paths.dart';
import '../../shared/widgets/rich_text_two_different_widget.dart';
import '../../../../stylePages/app_colors.dart';

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
              colors: AppColors.backgroundFirstScreenColor,
            ),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                SvgPicture.asset(
                  Paths.Ilustracao_Topo,
                  width: 30.w,
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      Paths.Ilustracao_Rodape,
                      height: 14.h,
                    ),
                  ],
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
                              Paths.Logo_Login,
                              width: 45.w,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15.w, top: 5.h, right: 15.w),
                            child: TextWidget(
                              "O aplicativo oficial para os estudantes terem acesso a todos os conteúdos acadêmico.",
                              textColor: AppColors.purpleDefaultColor,
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
                            height: 5.h,
                            width: 75.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButtonWidget(
                                  hintText: "Esqueceu o RA?",
                                  fontSize: 16.sp,
                                  onTap: () => controller.forgotRa(),
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
                                  color: AppColors.purpleDefaultColor,
                                  size: 2.5.h,
                                ),
                              ),
                              keyboardType: TextInputType.visiblePassword,
                            ),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                            width: 75.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButtonWidget(
                                  hintText: "Esqueceu a Senha?",
                                  fontSize: 16.sp,
                                  onTap: () => controller.forgotPassword(),
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
    );
  }
}
