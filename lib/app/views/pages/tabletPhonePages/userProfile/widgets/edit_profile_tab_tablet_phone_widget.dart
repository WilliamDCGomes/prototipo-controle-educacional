import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../utils/platform_type.dart';
import '../../../../../utils/text_field_validators.dart';
import '../../../../stylePages/masks_for_text_fields.dart';
import '../../../widgetsShared/dropdown_button_widget.dart';
import '../../../widgetsShared/text_field_widget.dart';
import '../controller/user_profile_tablet_phone_controller.dart';

class EditProfileTabTabletPhoneWidget extends StatefulWidget {
  const EditProfileTabTabletPhoneWidget({Key? key}) : super(key: key);

  @override
  State<EditProfileTabTabletPhoneWidget> createState() => _EditProfileTabTabletPhoneWidgetState();
}

class _EditProfileTabTabletPhoneWidgetState extends State<EditProfileTabTabletPhoneWidget> {
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
                controller: _userProfileTabletPhoneController.nameTextController,
                hintText: "Nome",
                textCapitalization: TextCapitalization.words,
                height: PlatformType.isTablet(context) ? 7.h : 9.h,
                width: double.infinity,
                keyboardType: TextInputType.name,
                enableSuggestions: true,
                justRead: _userProfileTabletPhoneController.profileIsDisabled.value,
                textInputAction: TextInputAction.next,
                hasError: _userProfileTabletPhoneController.nameInputHasError.value,
                validator: (String? value) {
                  String? validation = TextFieldValidators.standardValidation(value, "Informe o seu Nome");
                  if(validation != null && validation != ""){
                    _userProfileTabletPhoneController.nameInputHasError.value = true;
                  }
                  else{
                    _userProfileTabletPhoneController.nameInputHasError.value = false;
                  }
                  return validation;
                },
                onEditingComplete: (){
                  _userProfileTabletPhoneController.birthDateFocusNode.requestFocus();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.5.h),
              child: TextFieldWidget(
                focusNode: _userProfileTabletPhoneController.birthDateFocusNode,
                controller: _userProfileTabletPhoneController.birthDateTextController,
                hintText: "Data de Nascimento",
                height: PlatformType.isTablet(context) ? 7.h : 9.h,
                width: double.infinity,
                justRead: _userProfileTabletPhoneController.profileIsDisabled.value,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                maskTextInputFormatter: MasksForTextFields.birthDateMask,
                hasError: _userProfileTabletPhoneController.birthdayInputHasError.value,
                validator: (String? value) {
                  String? validation = TextFieldValidators.birthDayValidation(value, "de Nascimento");
                  if(validation != null && validation != ""){
                    _userProfileTabletPhoneController.birthdayInputHasError.value = true;
                  }
                  else{
                    _userProfileTabletPhoneController.birthdayInputHasError.value = false;
                  }
                  return validation;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.5.h, bottom: 1.5),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButtonWidget(
                      itemSelected: _userProfileTabletPhoneController.genderSelected.value == "" ? null : _userProfileTabletPhoneController.genderSelected.value,
                      hintText: "Sexo",
                      justRead: _userProfileTabletPhoneController.profileIsDisabled.value,
                      height: PlatformType.isTablet(context) ? 5.h : 6.5.h,
                      width: 90.w,
                      listItems: _userProfileTabletPhoneController.genderList,
                      onChanged: (selectedState) {
                        _userProfileTabletPhoneController.genderSelected.value = selectedState ?? "";
                        _userProfileTabletPhoneController.showOtherGenderType.value = selectedState == "Outro (Qual?)";
                      },
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: _userProfileTabletPhoneController.showOtherGenderType.value,
              child: Padding(
                padding: EdgeInsets.only(top: 3.h),
                child: TextFieldWidget(
                  controller: _userProfileTabletPhoneController.otherGenderTypeTextController,
                  hintText: "Informe o seu Gênero",
                  justRead: _userProfileTabletPhoneController.profileIsDisabled.value,
                  textCapitalization: TextCapitalization.sentences,
                  height: PlatformType.isTablet(context) ? 7.h : 9.h,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: _userProfileTabletPhoneController.showOtherGenderType.value ? 1.5.h : 3.h),
              child: TextFieldWidget(
                controller: _userProfileTabletPhoneController.cpfTextController,
                hintText: "CPF",
                height: PlatformType.isTablet(context) ? 7.h : 9.h,
                width: double.infinity,
                keyboardType: TextInputType.number,
                maskTextInputFormatter: MasksForTextFields.cpfMask,
                justRead: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.5.h),
              child: TextFieldWidget(
                controller: _userProfileTabletPhoneController.raTextController,
                hintText: "RA",
                height: PlatformType.isTablet(context) ? 7.h : 9.h,
                width: double.infinity,
                keyboardType: TextInputType.number,
                justRead: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}