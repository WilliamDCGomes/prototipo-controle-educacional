import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
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
                height: 6.h,
                width: double.infinity,
                keyboardType: TextInputType.number,
                maskTextInputFormatter: MasksForTextFields.cepMask,
                justRead: _userProfileTabletPhoneController.profileIsDisabled.value,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3.h),
              child: SizedBox(
                height: 5.6.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 2.w
                      ),
                      child: DropdownButtonWidget(
                        itemSelected: _userProfileTabletPhoneController.ufSelected.value == "" ? null : _userProfileTabletPhoneController.ufSelected.value,
                        hintText: "Uf",
                        height: 6.h,
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
                        height: 6.h,
                        keyboardType: TextInputType.name,
                        enableSuggestions: true,
                        justRead: _userProfileTabletPhoneController.profileIsDisabled.value,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      controller: _userProfileTabletPhoneController.streetTextController,
                      hintText: "Logradouro",
                      height: 6.h,
                      keyboardType: TextInputType.streetAddress,
                      enableSuggestions: true,
                      justRead: _userProfileTabletPhoneController.profileIsDisabled.value,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 2.w),
                    child: TextFieldWidget(
                      controller: _userProfileTabletPhoneController.houseNumberTextController,
                      hintText: "Nº",
                      height: 6.h,
                      width: 20.w,
                      keyboardType: TextInputType.number,
                      justRead: _userProfileTabletPhoneController.profileIsDisabled.value,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3.h),
              child: TextFieldWidget(
                controller: _userProfileTabletPhoneController.neighborhoodTextController,
                hintText: "Bairro",
                height: 6.h,
                width: double.infinity,
                keyboardType: TextInputType.name,
                enableSuggestions: true,
                justRead: _userProfileTabletPhoneController.profileIsDisabled.value,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3.h),
              child: TextFieldWidget(
                controller: _userProfileTabletPhoneController.complementTextController,
                hintText: "Complemento",
                height: 6.h,
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