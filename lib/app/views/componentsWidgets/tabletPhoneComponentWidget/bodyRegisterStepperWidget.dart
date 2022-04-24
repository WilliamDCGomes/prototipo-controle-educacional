import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controllers/registerUserController.dart';
import '../../stylePages/appColors.dart';
import '../textFieldWidget.dart';

class BodyRegisterStepperWidget extends StatelessWidget {
  final RegisterUserController controller;
  final int indexView;

  const BodyRegisterStepperWidget(
      { Key? key,
        required this.controller,
        required this.indexView,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Entrys da primeira stepper
        Visibility(
          visible: indexView == 0,
          child: SizedBox(
            height: 30.h,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFieldWidget(
                    controller: controller.nameTextController,
                    hintText: "Nome",
                    height: 6.h,
                    width: 90.w,
                    keyboardType: TextInputType.name,
                    enableSuggestions: true,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: TextFieldWidget(
                      controller: controller.birthDateTextController,
                      hintText: "Data de Nascimento",
                      height: 6.h,
                      width: 90.w,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: TextFieldWidget(
                      controller: controller.cpfTextController,
                      hintText: "CPF",
                      height: 6.h,
                      width: 90.w,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Entrys da segunda stepper
        Visibility(
          visible: indexView == 1,
          child: SizedBox(
            height: 50.h,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFieldWidget(
                    controller: controller.cepTextController,
                    hintText: "Cep",
                    height: 6.h,
                    width: 90.w,
                    keyboardType: TextInputType.number,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFieldWidget(
                          controller: controller.ufTextController,
                          hintText: "Uf",
                          height: 6.h,
                          width: 30.w,
                          keyboardType: TextInputType.text,
                        ),
                        TextFieldWidget(
                          controller: controller.cityTextController,
                          hintText: "Cidade",
                          height: 6.h,
                          width: 58.w,
                          keyboardType: TextInputType.name,
                          enableSuggestions: true,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFieldWidget(
                          controller: controller.streetTextController,
                          hintText: "Logradouro",
                          height: 6.h,
                          width: 68.w,
                          keyboardType: TextInputType.streetAddress,
                          enableSuggestions: true,
                        ),
                        TextFieldWidget(
                          controller: controller.houseNumberTextController,
                          hintText: "Nº",
                          height: 6.h,
                          width: 20.w,
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: TextFieldWidget(
                      controller: controller.neighborhoodTextController,
                      hintText: "Bairro",
                      height: 6.h,
                      width: 90.w,
                      keyboardType: TextInputType.name,
                      enableSuggestions: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: TextFieldWidget(
                      controller: controller.complementTextController,
                      hintText: "Complemento",
                      height: 6.h,
                      width: 90.w,
                      keyboardType: TextInputType.text,
                      enableSuggestions: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Entrys da terceira stepper
        Visibility(
          visible: indexView == 2,
          child: SizedBox(
            height: 30.h,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFieldWidget(
                    controller: controller.institutionTextController,
                    hintText: "Instituição",
                    height: 6.h,
                    width: 90.w,
                    keyboardType: TextInputType.name,
                    enableSuggestions: true,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: TextFieldWidget(
                      controller: controller.courseTextController,
                      hintText: "Curso",
                      height: 6.h,
                      width: 90.w,
                      keyboardType: TextInputType.name,
                      enableSuggestions: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: TextFieldWidget(
                      controller: controller.periodTextController,
                      hintText: "Período",
                      height: 6.h,
                      width: 90.w,
                      keyboardType: TextInputType.text,
                      enableSuggestions: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Entrys da quarta stepper
        Visibility(
          visible: indexView == 3,
          child: SizedBox(
            height: 40.h,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFieldWidget(
                    controller: controller.phoneTextController,
                    hintText: "Telefone",
                    height: 6.h,
                    width: 90.w,
                    keyboardType: TextInputType.phone,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: TextFieldWidget(
                      controller: controller.cellPhoneTextController,
                      hintText: "Celular",
                      height: 6.h,
                      width: 90.w,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: TextFieldWidget(
                      controller: controller.emailTextController,
                      hintText: "E-mail",
                      height: 6.h,
                      width: 90.w,
                      keyboardType: TextInputType.emailAddress,
                      enableSuggestions: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: TextFieldWidget(
                      controller: controller.confirmEmailTextController,
                      hintText: "Confirme o E-mail",
                      height: 6.h,
                      width: 90.w,
                      keyboardType: TextInputType.emailAddress,
                      enableSuggestions: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Entrys da quinta stepper
        Visibility(
          visible: indexView == 4,
          child: SizedBox(
            height: 10.h,
            width: 50,
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFieldWidget(
                    controller: controller.cellPhoneVerification1TextController,
                    height: 6.h,
                    width: 8.w,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                  ),
                  TextFieldWidget(
                    controller: controller.cellPhoneVerification2TextController,
                    height: 6.h,
                    width: 8.w,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                  ),
                  TextFieldWidget(
                    controller: controller.cellPhoneVerification3TextController,
                    height: 6.h,
                    width: 8.w,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                  ),
                  TextFieldWidget(
                    controller: controller.cellPhoneVerification4TextController,
                    height: 6.h,
                    width: 8.w,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                  ),
                  TextFieldWidget(
                    controller: controller.cellPhoneVerification5TextController,
                    height: 6.h,
                    width: 8.w,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                  ),
                ],
              ),
            ),
          ),
        ),

        // Entrys da sexta stepper
        Visibility(
          visible: indexView == 5,
          child: SizedBox(
            height: 10.h,
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFieldWidget(
                    controller: controller.emailVerification1TextController,
                    height: 6.h,
                    width: 8.w,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                  ),
                  TextFieldWidget(
                    controller: controller.emailVerification2TextController,
                    height: 6.h,
                    width: 8.w,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                  ),
                  TextFieldWidget(
                    controller: controller.emailVerification3TextController,
                    height: 6.h,
                    width: 8.w,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                  ),
                  TextFieldWidget(
                    controller: controller.emailVerification4TextController,
                    height: 6.h,
                    width: 8.w,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                  ),
                  TextFieldWidget(
                    controller: controller.emailVerification5TextController,
                    height: 6.h,
                    width: 8.w,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                  ),
                ],
              ),
            ),
          ),
        ),

        // Entrys da sétima stepper
        Visibility(
          visible: indexView == 6,
          child: SizedBox(
            height: 20.h,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Obx(() => TextFieldWidget(
                    controller: controller.passwordTextController,
                    hintText: "Senha",
                    height: 6.h,
                    width: 90.w,
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
                  )),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Obx(() => TextFieldWidget(
                      controller: controller.confirmPasswordTextController,
                      hintText: "Confirme a Senha",
                      height: 6.h,
                      width: 90.w,
                      isPassword: controller.confirmPasswordFieldEnabled.value,
                      iconTextField: GestureDetector(
                        onTap: () {
                          controller.confirmPasswordFieldEnabled.value =
                          !controller.confirmPasswordFieldEnabled.value;
                        },
                        child: Icon(
                          controller.confirmPasswordFieldEnabled.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors().purpleDefaultColor,
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}