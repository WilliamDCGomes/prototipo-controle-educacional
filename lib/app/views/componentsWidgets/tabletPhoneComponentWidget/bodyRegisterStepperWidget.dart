import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controllers/registerUserController.dart';
import '../../stylePages/appColors.dart';
import '../../stylePages/masksForTextFields.dart';
import '../dropdownButtonWidget.dart';
import '../textFieldWidget.dart';

class BodyRegisterStepperWidget extends StatefulWidget {
  late final RegisterUserController controller;
  late final int indexView;

  BodyRegisterStepperWidget(
      { Key? key,
        required this.controller,
        required this.indexView,
      }) : super(key: key);

  @override
  State<BodyRegisterStepperWidget> createState() => _BodyRegisterStepperWidgetState();
}

class _BodyRegisterStepperWidgetState extends State<BodyRegisterStepperWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Entrys da primeira stepper
        Visibility(
          visible: widget.indexView == 0,
          child: SizedBox(
            height: 30.h,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFieldWidget(
                    controller: widget.controller.nameTextController,
                    hintText: "Nome",
                    height: 6.h,
                    width: 90.w,
                    keyboardType: TextInputType.name,
                    enableSuggestions: true,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: TextFieldWidget(
                      controller: widget.controller.birthDateTextController,
                      hintText: "Data de Nascimento",
                      height: 6.h,
                      width: 90.w,
                      keyboardType: TextInputType.number,
                      maskTextInputFormatter: MasksForTextFields().birthDateMask,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: TextFieldWidget(
                      controller: widget.controller.cpfTextController,
                      hintText: "CPF",
                      height: 6.h,
                      width: 90.w,
                      keyboardType: TextInputType.number,
                      maskTextInputFormatter: MasksForTextFields().cpfMask,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Entrys da segunda stepper
        Visibility(
          visible: widget.indexView == 1,
          child: SizedBox(
            height: 45.h,
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFieldWidget(
                      controller: widget.controller.cepTextController,
                      hintText: "Cep",
                      height: 6.h,
                      width: 90.w,
                      keyboardType: TextInputType.number,
                      maskTextInputFormatter: MasksForTextFields().cepMask,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: Obx(() => SizedBox(
                        height: 5.6.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            DropdownButtonWidget(
                              itemSelected: widget.controller.ufSelected.value == "" ? null : widget.controller.ufSelected.value,
                              hintText: "Uf",
                              height: 6.h,
                              width: 23.w,
                              rxListItems: widget.controller.ufsList,
                              onChanged: (selectedState) {
                                widget.controller.ufSelected.value = selectedState ?? "";
                              },
                            ),
                            TextFieldWidget(
                              controller: widget.controller.cityTextController,
                              hintText: "Cidade",
                              height: 6.h,
                              width: 65.w,
                              keyboardType: TextInputType.name,
                              enableSuggestions: true,
                            ),
                          ],
                        ),
                      ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFieldWidget(
                            controller: widget.controller.streetTextController,
                            hintText: "Logradouro",
                            height: 6.h,
                            width: 68.w,
                            keyboardType: TextInputType.streetAddress,
                            enableSuggestions: true,
                          ),
                          TextFieldWidget(
                            controller: widget.controller.houseNumberTextController,
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
                        controller: widget.controller.neighborhoodTextController,
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
                        controller: widget.controller.complementTextController,
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
        ),

        // Entrys da terceira stepper
        Visibility(
          visible: widget.indexView == 2,
          child: SizedBox(
            height: 30.h,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFieldWidget(
                    controller: widget.controller.institutionTextController,
                    hintText: "Instituição",
                    height: 6.h,
                    width: 90.w,
                    keyboardType: TextInputType.name,
                    enableSuggestions: true,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: TextFieldWidget(
                      controller: widget.controller.courseTextController,
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
                      controller: widget.controller.periodTextController,
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
          visible: widget.indexView == 3,
          child: SizedBox(
            height: 40.h,
            child: Scrollbar(
              isAlwaysShown: true,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFieldWidget(
                      controller: widget.controller.phoneTextController,
                      hintText: "Telefone",
                      height: 6.h,
                      width: 90.w,
                      keyboardType: TextInputType.phone,
                      maskTextInputFormatter: MasksForTextFields().phoneNumberMask,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: TextFieldWidget(
                        controller: widget.controller.cellPhoneTextController,
                        hintText: "Celular",
                        height: 6.h,
                        width: 90.w,
                        keyboardType: TextInputType.phone,
                        maskTextInputFormatter: widget.controller.maskCellPhoneFormatter,

                        onChanged: (cellPhoneTyped) => widget.controller.phoneTextFieldEdited(cellPhoneTyped),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: TextFieldWidget(
                        controller: widget.controller.emailTextController,
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
                        controller: widget.controller.confirmEmailTextController,
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
        ),

        // Entrys da quinta stepper
        Visibility(
          visible: widget.indexView == 4,
          child: SizedBox(
            height: 10.h,
            width: 50,
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFieldWidget(
                    controller: widget.controller.cellPhoneVerification1TextController,
                    height: 6.h,
                    width: 8.w,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                  ),
                  TextFieldWidget(
                    controller: widget.controller.cellPhoneVerification2TextController,
                    height: 6.h,
                    width: 8.w,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                  ),
                  TextFieldWidget(
                    controller: widget.controller.cellPhoneVerification3TextController,
                    height: 6.h,
                    width: 8.w,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                  ),
                  TextFieldWidget(
                    controller: widget.controller.cellPhoneVerification4TextController,
                    height: 6.h,
                    width: 8.w,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                  ),
                  TextFieldWidget(
                    controller: widget.controller.cellPhoneVerification5TextController,
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
          visible: widget.indexView == 5,
          child: SizedBox(
            height: 10.h,
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFieldWidget(
                    controller: widget.controller.emailVerification1TextController,
                    height: 6.h,
                    width: 8.w,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                  ),
                  TextFieldWidget(
                    controller: widget.controller.emailVerification2TextController,
                    height: 6.h,
                    width: 8.w,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                  ),
                  TextFieldWidget(
                    controller: widget.controller.emailVerification3TextController,
                    height: 6.h,
                    width: 8.w,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                  ),
                  TextFieldWidget(
                    controller: widget.controller.emailVerification4TextController,
                    height: 6.h,
                    width: 8.w,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                  ),
                  TextFieldWidget(
                    controller: widget.controller.emailVerification5TextController,
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
          visible: widget.indexView == 6,
          child: SizedBox(
            height: 20.h,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Obx(() => TextFieldWidget(
                    controller: widget.controller.passwordTextController,
                    hintText: "Senha",
                    height: 6.h,
                    width: 90.w,
                    isPassword: widget.controller.passwordFieldEnabled.value,
                    iconTextField: GestureDetector(
                      onTap: () {
                        widget.controller.passwordFieldEnabled.value =
                        !widget.controller.passwordFieldEnabled.value;
                      },
                      child: Icon(
                        widget.controller.passwordFieldEnabled.value
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
                      controller: widget.controller.confirmPasswordTextController,
                      hintText: "Confirme a Senha",
                      height: 6.h,
                      width: 90.w,
                      isPassword: widget.controller.confirmPasswordFieldEnabled.value,
                      iconTextField: GestureDetector(
                        onTap: () {
                          widget.controller.confirmPasswordFieldEnabled.value =
                          !widget.controller.confirmPasswordFieldEnabled.value;
                        },
                        child: Icon(
                          widget.controller.confirmPasswordFieldEnabled.value
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