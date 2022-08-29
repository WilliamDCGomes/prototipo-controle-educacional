import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../utils/loading.dart';
import '../../../../../utils/platform_type.dart';
import '../../../../../utils/text_field_validators.dart';
import '../../../../stylePages/masks_for_text_fields.dart';
import '../../../widgetsShared/dropdown_button_widget.dart';
import '../../../widgetsShared/text_field_widget.dart';
import '../controller/user_profile_tablet_phone_controller.dart';

class EditAddressTabTabletPhoneWidget extends StatefulWidget {
  const EditAddressTabTabletPhoneWidget({Key? key}) : super(key: key);

  @override
  State<EditAddressTabTabletPhoneWidget> createState() => _EditAddressTabTabletPhoneWidgetState();
}

class _EditAddressTabTabletPhoneWidgetState extends State<EditAddressTabTabletPhoneWidget> {
  late UserProfileTabletPhoneController _userProfileTabletPhoneController;

  @override
  void initState() {
    _userProfileTabletPhoneController = Get.find(tag: 'user-profile-tablet-phone-controller');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: .5.w),
      child: Obx(
        () => ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 1.h),
              child: TextFieldWidget(
                controller: _userProfileTabletPhoneController.cepTextController,
                hintText: "Cep",
                height: PlatformType.isTablet(context) ? 7.h : 9.h,
                width: double.infinity,
                keyboardType: TextInputType.number,
                justRead: _userProfileTabletPhoneController.profileIsDisabled.value,
                textInputAction: TextInputAction.next,
                maskTextInputFormatter: MasksForTextFields.cepMask,
                hasError: _userProfileTabletPhoneController.cepInputHasError.value,
                onChanged: (value) async {
                  if(value.length == 9){
                    await Loading.startAndPauseLoading(
                          () => _userProfileTabletPhoneController.searchAddressInformation(),
                      _userProfileTabletPhoneController.loadingAnimation,
                      _userProfileTabletPhoneController.loadingWithSuccessOrErrorTabletPhoneWidget,
                    );
                  }
                },
                validator: (String? value) {
                  String? validation = TextFieldValidators.minimumNumberValidation(value, 9, "Cep");
                  if(validation != null && validation != ""){
                    _userProfileTabletPhoneController.cepInputHasError.value = true;
                  }
                  else{
                    _userProfileTabletPhoneController.cepInputHasError.value = false;
                  }
                  return validation;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.5.h),
              child: SizedBox(
                height: PlatformType.isTablet(context) ? 7.h : 9.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: 2.w,
                        bottom: PlatformType.isTablet(context) ? 1.7.h : 2.6.h,
                      ),
                      child: DropdownButtonWidget(
                        itemSelected: _userProfileTabletPhoneController.ufSelected.value == "" ? null : _userProfileTabletPhoneController.ufSelected.value,
                        hintText: "Uf",
                        height: PlatformType.isTablet(context) ? 5.6.h : 6.5.h,
                        width: 23.w,
                        justRead: _userProfileTabletPhoneController.profileIsDisabled.value,
                        rxListItems: _userProfileTabletPhoneController.ufsList,
                        onChanged: (selectedState) {
                          _userProfileTabletPhoneController.ufSelected.value = selectedState ?? "";
                        },
                      ),
                    ),
                    Expanded(
                      child: TextFieldWidget(
                        controller: _userProfileTabletPhoneController.cityTextController,
                        hintText: "Cidade",
                        textCapitalization: TextCapitalization.words,
                        height: PlatformType.isTablet(context) ? 7.h : 9.h,
                        keyboardType: TextInputType.name,
                        enableSuggestions: true,
                        textInputAction: TextInputAction.next,
                        justRead: _userProfileTabletPhoneController.profileIsDisabled.value,
                        hasError: _userProfileTabletPhoneController.cityInputHasError.value,
                        validator: (String? value) {
                          String? validation = TextFieldValidators.standardValidation(value, "Informe a Cidade");
                          if(validation != null && validation != ""){
                            _userProfileTabletPhoneController.cityInputHasError.value = true;
                          }
                          else{
                            _userProfileTabletPhoneController.cityInputHasError.value = false;
                          }
                          return validation;
                        },
                        onEditingComplete: (){
                          _userProfileTabletPhoneController.streetFocusNode.requestFocus();
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
                      focusNode: _userProfileTabletPhoneController.streetFocusNode,
                      controller: _userProfileTabletPhoneController.streetTextController,
                      hintText: "Logradouro",
                      textCapitalization: TextCapitalization.words,
                      height: PlatformType.isTablet(context) ? 7.h : 9.h,
                      keyboardType: TextInputType.streetAddress,
                      enableSuggestions: true,
                      justRead: _userProfileTabletPhoneController.profileIsDisabled.value,
                      textInputAction: TextInputAction.next,
                      hasError: _userProfileTabletPhoneController.streetInputHasError.value,
                      validator: (String? value) {
                        String? validation = TextFieldValidators.standardValidation(value, "Informe o Logradouro");
                        if(validation != null && validation != ""){
                          _userProfileTabletPhoneController.streetInputHasError.value = true;
                        }
                        else{
                          _userProfileTabletPhoneController.streetInputHasError.value = false;
                        }
                        return validation;
                      },
                      onEditingComplete: (){
                        _userProfileTabletPhoneController.houseNumberFocusNode.requestFocus();
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 2.w),
                    child: TextFieldWidget(
                      focusNode: _userProfileTabletPhoneController.houseNumberFocusNode,
                      controller: _userProfileTabletPhoneController.houseNumberTextController,
                      hintText: "Nº",
                      justRead: _userProfileTabletPhoneController.profileIsDisabled.value,
                      textInputAction: TextInputAction.next,
                      height: PlatformType.isTablet(context) ? 7.h : 9.h,
                      width: 20.w,
                      keyboardType: TextInputType.number,
                      onEditingComplete: (){
                        _userProfileTabletPhoneController.neighborhoodFocusNode.requestFocus();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.5.h),
              child: TextFieldWidget(
                focusNode: _userProfileTabletPhoneController.neighborhoodFocusNode,
                controller: _userProfileTabletPhoneController.neighborhoodTextController,
                hintText: "Bairro",
                justRead: _userProfileTabletPhoneController.profileIsDisabled.value,
                textCapitalization: TextCapitalization.words,
                height: PlatformType.isTablet(context) ? 7.h : 9.h,
                width: double.infinity,
                keyboardType: TextInputType.name,
                enableSuggestions: true,
                textInputAction: TextInputAction.next,
                hasError: _userProfileTabletPhoneController.neighborhoodInputHasError.value,
                validator: (String? value) {
                  String? validation = TextFieldValidators.standardValidation(value, "Informe o Bairro");
                  if(validation != null && validation != ""){
                    _userProfileTabletPhoneController.neighborhoodInputHasError.value = true;
                  }
                  else{
                    _userProfileTabletPhoneController.neighborhoodInputHasError.value = false;
                  }
                  return validation;
                },
                onEditingComplete: (){
                  _userProfileTabletPhoneController.complementFocusNode.requestFocus();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.5.h),
              child: TextFieldWidget(
                focusNode: _userProfileTabletPhoneController.complementFocusNode,
                controller: _userProfileTabletPhoneController.complementTextController,
                hintText: "Complemento",
                textCapitalization: TextCapitalization.sentences,
                height: PlatformType.isTablet(context) ? 7.h : 9.h,
                width: double.infinity,
                keyboardType: TextInputType.text,
                enableSuggestions: true,
                justRead: _userProfileTabletPhoneController.profileIsDisabled.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}