import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../base/viewController/curriculum_delivery_view_controller.dart';
import '../../../../../helpers/paths.dart';
import '../../../../../helpers/platform_type.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../shared/widgets/title_with_back_button_tablet_phone_widget.dart';
import '../controller/academic_details_tablet_phone_controller.dart';
import '../widgets/classes_card_tablet_phone_widget.dart';

class AcademicDetailsTabletPhonePage extends StatefulWidget {
  late final CurriculumDeliveryViewController curriculumDeliveryViewController;

  AcademicDetailsTabletPhonePage({
    Key? key,
    required this.curriculumDeliveryViewController,
  }) : super(key: key);

  @override
  State<AcademicDetailsTabletPhonePage> createState() => _AcademicDetailsTabletPhonePageState();
}

class _AcademicDetailsTabletPhonePageState extends State<AcademicDetailsTabletPhonePage> {
  late AcademicDetailsTabletPhoneController controller;

  @override
  void initState() {
    controller = Get.put(AcademicDetailsTabletPhoneController(widget.curriculumDeliveryViewController), tag: "academic-details-tablet-phone-controller");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TitleWithBackButtonTabletPhoneWidget(
                      title: "Aulas",
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(
                              top: PlatformType.isTablet(context) ? 9.h : 7.h,
                              bottom: 3.h,
                            ),
                            padding: EdgeInsets.fromLTRB(5.w, 4.h, 5.w, 3.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1.h),
                              color: AppColors.purpleDefaultColor,
                            ),
                            child: Center(
                              child: TextWidget(
                                controller.curriculumDeliveryViewController.title,
                                textColor: AppColors.whiteColor,
                                fontSize: 18.sp,
                                textAlign: TextAlign.center,
                                maxLines: 3,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          controller.curriculumDeliveryViewController.classes != null ?
                          Expanded(
                            child: Visibility(
                              visible: controller.curriculumDeliveryViewController.classes!.isNotEmpty,
                              replacement: Center(
                                child: TextWidget(
                                  "Nenhuma aula registrada",
                                  textColor: AppColors.blackColor91Percent,
                                  fontSize: 18.sp,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              child: ListView.builder(
                                itemCount: controller.curriculumDeliveryViewController.classes!.length,
                                itemBuilder: (context, index){
                                  return ClassesCardTabletPhoneWidget(
                                    classes: controller.curriculumDeliveryViewController.classes![index],
                                  );
                                },
                              ),
                            ),
                          ) :
                          Container(),
                        ],
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
                    color: AppColors.purpleDefaultColor,
                  ),
                  child: Image.asset(
                    Paths.Icone_Exibicao_Aulas,
                    height: 5.h,
                    width: 5.h,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
