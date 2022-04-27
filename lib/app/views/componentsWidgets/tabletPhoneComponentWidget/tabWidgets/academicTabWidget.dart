import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:im_stepper/stepper.dart';
import 'package:projeto_tcc/app/enums/enums.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../controllers/mainMenuTabletPhoneController.dart';
import '../../../../helpers/paths.dart';
import '../../../../helpers/platformType.dart';
import '../../../stylePages/appColors.dart';
import '../../menuOptionsWidget.dart';
import '../../textButtonWidget.dart';
import '../../textWidget.dart';

class AcademicTabWidget extends StatefulWidget {
  late final MainMenuTabletPhoneController controller;
  AcademicTabWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<AcademicTabWidget> createState() => _AcademicTabWidgetState();
}

class _AcademicTabWidgetState extends State<AcademicTabWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_){
      setState(() {
        widget.controller.activeStep = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: SvgPicture.asset(
              '${Paths().svgsPath}Ilustracao_Topo.svg',
              width: 25.w,
            ),
          ),
          Scaffold(
            backgroundColor: AppColors().transparentColor,
            body: Padding(
              padding: EdgeInsets.fromLTRB(2.h, 2.h, 2.h, 0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                              "Acadêmico",
                              textColor: AppColors().blackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              textAlign: TextAlign.start,
                            ),
                            TextButtonWidget(
                              onTap: () => widget.controller.openConfiguration(),
                              height: 6.5.w,
                              width: 7.w,
                              componentPadding: EdgeInsets.all(.5.w),
                              widgetCustom: SvgPicture.asset(
                                '${Paths().svgsPath}Icone_Filtro.svg',
                                height: 6.5.w,
                                width: 6.5.w,
                                color: AppColors().purpleDefaultColor,
                                alignment: Alignment.centerRight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 82.h ,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: PlatformType().isTablet(context) ?
                                9.h : 7.h,
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 1.h),
                                  child: CarouselSlider.builder(
                                    carouselController: widget.controller.academicRecordCarouselController,
                                    itemCount: 5,
                                    options: CarouselOptions(
                                        height: 18.h,
                                        viewportFraction: 1,
                                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                                        enlargeCenterPage: true,
                                        enableInfiniteScroll: false,
                                        onPageChanged: (itemIndex, reason){
                                          setState(() {
                                            widget.controller.activeStep = itemIndex;
                                          });
                                        }
                                    ),
                                    itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                                      return widget.controller.cardAcademicRecordList.elementAt(itemIndex);
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 1.h),
                              child: TextWidget(
                                "Ações Rápidas",
                                textColor: AppColors().blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                textAlign: TextAlign.start,
                                maxLines: 1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  MenuOptionsWidget(
                                    text: "Horário das Aulas",
                                    imagePath: "Icone_Horario_Das_Aulas.svg",
                                    textColor: AppColors().blackColor,
                                    onTap: () => widget.controller.quickActionsClicked(quickActionsOptions.classTime),
                                  ),
                                  MenuOptionsWidget(
                                    text: "Notas e Faltas",
                                    imagePath: "Icone_Notas_e_Faltas.svg",
                                    textColor: AppColors().blackColor,
                                    onTap: () => widget.controller.quickActionsClicked(quickActionsOptions.gradesFaults),
                                  ),
                                  MenuOptionsWidget(
                                    text: "Calendário Acadêmico",
                                    imagePath: "Icone_Calendario_Academico.svg",
                                    textColor: AppColors().blackColor,
                                    onTap: () => widget.controller.quickActionsClicked(quickActionsOptions.academicCalendar),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 1.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  MenuOptionsWidget(
                                    text: "Carteirinha Online",
                                    imagePath: "Icone_Carterinha_Estudante.svg",
                                    textColor: AppColors().blackColor,
                                    onTap: () => widget.controller.quickActionsClicked(quickActionsOptions.onlineStudentCard),
                                  ),
                                  MenuOptionsWidget(
                                    text: "Histórico Acadêmico",
                                    imagePath: "Icone_Historico_Academico.svg",
                                    textColor: AppColors().blackColor,
                                    onTap: () => widget.controller.quickActionsClicked(quickActionsOptions.academicRecord),
                                  ),
                                  MenuOptionsWidget(
                                    text: "Notícias e Eventos",
                                    imagePath: "Icone_Noticias_e_Eventos.svg",
                                    textColor: AppColors().blackColor,
                                    onTap: () => widget.controller.quickActionsClicked(quickActionsOptions.newsEvents),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 1.h),
                              child: TextWidget(
                                "Solicitações",
                                textColor: AppColors().blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                textAlign: TextAlign.start,
                                maxLines: 1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 1.h, bottom: 9.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  MenuOptionsWidget(
                                    text: "Carteirinha de Estudante",
                                    imagePath: "Icone_Carterinha_Estudante.svg",
                                    textColor: AppColors().blackColor,
                                    onTap: () => widget.controller.quickActionsClicked(quickActionsOptions.studentCard),
                                  ),
                                  MenuOptionsWidget(
                                    text: "Declaração Escolar",
                                    imagePath: "Icone_Declaracao_Escolar.svg",
                                    textColor: AppColors().blackColor,
                                    onTap: () => widget.controller.quickActionsClicked(quickActionsOptions.schoolStatement),
                                  ),
                                  SizedBox(width: PlatformType().isAndroid() ? 13.h : 14.h,),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}