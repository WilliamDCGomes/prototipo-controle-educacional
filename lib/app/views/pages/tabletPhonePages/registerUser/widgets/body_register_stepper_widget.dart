import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/pin_put_widget.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_field_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../../stylePages/masks_for_text_fields.dart';
import '../controllers/register_user_controller.dart';
import '../../../widgetsShared/dropdown_button_widget.dart';

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
    return Padding(
      padding: EdgeInsets.only(top: 2.h, bottom: 5.h),
      child: Column(
        children: [
          // Entrys da primeira stepper
          Visibility(
            visible: widget.indexView == 0,
            child: Column(
              children: [
                TextFieldWidget(
                  controller: widget.controller.nameTextController,
                  hintText: "Nome",
                  height: 6.h,
                  width: double.infinity,
                  keyboardType: TextInputType.name,
                  enableSuggestions: true,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: TextFieldWidget(
                    controller: widget.controller.birthDateTextController,
                    hintText: "Data de Nascimento",
                    height: 6.h,
                    width: double.infinity,
                    keyboardType: TextInputType.number,
                    maskTextInputFormatter: MasksForTextFields.birthDateMask,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: TextFieldWidget(
                    controller: widget.controller.cpfTextController,
                    hintText: "CPF",
                    height: 6.h,
                    width: double.infinity,
                    keyboardType: TextInputType.number,
                    maskTextInputFormatter: MasksForTextFields.cpfMask,
                  ),
                ),
              ],
            ),
          ),

          // Entrys da segunda stepper
          Visibility(
            visible: widget.indexView == 1,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: .5.h),
                  child: TextFieldWidget(
                    controller: widget.controller.cepTextController,
                    hintText: "Cep",
                    height: 6.h,
                    width: double.infinity,
                    keyboardType: TextInputType.number,
                    maskTextInputFormatter: MasksForTextFields.cepMask,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Obx(() => SizedBox(
                    height: 5.6.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 2.w
                          ),
                          child: DropdownButtonWidget(
                            itemSelected: widget.controller.ufSelected.value == "" ? null : widget.controller.ufSelected.value,
                            hintText: "Uf",
                            height: 6.h,
                            width: 23.w,
                            rxListItems: widget.controller.ufsList,
                            onChanged: (selectedState) {
                              widget.controller.ufSelected.value = selectedState ?? "";
                            },
                          ),
                        ),
                        Expanded(
                          child: TextFieldWidget(
                            controller: widget.controller.cityTextController,
                            hintText: "Cidade",
                            height: 6.h,
                            keyboardType: TextInputType.name,
                            enableSuggestions: true,
                          ),
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
                      Expanded(
                        child: TextFieldWidget(
                          controller: widget.controller.streetTextController,
                          hintText: "Logradouro",
                          height: 6.h,
                          keyboardType: TextInputType.streetAddress,
                          enableSuggestions: true,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2.w),
                        child: TextFieldWidget(
                          controller: widget.controller.houseNumberTextController,
                          hintText: "Nº",
                          height: 6.h,
                          width: 20.w,
                          keyboardType: TextInputType.number,
                        ),
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
                    width: double.infinity,
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
                    width: double.infinity,
                    keyboardType: TextInputType.text,
                    enableSuggestions: true,
                  ),
                ),
              ],
            ),
          ),

          // Entrys da terceira stepper
          Visibility(
            visible: widget.indexView == 2,
            child: Column(
              children: [
                TextFieldWidget(
                  controller: widget.controller.institutionTextController,
                  hintText: "Instituição",
                  height: 6.h,
                  width: double.infinity,
                  keyboardType: TextInputType.name,
                  enableSuggestions: true,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: TextFieldWidget(
                    controller: widget.controller.courseTextController,
                    hintText: "Curso",
                    height: 6.h,
                    width: double.infinity,
                    keyboardType: TextInputType.name,
                    enableSuggestions: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Obx(
                    () => Row(
                      children: [
                        Expanded(
                          child: DropdownButtonWidget(
                            itemSelected: widget.controller.periodSelected.value == "" ? null : widget.controller.periodSelected.value,
                            hintText: "Período",
                            height: 5.6.h,
                            listItems: widget.controller.periodList,
                            onChanged: (selectedPeriod) {
                              widget.controller.periodSelected.value = selectedPeriod ?? "";
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Entrys da quarta stepper
          Visibility(
            visible: widget.indexView == 3,
            child: Column(
              children: [
                TextFieldWidget(
                  controller: widget.controller.phoneTextController,
                  hintText: "Telefone",
                  height: 6.h,
                  width: double.infinity,
                  keyboardType: TextInputType.phone,
                  maskTextInputFormatter: MasksForTextFields.phoneNumberMask,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: TextFieldWidget(
                    controller: widget.controller.cellPhoneTextController,
                    hintText: "Celular",
                    height: 6.h,
                    width: double.infinity,
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
                    width: double.infinity,
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
                    width: double.infinity,
                    keyboardType: TextInputType.emailAddress,
                    enableSuggestions: true,
                  ),
                ),
              ],
            ),
          ),

          // Entrys da quinta stepper
          Visibility(
            visible: widget.indexView == 4,
            child: Column(
              children: [
                PinPutWidget(
                  pinController: widget.controller.pinPutSMSController,
                  height: 7.h,
                  width: 6.h,
                ),
              ],
            ),
          ),

          // Entrys da sexta stepper
          Visibility(
            visible: widget.indexView == 5,
            child: Column(
              children: [
                PinPutWidget(
                  pinController: widget.controller.pinPutEmailController,
                  height: 7.h,
                  width: 6.h,
                ),
              ],
            ),
          ),

          // Entrys da sétima stepper
          Visibility(
            visible: widget.indexView == 6,
            child: Column(
              children: [
                Obx(() => TextFieldWidget(
                  controller: widget.controller.passwordTextController,
                  hintText: "Senha",
                  height: 6.h,
                  width: double.infinity,
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
                      color: AppColors.purpleDefaultColor,
                      size: 2.5.h,
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
                    width: double.infinity,
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
                        color: AppColors.purpleDefaultColor,
                        size: 2.5.h,
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}