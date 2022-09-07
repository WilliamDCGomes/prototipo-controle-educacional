import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/userProfile/controller/user_profile_tablet_phone_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../utils/loading.dart';
import '../../../../../utils/platform_type.dart';
import '../../../../../utils/text_field_validators.dart';
import '../../../../stylePages/masks_for_text_fields.dart';
import '../../../widgetsShared/dropdown_button_widget.dart';
import '../../../widgetsShared/text_field_widget.dart';

class UserProfileTabsWidget{
  static List<Widget> getList(UserProfileTabletPhoneController controller) {
    return [
      Obx(
        () => Padding(
          padding: EdgeInsets.symmetric(horizontal: .5.w),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: TextFieldWidget(
                  controller: controller.nameTextController,
                  hintText: "Nome",
                  textCapitalization: TextCapitalization.words,
                  height: PlatformType.isTablet(Get.context!) ? 7.h : 9.h,
                  width: double.infinity,
                  keyboardType: TextInputType.name,
                  enableSuggestions: true,
                  justRead: controller.profileIsDisabled.value,
                  textInputAction: TextInputAction.next,
                  hasError: controller.nameInputHasError.value,
                  onEditingComplete: (){
                    controller.birthDateFocusNode.requestFocus();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.5.h),
                child: TextFieldWidget(
                  focusNode: controller.birthDateFocusNode,
                  controller: controller.birthDateTextController,
                  hintText: "Data de Nascimento",
                  height: PlatformType.isTablet(Get.context!) ? 7.h : 9.h,
                  width: double.infinity,
                  justRead: controller.profileIsDisabled.value,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  maskTextInputFormatter: MasksForTextFields.birthDateMask,
                  hasError: controller.birthdayInputHasError.value,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.5.h, bottom: 1.5),
                child: Row(
                  children: [
                    Expanded(
                      child: DropdownButtonWidget(
                        itemSelected: controller.genderSelected.value == "" ? null : controller.genderSelected.value,
                        hintText: "Sexo",
                        justRead: controller.profileIsDisabled.value,
                        height: PlatformType.isTablet(Get.context!) ? 5.h : 6.5.h,
                        width: 90.w,
                        listItems: controller.genderList,
                        onChanged: (selectedState) {
                          controller.genderSelected.value = selectedState ?? "";
                          controller.showOtherGenderType.value = selectedState == "Outro (Qual?)";
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: controller.showOtherGenderType.value,
                child: Padding(
                  padding: EdgeInsets.only(top: 3.h),
                  child: TextFieldWidget(
                    controller: controller.otherGenderTypeTextController,
                    hintText: "Informe o seu Gênero",
                    hasError: controller.otherGenderInputHasError.value,
                    justRead: controller.profileIsDisabled.value,
                    textCapitalization: TextCapitalization.sentences,
                    height: PlatformType.isTablet(Get.context!) ? 7.h : 9.h,
                    width: double.infinity,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: controller.showOtherGenderType.value ? 1.5.h : 3.h),
                child: TextFieldWidget(
                  controller: controller.cpfTextController,
                  hintText: "CPF",
                  height: PlatformType.isTablet(Get.context!) ? 7.h : 9.h,
                  width: double.infinity,
                  keyboardType: TextInputType.number,
                  maskTextInputFormatter: MasksForTextFields.cpfMask,
                  justRead: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.5.h),
                child: TextFieldWidget(
                  controller: controller.raTextController,
                  hintText: "RA",
                  height: PlatformType.isTablet(Get.context!) ? 7.h : 9.h,
                  width: double.infinity,
                  keyboardType: TextInputType.number,
                  justRead: true,
                ),
              ),
            ],
          ),
        ),
      ),
      Obx(
        () => Padding(
          padding: EdgeInsets.symmetric(horizontal: .5.w),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: TextFieldWidget(
                  controller: controller.cepTextController,
                  hintText: "Cep",
                  height: PlatformType.isTablet(Get.context!) ? 7.h : 9.h,
                  width: double.infinity,
                  keyboardType: TextInputType.number,
                  justRead: controller.profileIsDisabled.value,
                  textInputAction: TextInputAction.next,
                  maskTextInputFormatter: MasksForTextFields.cepMask,
                  hasError: controller.cepInputHasError.value,
                  onChanged: (value) async {
                    if(value.length == 9){
                      await Loading.startAndPauseLoading(
                        () => controller.searchAddressInformation(),
                        controller.loadingAnimation,
                        controller.loadingWithSuccessOrErrorTabletPhoneWidget,
                      );
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.5.h),
                child: SizedBox(
                  height: PlatformType.isTablet(Get.context!) ? 7.h : 9.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: 2.w,
                          bottom: PlatformType.isTablet(Get.context!) ? 1.7.h : 2.6.h,
                        ),
                        child: DropdownButtonWidget(
                          itemSelected: controller.ufSelected.value == "" ? null : controller.ufSelected.value,
                          hintText: "Uf",
                          height: PlatformType.isTablet(Get.context!) ? 5.6.h : 6.5.h,
                          width: 23.w,
                          justRead: controller.profileIsDisabled.value,
                          rxListItems: controller.ufsList,
                          onChanged: (selectedState) {
                            controller.ufSelected.value = selectedState ?? "";
                          },
                        ),
                      ),
                      Expanded(
                        child: TextFieldWidget(
                          controller: controller.cityTextController,
                          hintText: "Cidade",
                          textCapitalization: TextCapitalization.words,
                          height: PlatformType.isTablet(Get.context!) ? 7.h : 9.h,
                          keyboardType: TextInputType.name,
                          enableSuggestions: true,
                          textInputAction: TextInputAction.next,
                          justRead: controller.profileIsDisabled.value,
                          hasError: controller.cityInputHasError.value,
                          onEditingComplete: (){
                            controller.streetFocusNode.requestFocus();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFieldWidget(
                        focusNode: controller.streetFocusNode,
                        controller: controller.streetTextController,
                        hintText: "Logradouro",
                        textCapitalization: TextCapitalization.words,
                        height: PlatformType.isTablet(Get.context!) ? 7.h : 9.h,
                        keyboardType: TextInputType.streetAddress,
                        enableSuggestions: true,
                        justRead: controller.profileIsDisabled.value,
                        textInputAction: TextInputAction.next,
                        hasError: controller.streetInputHasError.value,
                        validator: (String? value) {
                          String? validation = TextFieldValidators.standardValidation(value, "Informe o Logradouro");
                          if(validation != null && validation != ""){
                            controller.streetInputHasError.value = true;
                          }
                          else{
                            controller.streetInputHasError.value = false;
                          }
                          return validation;
                        },
                        onEditingComplete: (){
                          controller.houseNumberFocusNode.requestFocus();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 2.w),
                      child: TextFieldWidget(
                        focusNode: controller.houseNumberFocusNode,
                        controller: controller.houseNumberTextController,
                        hintText: "Nº",
                        justRead: controller.profileIsDisabled.value,
                        textInputAction: TextInputAction.next,
                        height: PlatformType.isTablet(Get.context!) ? 7.h : 9.h,
                        width: 20.w,
                        keyboardType: TextInputType.number,
                        onEditingComplete: (){
                          controller.neighborhoodFocusNode.requestFocus();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.5.h),
                child: TextFieldWidget(
                  focusNode: controller.neighborhoodFocusNode,
                  controller: controller.neighborhoodTextController,
                  hintText: "Bairro",
                  justRead: controller.profileIsDisabled.value,
                  textCapitalization: TextCapitalization.words,
                  height: PlatformType.isTablet(Get.context!) ? 7.h : 9.h,
                  width: double.infinity,
                  keyboardType: TextInputType.name,
                  enableSuggestions: true,
                  textInputAction: TextInputAction.next,
                  hasError: controller.neighborhoodInputHasError.value,
                  onEditingComplete: (){
                    controller.complementFocusNode.requestFocus();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.5.h),
                child: TextFieldWidget(
                  focusNode: controller.complementFocusNode,
                  controller: controller.complementTextController,
                  hintText: "Complemento",
                  textCapitalization: TextCapitalization.sentences,
                  height: PlatformType.isTablet(Get.context!) ? 7.h : 9.h,
                  width: double.infinity,
                  keyboardType: TextInputType.text,
                  enableSuggestions: true,
                  justRead: controller.profileIsDisabled.value,
                ),
              ),
            ],
          ),
        ),
      ),
      Obx(
        () => Padding(
          padding: EdgeInsets.symmetric(horizontal: .5.w),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: TextFieldWidget(
                  controller: controller.phoneTextController,
                  hintText: "Telefone",
                  textInputAction: TextInputAction.next,
                  height: PlatformType.isTablet(Get.context!) ? 7.h : 9.h,
                  width: double.infinity,
                  justRead: controller.profileIsDisabled.value,
                  keyboardType: TextInputType.phone,
                  maskTextInputFormatter: MasksForTextFields.phoneNumberMask,
                  hasError: controller.phoneInputHasError.value,
                  onEditingComplete: (){
                    controller.cellPhoneFocusNode.requestFocus();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.5.h),
                child: TextFieldWidget(
                  focusNode: controller.cellPhoneFocusNode,
                  controller: controller.cellPhoneTextController,
                  hintText: "Celular",
                  textInputAction: TextInputAction.next,
                  height: PlatformType.isTablet(Get.context!) ? 7.h : 9.h,
                  width: double.infinity,
                  justRead: controller.profileIsDisabled.value,
                  keyboardType: TextInputType.phone,
                  maskTextInputFormatter: controller.maskCellPhoneFormatter,
                  onChanged: (cellPhoneTyped) => controller.phoneTextFieldEdited(cellPhoneTyped),
                  hasError: controller.cellPhoneInputHasError.value,
                  onEditingComplete: (){
                    controller.emailFocusNode.requestFocus();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.5.h),
                child: TextFieldWidget(
                  focusNode: controller.emailFocusNode,
                  controller: controller.emailTextController,
                  hintText: "E-mail",
                  textInputAction: TextInputAction.next,
                  height: PlatformType.isTablet(Get.context!) ? 7.h : 9.h,
                  justRead: controller.profileIsDisabled.value,
                  width: double.infinity,
                  keyboardType: TextInputType.emailAddress,
                  enableSuggestions: true,
                  hasError: controller.emailInputHasError.value,
                  onEditingComplete: (){
                    controller.confirmEmailFocusNode.requestFocus();
                  },
                ),
              ),
              Visibility(
                visible: !controller.profileIsDisabled.value,
                child: Padding(
                  padding: EdgeInsets.only(top: 1.5.h),
                  child: TextFieldWidget(
                    focusNode: controller.confirmEmailFocusNode,
                    controller: controller.confirmEmailTextController,
                    hintText: "Confirme o E-mail",
                    height: PlatformType.isTablet(Get.context!) ? 7.h : 9.h,
                    justRead: controller.profileIsDisabled.value,
                    width: double.infinity,
                    keyboardType: TextInputType.emailAddress,
                    enableSuggestions: true,
                    hasError: controller.confirmEmailInputHasError.value,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Obx(
        () => Padding(
          padding: EdgeInsets.symmetric(horizontal: .5.w),
          child: IgnorePointer(
            ignoring: true,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 1.h),
                  child: TextFieldWidget(
                    controller: controller.institutionTextController,
                    hintText: "Instituição",
                    height: PlatformType.isTablet(Get.context!) ? 7.h : 9.h,
                    width: double.infinity,
                    keyboardType: TextInputType.name,
                    enableSuggestions: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.5.h),
                  child: TextFieldWidget(
                    controller: controller.courseTextController,
                    hintText: "Curso",
                    height: PlatformType.isTablet(Get.context!) ? 7.h : 9.h,
                    width: double.infinity,
                    keyboardType: TextInputType.name,
                    enableSuggestions: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.5.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: DropdownButtonWidget(
                          itemSelected: controller.periodSelected.value == "" ? null : controller.periodSelected.value,
                          hintText: "Período",
                          height: PlatformType.isTablet(Get.context!) ? 5.6.h : 6.5.h,
                          listItems: controller.periodList,
                          onChanged: (selectedPeriod) {
                            controller.periodSelected.value = selectedPeriod ?? "";
                          },
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
    ];
  }
}