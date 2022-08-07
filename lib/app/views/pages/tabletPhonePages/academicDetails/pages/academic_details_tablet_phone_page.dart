import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../base/viewController/curriculum_delivery_view_controller.dart';
import '../../../../../utils/paths.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../shared/widgets/information_container_tablet_phone_widget.dart';
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
    return SafeArea(
      child: Material(
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
                padding: EdgeInsets.only(top: 2.h,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.h,),
                      child: TitleWithBackButtonTabletPhoneWidget(
                        title: "Aulas",
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InformationContainerTabletPhoneWidget(
                            iconPath: Paths.Icone_Exibicao_Aulas,
                            textColor: AppColors.whiteColor,
                            backgroundColor: AppColors.purpleDefaultColor,
                            informationText: controller.curriculumDeliveryViewController.title,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.h,),
                              child: Visibility(
                                visible: controller.curriculumDeliveryViewController.classes != null && controller.curriculumDeliveryViewController.classes!.isNotEmpty,
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
    );
  }
}
