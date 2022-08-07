import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../base/models/classes.dart';
import '../../../../../utils/paths.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../shared/widgets/information_container_tablet_phone_widget.dart';
import '../../shared/widgets/title_with_back_button_tablet_phone_widget.dart';
import '../controller/academic_details_tablet_phone_controller.dart';
import '../widgets/class_content_card_tablet_phone_widget.dart';

class ClassContentTabletPhonePage extends StatefulWidget {
  final Classes classes;
  ClassContentTabletPhonePage({
    Key? key,
    required this.classes,
  }) : super(key: key);

  @override
  State<ClassContentTabletPhonePage> createState() => _ClassContentTabletPhonePageState();
}

class _ClassContentTabletPhonePageState extends State<ClassContentTabletPhonePage> {
  late AcademicDetailsTabletPhoneController controller;

  @override
  void initState() {
    controller = Get.find(tag: "academic-details-tablet-phone-controller");
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.h),
                        child: TitleWithBackButtonTabletPhoneWidget(
                          title: "Detalhes da aula",
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InformationContainerTabletPhoneWidget(
                              iconPath: Paths.Icone_Exibicao_Detalhes_da_Aula,
                              textColor: AppColors.whiteColor,
                              backgroundColor: AppColors.purpleDefaultColor,
                              informationText: "",
                              customContainer: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: TextWidget(
                                      "${widget.classes.className} - ${widget.classes.classSubject}",
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
                                    controller.curriculumDeliveryViewController.title,
                                    textColor: AppColors.whiteColor,
                                    fontSize: 18.sp,
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      "Descrição da Aula:",
                                      textColor: AppColors.blackColor,
                                      fontSize: 18.sp,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: .5.h, bottom: 3.h),
                                      child: Visibility(
                                        visible: widget.classes.classDescription != null,
                                        replacement: TextWidget(
                                          "Sem descrição",
                                          textColor: AppColors.blackColor,
                                          fontSize: 18.sp,
                                          textAlign: TextAlign.start,
                                        ),
                                        child: TextWidget(
                                          widget.classes.classDescription ?? "",
                                          textColor: AppColors.blackColor,
                                          fontSize: 18.sp,
                                          textAlign: TextAlign.start,
                                          maxLines: 5,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: .5.h),
                                      child: TextWidget(
                                        "Material da Aula:",
                                        textColor: AppColors.blackColor,
                                        fontSize: 18.sp,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Expanded(
                                      child: Visibility(
                                        visible: widget.classes.files.isNotEmpty,
                                        replacement: Center(
                                          child: TextWidget(
                                            "Nenhum material encontrado",
                                            textColor: AppColors.blackColor91Percent,
                                            fontSize: 18.sp,
                                            textAlign: TextAlign.center,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        child: ListView.builder(
                                          itemCount: widget.classes.files.length,
                                          itemBuilder: (context, index){
                                            return ClassContentCardTabletPhoneWidget(
                                              files: widget.classes.files[index],
                                            );
                                          },
                                        ),
                                      ),
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
