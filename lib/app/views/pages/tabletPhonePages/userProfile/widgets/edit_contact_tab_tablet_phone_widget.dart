import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../helpers/platform_type.dart';
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
                height: PlatformType.isTablet(context) ? 7.h : 8.h,
                width: double.infinity,
                keyboardType: TextInputType.phone,
                maskTextInputFormatter: MasksForTextFields.phoneNumberMask,
                justRead: _userProfileTabletPhoneController.profileIsDisabled.value,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.5.h),
              child: TextFieldWidget(
                controller: _userProfileTabletPhoneController.cellPhoneTextController,
                hintText: "Celular",
                height: PlatformType.isTablet(context) ? 7.h : 8.h,
                width: double.infinity,
                keyboardType: TextInputType.phone,
                maskTextInputFormatter: _userProfileTabletPhoneController.maskCellPhoneFormatter,
                onChanged: (cellPhoneTyped) => _userProfileTabletPhoneController.phoneTextFieldEdited(cellPhoneTyped),
                justRead: _userProfileTabletPhoneController.profileIsDisabled.value,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.5.h),
              child: TextFieldWidget(
                controller: _userProfileTabletPhoneController.emailTextController,
                hintText: "E-mail",
                height: PlatformType.isTablet(context) ? 7.h : 8.h,
                width: double.infinity,
                keyboardType: TextInputType.emailAddress,
                enableSuggestions: true,
                justRead: _userProfileTabletPhoneController.profileIsDisabled.value,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.5.h),
              child: TextFieldWidget(
                controller: _userProfileTabletPhoneController.confirmEmailTextController,
                hintText: "Confirme o E-mail",
                height: PlatformType.isTablet(context) ? 7.h : 8.h,
                width: double.infinity,
                keyboardType: TextInputType.emailAddress,
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