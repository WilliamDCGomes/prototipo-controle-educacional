import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../widgetsShared/text_button_widget.dart';
import '../../shared/widgets/title_with_back_button_tablet_phone_widget.dart';
import '../controller/grades_faults_tablet_phone_controller.dart';
import '../../../../../utils/paths.dart';
import '../../../../stylePages/app_colors.dart';

class GradesFaultsTabletPhonePage extends StatefulWidget {
  const GradesFaultsTabletPhonePage({Key? key}) : super(key: key);

  @override
  State<GradesFaultsTabletPhonePage> createState() => _GradesFaultsTabletPhonePageState();
}

class _GradesFaultsTabletPhonePageState extends State<GradesFaultsTabletPhonePage> {
  late GradesFaultsTabletPhoneController controller;

  @override
  void initState() {
    controller = Get.put(GradesFaultsTabletPhoneController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
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
                  padding: EdgeInsets.only(top: 2.h,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 8.h,
                        margin: EdgeInsets.symmetric(horizontal: 2.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TitleWithBackButtonTabletPhoneWidget(
                                title: "Notas e Faltas",
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
                        child: Center(
                          child: Obx(
                            () => CarouselSlider.builder(
                              carouselController: controller.academicRecordCarouselController,
                              itemCount: controller.cardAcademicRecordList.length,
                              options: CarouselOptions(
                                viewportFraction: 1,
                                height: double.infinity,
                                enlargeStrategy: CenterPageEnlargeStrategy.height,
                                enlargeCenterPage: true,
                                enableInfiniteScroll: false,
                              ),
                              itemBuilder: (context, itemIndex, pageViewIndex) {
                                return controller.cardAcademicRecordList[itemIndex];
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                controller.loadingWithSuccessOrErrorTabletPhoneWidget,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
