import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../shared/widgets/title_with_back_button_widget.dart';
import '../controller/student_card_controller.dart';
import '../../../../../helpers/paths.dart';
import '../../../../stylePages/app_colors.dart';

class StudentCardTabletPhonePage extends StatefulWidget {
  const StudentCardTabletPhonePage({Key? key}) : super(key: key);

  @override
  State<StudentCardTabletPhonePage> createState() => _StudentCardTabletPhonePageState();
}

class _StudentCardTabletPhonePageState extends State<StudentCardTabletPhonePage> {
  late StudentCardController controller;

  @override
  void initState() {
    controller = Get.put(StudentCardController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: AppColors.backgroundFirstScreenColor,
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: SvgPicture.asset(
                    Paths.Ilustracao_Topo,
                    width: 25.w,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(2.h, 2.h, 2.h, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: TitleWithBackButtonWidget(
                              title: "Carteirinha Online",
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Stack(
                          children: [
                            Center(
                              child: Image.asset(
                                Paths.Carteirinha_PCE,
                                width: 90.w,
                              ),
                            ),
                            SizedBox(
                              width: 90.w,
                              child: Padding(
                                padding: EdgeInsets.only(left: 5.w, top: 5.h, right: 5.w),
                                child: TextWidget(
                                  "0026 2659 0211 0365",
                                  textColor: AppColors.whiteColor,
                                  fontSize: 17.sp,
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 90.w,
                              child: Padding(
                                padding: EdgeInsets.only(left: 5.w, top: 12.5.h, right: 5.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      "RA:",
                                      textColor: AppColors.whiteColor,
                                      fontSize: 14.sp,
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                    ),
                                    TextWidget(
                                      "48467",
                                      textColor: AppColors.whiteColor,
                                      fontSize: 15.sp,
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 90.w,
                              child: Padding(
                                padding: EdgeInsets.only(left: 5.w, top: 17.h, right: 5.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                          "Nome:",
                                          textColor: AppColors.whiteColor,
                                          fontSize: 14.sp,
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                        ),
                                        TextWidget(
                                          "WILLIAM DOUGLAS",
                                          textColor: AppColors.whiteColor,
                                          fontSize: 15.sp,
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                          "Validade:",
                                          textColor: AppColors.whiteColor,
                                          fontSize: 14.sp,
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                        ),
                                        TextWidget(
                                          "12/2022",
                                          textColor: AppColors.whiteColor,
                                          fontSize: 15.sp,
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
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
