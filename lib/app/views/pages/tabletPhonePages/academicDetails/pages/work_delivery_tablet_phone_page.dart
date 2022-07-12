import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../base/viewController/curriculum_delivery_view_controller.dart';
import '../../../../../helpers/paths.dart';
import '../../../../../helpers/platform_type.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/button_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../shared/widgets/card_upload_files_widget.dart';
import '../../shared/widgets/title_with_back_button_widget.dart';
import '../controller/work_delivery_controller.dart';
import '../widgets/class_content_card_widget.dart';

class WorkDeliveryTabletPhonePage extends StatefulWidget {
  late final CurriculumDeliveryViewController curriculumDeliveryViewController;

  WorkDeliveryTabletPhonePage({
    Key? key,
    required this.curriculumDeliveryViewController,
  }) : super(key: key);

  @override
  State<WorkDeliveryTabletPhonePage> createState() => _WorkDeliveryTabletPhonePageState();
}

class _WorkDeliveryTabletPhonePageState extends State<WorkDeliveryTabletPhonePage> {
  late WorkDeliveryController controller;

  @override
  void initState() {
    controller = Get.put(WorkDeliveryController(widget.curriculumDeliveryViewController));
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
                      TitleWithBackButtonWidget(
                        title: "Entrega de trabalho",
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(
                                top: PlatformType.isTablet(context) ? 9.h : 7.h,
                                bottom: 5.h,
                              ),
                              padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.h),
                                color: AppColors.purpleDefaultColor,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: TextWidget(
                                      controller.curriculumDeliveryViewController.title,
                                      textColor: AppColors.whiteColor,
                                      fontSize: 18.sp,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 1.5.h),
                                    child: TextWidget(
                                      controller.curriculumDeliveryViewController.getFullDate,
                                      textColor: AppColors.whiteColor,
                                      fontSize: 18.sp,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  TextWidget(
                                    controller.curriculumDeliveryViewController.disciplineName,
                                    textColor: AppColors.whiteColor,
                                    fontSize: 18.sp,
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        "Descrição da Entrega:",
                                        textColor: AppColors.blackColor,
                                        fontSize: 18.sp,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: .5.h, bottom: 2.h),
                                        child: TextWidget(
                                          controller.curriculumDeliveryViewController.workDescription ?? "Sem descrição",
                                          textColor: AppColors.blackColor,
                                          fontSize: 16.sp,
                                          textAlign: TextAlign.start,
                                          maxLines: 5,
                                        ),
                                      ),
                                      TextWidget(
                                        "Material de aula:",
                                        textColor: AppColors.blackColor,
                                        fontSize: 18.sp,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      Container(
                                        height: 10.h,
                                        child: controller.curriculumDeliveryViewController.workContent != null && controller.curriculumDeliveryViewController.workContent!.isNotEmpty ?
                                        ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: controller.curriculumDeliveryViewController.workContent!.length,
                                          itemBuilder: (context, index){
                                            return SizedBox(
                                              width: controller.curriculumDeliveryViewController.workContent!.length > 1 ? 75.w : 100.w - 6.h,
                                              child: ClassContentCardWidget(
                                                files: controller.curriculumDeliveryViewController.workContent![index],
                                              ),
                                            );
                                          },
                                        ) :
                                        Center(
                                          child: TextWidget(
                                            "Nenhum material encontrado",
                                            textColor: AppColors.blackColor91Percent,
                                            fontSize: 18.sp,
                                            textAlign: TextAlign.center,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      CardUploadFilesWidget(
                                        cardMargin: EdgeInsets.symmetric(vertical: 2.h),
                                      ),
                                      SizedBox(
                                        height: controller.curriculumDeliveryViewController.workDelivery != null && controller.curriculumDeliveryViewController.workDelivery!.isNotEmpty ?
                                          controller.curriculumDeliveryViewController.workDelivery!.length * 9.h : 10.h,
                                        child: controller.curriculumDeliveryViewController.workDelivery != null && controller.curriculumDeliveryViewController.workDelivery!.isNotEmpty ?
                                        ListView.builder(
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemCount: controller.curriculumDeliveryViewController.workDelivery!.length,
                                          itemBuilder: (context, index){
                                            return ClassContentCardWidget(
                                              files: controller.curriculumDeliveryViewController.workDelivery![index],
                                            );
                                          },
                                        ) :
                                        Center(
                                          child: TextWidget(
                                            "Nenhum arquivo adicionado",
                                            textColor: AppColors.blackColor91Percent,
                                            fontSize: 18.sp,
                                            textAlign: TextAlign.center,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.h),
                              child: Obx(
                                () => ButtonWidget(
                                  hintText: controller.buttonText.value,
                                  fontWeight: FontWeight.bold,
                                  widthButton: 100.w,
                                  backgroundColor: controller.getButtonColor(),
                                  borderColor: controller.getButtonColor(),
                                  onPressed: () => controller.deliveryWork(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                controller.loadingWithSuccessOrErrorWidget,
              ],
            ),
          ),
        ),
      ),
    );
  }
}