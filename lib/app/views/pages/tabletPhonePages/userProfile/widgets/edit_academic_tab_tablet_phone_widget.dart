import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../utils/platform_type.dart';
import '../../../widgetsShared/dropdown_button_widget.dart';
import '../../../widgetsShared/text_field_widget.dart';
import '../controller/user_profile_tablet_phone_controller.dart';

class EditAcademicTabTabletPhoneWidget extends StatefulWidget {
  const EditAcademicTabTabletPhoneWidget({Key? key}) : super(key: key);

  @override
  State<EditAcademicTabTabletPhoneWidget> createState() => _EditAcademicTabTabletPhoneWidgetState();
}

class _EditAcademicTabTabletPhoneWidgetState extends State<EditAcademicTabTabletPhoneWidget> {
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
      child: IgnorePointer(
        ignoring: true,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 1.h),
              child: TextFieldWidget(
                controller: _userProfileTabletPhoneController.institutionTextController,
                hintText: "Instituição",
                height: PlatformType.isTablet(context) ? 7.h : 8.h,
                width: double.infinity,
                keyboardType: TextInputType.name,
                enableSuggestions: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.5.h),
              child: TextFieldWidget(
                controller: _userProfileTabletPhoneController.courseTextController,
                hintText: "Curso",
                height: PlatformType.isTablet(context) ? 7.h : 8.h,
                width: double.infinity,
                keyboardType: TextInputType.name,
                enableSuggestions: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.5.h),
              child: Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: DropdownButtonWidget(
                        itemSelected: _userProfileTabletPhoneController.periodSelected.value == "" ? null : _userProfileTabletPhoneController.periodSelected.value,
                        hintText: "Período",
                        height: 5.6.h,
                        listItems: _userProfileTabletPhoneController.periodList,
                        onChanged: (selectedPeriod) {
                          _userProfileTabletPhoneController.periodSelected.value = selectedPeriod ?? "";
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
    );
  }
}