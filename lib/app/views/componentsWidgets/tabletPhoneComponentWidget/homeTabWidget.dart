import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';
import 'package:projeto_tcc/app/enums/enums.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controllers/mainMenuTabletPhoneController.dart';
import '../../../helpers/paths.dart';
import '../../../helpers/platformType.dart';
import '../../stylePages/appColors.dart';
import '../menuOptionsWidget.dart';
import '../textButtonWidget.dart';
import '../textWidget.dart';

class HomeTabWidget extends StatefulWidget {
  late final MainMenuTabletPhoneController controller;
  HomeTabWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<HomeTabWidget> createState() => _HomeTabWidgetState();
}

class _HomeTabWidgetState extends State<HomeTabWidget> {
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButtonWidget(
                            onTap: () => widget.controller.openProfile(),
                            borderRadius: 2.h,
                            widgetCustom: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 3.w),
                                  child: Container(
                                    height: 7.h,
                                    width: 7.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.5.h),
                                      color: AppColors().grayColor,
                                    ),
                                    child: Obx(
                                          () => widget.controller.hasPicture.value ?
                                      Image.asset(
                                          ""
                                      ) :
                                      Center(
                                        child: TextWidget(
                                          widget.controller.nameInitials,
                                          textColor: AppColors().standardColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.sp,
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      "Olá, William",
                                      textColor: AppColors().blackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp,
                                      textAlign: TextAlign.start,
                                    ),
                                    Obx(() => TextWidget(
                                      widget.controller.welcomePhrase.value,
                                      textColor: AppColors().blackColor,
                                      fontSize: 17.sp,
                                      textAlign: TextAlign.start,
                                    ),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SvgPicture.asset(
                            '${Paths().svgsPath}Logo_Pce_Home.svg',
                            width: 15.w,
                          ),
                        ],
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
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 1.h),
                                      child: CarouselSlider.builder(
                                        carouselController: widget.controller.carouselController,
                                        itemCount: 3,
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
                                          return widget.controller.cardMainMenuList.elementAt(itemIndex);
                                        },
                                      ),
                                    ),
                                    DotStepper(
                                      dotCount: 3,
                                      dotRadius: 1.h,
                                      activeStep: widget.controller.activeStep,
                                      shape: Shape.stadium,
                                      spacing: 3.w,
                                      indicator: Indicator.magnify,
                                      fixedDotDecoration: FixedDotDecoration(
                                        color: AppColors().grayStepColor,
                                      ),
                                      indicatorDecoration: IndicatorDecoration(
                                        // style: PaintingStyle.stroke,
                                        // strokeWidth: 8,
                                        color: AppColors().purpleDefaultColor,
                                      ),
                                      onDotTapped: (tappedDotIndex) {
                                        setState(() {
                                          widget.controller.activeStep = tappedDotIndex;
                                          widget.controller.carouselController.jumpToPage(tappedDotIndex);
                                        });
                                      },
                                    ),
                                  ],
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