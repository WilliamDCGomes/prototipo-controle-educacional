import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../base/viewController/curriculum_delivery_view_controller.dart';
import '../../../../../helpers/paths.dart';
import '../../../../../helpers/platform_type.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../shared/widgets/title_with_back_button_widget.dart';
import '../controller/academic_details_controller.dart';
import '../widgets/classes_card_widget.dart';

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
  late AcademicDetailsController controller;

  @override
  void initState() {
    controller = Get.put(AcademicDetailsController(widget.curriculumDeliveryViewController), tag: "academic-details-controller");
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 8.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          child: TitleWithBackButtonWidget(
                            title: "Aulas",
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.h,),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 95.w,
                                margin: EdgeInsets.only(
                                  top: PlatformType.isTablet(context) ? 9.h : 7.h,
                                  bottom: 5.h,
                                ),
                                padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
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
                                      return ClassesCardWidget(
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
