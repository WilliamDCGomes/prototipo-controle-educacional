import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/button_widget.dart';
import '../../../widgetsShared/text_widget.dart';

class ConfirmationTabletPhonePopup extends StatefulWidget {
  final String title;
  final String? subTitle;
  final String? firstButtonText;
  final String? secondButtonText;
  final Function firstButton;
  final Function secondButton;

  const ConfirmationTabletPhonePopup({
    Key? key,
    required this.title,
    this.subTitle,
    this.firstButtonText,
    this.secondButtonText,
    required this.firstButton,
    required this.secondButton,
  }) : super(key: key);

  @override
  State<ConfirmationTabletPhonePopup> createState() => _ConfirmationTabletPhonePopupState();
}

class _ConfirmationTabletPhonePopupState extends State<ConfirmationTabletPhonePopup> {
  late bool showPopup;

  @override
  void initState() {
    showPopup = false;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
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
                    widget.title,
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
                        widget.subTitle ?? "",
                        textColor: AppColors.blackColor,
                        fontSize: 16.sp,
                        maxLines: 5,
                        fontWeight: FontWeight.bold,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ButtonWidget(
                              hintText: widget.firstButtonText ?? "NÃO",
                              heightButton: 5.h,
                              widthButton: 32.w,
                              fontWeight: FontWeight.bold,
                              backgroundColor: AppColors.whiteColor,
                              borderColor: AppColors.orangeColor,
                              textColor: AppColors.orangeColor,
                              onPressed: () {
                                widget.firstButton();
                                Get.back();
                              },
                            ),
                            ButtonWidget(
                              hintText: widget.secondButtonText ?? "SIM",
                              heightButton: 5.h,
                              widthButton: 32.w,
                              fontWeight: FontWeight.bold,
                              onPressed: () {
                                widget.secondButton();
                                Get.back();
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