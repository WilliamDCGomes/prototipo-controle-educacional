import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../utils/platform_type.dart';
import '../../../../stylePages/masks_for_text_fields.dart';
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
                height: PlatformType.isTablet(context) ? 7.h : 8.h,
                width: double.infinity,
                keyboardType: TextInputType.name,
                enableSuggestions: true,
                justRead: _userProfileTabletPhoneController.profileIsDisabled.value,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.5.h),
              child: TextFieldWidget(
                controller: _userProfileTabletPhoneController.raTextController,
                hintText: "RA",
                height: PlatformType.isTablet(context) ? 7.h : 8.h,
                width: double.infinity,
                keyboardType: TextInputType.number,
                justRead: _userProfileTabletPhoneController.profileIsDisabled.value,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.5.h),
              child: TextFieldWidget(
                controller: _userProfileTabletPhoneController.birthDateTextController,
                hintText: "Data de Nascimento",
                height: PlatformType.isTablet(context) ? 7.h : 8.h,
                width: double.infinity,
                keyboardType: TextInputType.number,
                maskTextInputFormatter: MasksForTextFields.birthDateMask,
                justRead: _userProfileTabletPhoneController.profileIsDisabled.value,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.5.h),
              child: TextFieldWidget(
                controller: _userProfileTabletPhoneController.cpfTextController,
                hintText: "CPF",
                height: PlatformType.isTablet(context) ? 7.h : 8.h,
                width: double.infinity,
                keyboardType: TextInputType.number,
                maskTextInputFormatter: MasksForTextFields.cpfMask,
                justRead: _userProfileTabletPhoneController.profileIsDisabled.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}