import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../utils/platform_type.dart';
import '../../../../../utils/text_field_validators.dart';
import '../../../../stylePages/masks_for_text_fields.dart';
import '../../../widgetsShared/text_field_widget.dart';
import '../controller/user_profile_tablet_phone_controller.dart';

class EditContactTabTabletPhoneWidget extends StatefulWidget {
  const EditContactTabTabletPhoneWidget({Key? key}) : super(key: key);

  @override
  State<EditContactTabTabletPhoneWidget> createState() => _EditContactTabTabletPhoneWidgetState();
}

class _EditContactTabTabletPhoneWidgetState extends State<EditContactTabTabletPhoneWidget> {
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
                controller: _userProfileTabletPhoneController.phoneTextController,
                hintText: "Telefone",
                textInputAction: TextInputAction.next,
                height: PlatformType.isTablet(context) ? 7.h : 9.h,
                width: double.infinity,
                justRead: _userProfileTabletPhoneController.profileIsDisabled.value,
                keyboardType: TextInputType.phone,
                maskTextInputFormatter: MasksForTextFields.phoneNumberMask,
                hasError: _userProfileTabletPhoneController.phoneInputHasError.value,
                validator: (String? value) {
                  String? validation = TextFieldValidators.phoneValidation(value);
                  if(validation != null && validation != ""){
                    _userProfileTabletPhoneController.phoneInputHasError.value = true;
                  }
                  else{
                    _userProfileTabletPhoneController.phoneInputHasError.value = false;
                  }
                  return validation;
                },
                onEditingComplete: (){
                  _userProfileTabletPhoneController.cellPhoneFocusNode.requestFocus();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.5.h),
              child: TextFieldWidget(
                focusNode: _userProfileTabletPhoneController.cellPhoneFocusNode,
                controller: _userProfileTabletPhoneController.cellPhoneTextController,
                hintText: "Celular",
                textInputAction: TextInputAction.next,
                height: PlatformType.isTablet(context) ? 7.h : 9.h,
                width: double.infinity,
                justRead: _userProfileTabletPhoneController.profileIsDisabled.value,
                keyboardType: TextInputType.phone,
                maskTextInputFormatter: _userProfileTabletPhoneController.maskCellPhoneFormatter,
                onChanged: (cellPhoneTyped) => _userProfileTabletPhoneController.phoneTextFieldEdited(cellPhoneTyped),
                hasError: _userProfileTabletPhoneController.cellPhoneInputHasError.value,
                validator: (String? value) {
                  String? validation = TextFieldValidators.cellPhoneValidation(value);
                  if(validation != null && validation != ""){
                    _userProfileTabletPhoneController.cellPhoneInputHasError.value = true;
                  }
                  else{
                    _userProfileTabletPhoneController.cellPhoneInputHasError.value = false;
                  }
                  return validation;
                },
                onEditingComplete: (){
                  _userProfileTabletPhoneController.emailFocusNode.requestFocus();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.5.h),
              child: TextFieldWidget(
                focusNode: _userProfileTabletPhoneController.emailFocusNode,
                controller: _userProfileTabletPhoneController.emailTextController,
                hintText: "E-mail",
                textInputAction: TextInputAction.next,
                height: PlatformType.isTablet(context) ? 7.h : 9.h,
                justRead: _userProfileTabletPhoneController.profileIsDisabled.value,
                width: double.infinity,
                keyboardType: TextInputType.emailAddress,
                enableSuggestions: true,
                hasError: _userProfileTabletPhoneController.emailInputHasError.value,
                validator: (String? value) {
                  String? validation = TextFieldValidators.emailValidation(value);
                  if(validation != null && validation != ""){
                    _userProfileTabletPhoneController.emailInputHasError.value = true;
                  }
                  else{
                    _userProfileTabletPhoneController.emailInputHasError.value = false;
                  }
                  return validation;
                },
                onEditingComplete: (){
                  _userProfileTabletPhoneController.confirmEmailFocusNode.requestFocus();
                },
              ),
            ),
            Visibility(
              visible: !_userProfileTabletPhoneController.profileIsDisabled.value,
              child: Padding(
                padding: EdgeInsets.only(top: 1.5.h),
                child: TextFieldWidget(
                  focusNode: _userProfileTabletPhoneController.confirmEmailFocusNode,
                  controller: _userProfileTabletPhoneController.confirmEmailTextController,
                  hintText: "Confirme o E-mail",
                  height: PlatformType.isTablet(context) ? 7.h : 9.h,
                  justRead: _userProfileTabletPhoneController.profileIsDisabled.value,
                  width: double.infinity,
                  keyboardType: TextInputType.emailAddress,
                  enableSuggestions: true,
                  hasError: _userProfileTabletPhoneController.confirmEmailInputHasError.value,
                  validator: (String? value) {
                    String? validation = TextFieldValidators.emailConfirmationValidation(
                      _userProfileTabletPhoneController.emailTextController.text,
                      value
                    );
                    if(validation != null && validation != ""){
                      _userProfileTabletPhoneController.confirmEmailInputHasError.value = true;
                    }
                    else{
                      _userProfileTabletPhoneController.confirmEmailInputHasError.value = false;
                    }
                    return validation;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}