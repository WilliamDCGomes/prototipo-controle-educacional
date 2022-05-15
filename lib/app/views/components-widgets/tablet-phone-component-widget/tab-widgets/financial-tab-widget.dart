import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:im_stepper/stepper.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../controllers/main-menu-tablet-phone-controller.dart';
import '../../../../helpers/paths.dart';
import '../../../../helpers/platform-type.dart';
import '../../../style-pages/app-colors.dart';
import '../../button-widget.dart';
import '../../text-button-widget.dart';
import '../../text-widget.dart';
import 'card-financial-widget.dart';

class FinancialTabWidget extends StatefulWidget {
  late final MainMenuTabletPhoneController controller;
  FinancialTabWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<FinancialTabWidget> createState() => _FinancialTabWidgetState();
}

class _FinancialTabWidgetState extends State<FinancialTabWidget> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    widget.controller.tabFinancialController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_){
      setState(() {
        widget.controller.creditDebtCardActiveStep = 0;
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          "Financeiro",
                          textColor: AppColors.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                          textAlign: TextAlign.start,
                        ),
                        SvgPicture.asset(
                          Paths.Logo_Pce_Home,
                          width: 15.w,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: PlatformType.isTablet(context) ?
                            9.h : 7.h,
                          ),
                          child: Center(
                            child: Padding(
                                padding: EdgeInsets.only(bottom: 1.h),
                                child: CardFinancialWidget(
                                  statusText: "Aberta",
                                  paymentDay: "05/06/2022",
                                  plotValue: "R\$ 743,99",
                                  hasCardRegistered: true,
                                  mainMenuTabletPhoneController: widget.controller,
                                )
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 2.w,
                            vertical: 1.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextWidget(
                                "Cartão Cadastrado",
                                textColor: AppColors.blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.sp,
                                textAlign: TextAlign.start,
                              ),
                              TextButtonWidget(
                                onTap: () {

                                },
                                hintText: "Ver Todos",
                                fontWeight: FontWeight.normal,
                                textDecoration: TextDecoration.underline,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 1.h),
                          child: SizedBox(
                            height: widget.controller.creditDebtCardWidgetHeight,
                            child: CarouselSlider.builder(
                              carouselController: widget.controller.carouselCreditDebtCardController,
                              itemCount: widget.controller.creditDebtCardList.length,
                              options: CarouselOptions(
                                  viewportFraction: .85,
                                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                                  enlargeCenterPage: true,
                                  enableInfiniteScroll: false,
                                  onPageChanged: (itemIndex, reason){
                                    setState(() {
                                      widget.controller.creditDebtCardActiveStep = itemIndex;
                                    });
                                  }
                              ),
                              itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                                return widget.controller.creditDebtCardList.elementAt(itemIndex);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 2.h),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButtonWidget(
                                onTap: () {

                                },
                                componentPadding: EdgeInsets.zero,
                                widgetCustom: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                                      child: TextWidget(
                                        "Cartão de Crédito William Douglas",
                                        textColor: AppColors.blackColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.sp,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      Paths.Icone_Editar,
                                      height: 2.h,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: widget.controller.creditDebtCardList.length > 1,
                          child: Center(
                            child: DotStepper(
                              dotCount: widget.controller.creditDebtCardList.length,
                              dotRadius: 1.h,
                              activeStep: widget.controller.creditDebtCardActiveStep,
                              shape: Shape.stadium,
                              spacing: 3.w,
                              indicator: Indicator.magnify,
                              fixedDotDecoration: FixedDotDecoration(
                                color: AppColors.grayStepColor,
                              ),
                              indicatorDecoration: IndicatorDecoration(
                                color: AppColors.purpleDefaultColor,
                              ),
                              onDotTapped: (tappedDotIndex) {
                                setState(() {
                                  widget.controller.creditDebtCardActiveStep = tappedDotIndex;
                                  widget.controller.carouselCreditDebtCardController.jumpToPage(tappedDotIndex);
                                });
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.w, 2.h, 20.w, 0),
                          child: ButtonWidget(
                            hintText: "Adicionar Cartão",
                            fontWeight: FontWeight.bold,
                            heightButton: 5.h,
                            onPressed: () {

                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(2.w, 2.h, 2.w, 1.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextWidget(
                                "Últimos Pagamentos",
                                textColor: AppColors.blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.sp,
                                textAlign: TextAlign.start,
                              ),
                              TextButtonWidget(
                                onTap: () {

                                },
                                hintText: "Ver Todos",
                                fontWeight: FontWeight.normal,
                                textDecoration: TextDecoration.underline,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: widget.controller.cardPaymentList,
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
    );
  }
}
