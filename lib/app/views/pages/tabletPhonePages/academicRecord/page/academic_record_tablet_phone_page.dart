import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../widgetsShared/text_button_widget.dart';
import '../../shared/widgets/title_with_back_button_tablet_phone_widget.dart';
import '../../../../../helpers/paths.dart';
import '../../../../../helpers/platform_type.dart';
import '../../../../stylePages/app_colors.dart';
import '../controller/academic_record_tablet_phone_controller.dart';

class AcademicRecordTabletPhonePage extends StatefulWidget {
  const AcademicRecordTabletPhonePage({Key? key}) : super(key: key);

  @override
  State<AcademicRecordTabletPhonePage> createState() => _AcademicRecordTabletPhonePageState();
}

class _AcademicRecordTabletPhonePageState extends State<AcademicRecordTabletPhonePage> {
  late AcademicRecordTabletPhoneController controller;

  @override
  void initState() {
    controller = Get.put(AcademicRecordTabletPhoneController());
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TitleWithBackButtonTabletPhoneWidget(
                                title: "Histórico Acadêmico",
                              ),
                            ),
                            TextButtonWidget(
                              onTap: () {

                              },
                              height: 6.5.w,
                              width: 7.w,
                              componentPadding: EdgeInsets.all(.5.w),
                              widgetCustom: Center(
                                child: Icon(
                                  Icons.download_rounded,
                                  size: 6.w,
                                  color: AppColors.purpleDefaultColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: PlatformType.isTablet(context) ? 9.h : 7.h,
                          ),
                          child: Center(
                            child: controller.cardAcademicRecordTabletPhoneWidget
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.all(2.h),
                    margin: EdgeInsets.only(
                      top: PlatformType.isTablet(context) ? 14.h : 12.h,
                      right: 2.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.5.h),
                      color: AppColors.whiteColor,
                    ),
                    child: Image.asset(
                      Paths.Icone_Exibicao_Historico_Academico,
                      height: 5.h,
                      width: 5.h,
                    ),
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