import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/login/page/login_page_tablet_phone_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/button_widget.dart';
import '../../../widgetsShared/text_widget.dart';

class LogoutTabletPhonePopup extends StatefulWidget {
  const LogoutTabletPhonePopup({Key? key}) : super(key: key);

  @override
  State<LogoutTabletPhonePopup> createState() => _LogoutTabletPhonePopupState();
}

class _LogoutTabletPhonePopupState extends State<LogoutTabletPhonePopup> {
  late bool showPopup;
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    showPopup = false;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      sharedPreferences = await SharedPreferences.getInstance();
      await Future.delayed(Duration(milliseconds: 150));
      setState(() {
        showPopup = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Visibility(
        visible: showPopup,
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1.h),
          ),
          child: Container(
            width: 75.w,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(1.h),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 90.w,
                  padding: EdgeInsets.all(1.h),
                  decoration: BoxDecoration(
                    color: AppColors.purpleDefaultColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(1.h),
                      topLeft: Radius.circular(1.h),
                    ),
                  ),
                  child: TextWidget(
                    "SAIR",
                    textColor: AppColors.whiteColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextWidget(
                        "Deseja mesmo sair do aplicativo?",
                        textColor: AppColors.blackColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ButtonWidget(
                              hintText: "NÃO",
                              heightButton: 5.h,
                              widthButton: 32.w,
                              fontWeight: FontWeight.bold,
                              backgroundColor: AppColors.whiteColor,
                              borderColor: AppColors.orangeColor,
                              textColor: AppColors.orangeColor,
                              onPressed: () => Get.back(),
                            ),
                            ButtonWidget(
                              hintText: "SIM",
                              heightButton: 5.h,
                              widthButton: 32.w,
                              fontWeight: FontWeight.bold,
                              onPressed: () async {
                                await sharedPreferences.setBool("keep-connected", false);
                                Get.offAll(() => LoginPageTabletPhone(cancelFingerPrint: true,));
                              },
                            ),
                          ],
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
    );
  }
}