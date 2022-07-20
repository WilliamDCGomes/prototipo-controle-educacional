import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../helpers/paths.dart';
import '../../../../../helpers/platform_type.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/button_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../cardRegistration/page/card_registration_tablet_phone_page.dart';
import '../../shared/widgets/payment_card_select_tablet_phone_widget.dart';
import '../../shared/widgets/title_with_back_button_tablet_phone_widget.dart';
import '../controller/card_payment_tablet_phone_controller.dart';

class CardPaymentTabletPhonePage extends StatefulWidget {
  CardPaymentTabletPhonePage({Key? key,}) : super(key: key);

  @override
  State<CardPaymentTabletPhonePage> createState() => _CardPaymentTabletPhonePageState();
}

class _CardPaymentTabletPhonePageState extends State<CardPaymentTabletPhonePage> {
  late CardPaymentTabletPhoneController controller;

  @override
  void initState() {
    controller = Get.put(CardPaymentTabletPhoneController());
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      setState(() {
        controller.creditDebtCardActiveStep.value = 0;
      });
    });
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
                      title: "Cartões",
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
                            padding: EdgeInsets.fromLTRB(5.w, 4.h, 5.w, 3.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1.h),
                              color: AppColors.purpleDefaultColor,
                            ),
                            child: Center(
                              child: TextWidget(
                                "Cartões cadastrados na plataforma para pagamentos",
                                textColor: AppColors.whiteColor,
                                fontSize: 18.sp,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 2.h),
                                    child: PaymentCardSelectTabletPhoneWidget(
                                      titleCards: "",
                                      showTitleCard: false,
                                      showRemoveBottom: true,
                                      showEditBottom: true,
                                      creditDebtCardWidgetHeight: 25.h,
                                      creditDebtCardActiveStep: controller.creditDebtCardActiveStep,
                                      creditDebtCardList: controller.creditDebtCardList,
                                      carouselCreditDebtCardController: controller.carouselCreditDebtCardController,
                                      onClicked: () => Get.to(() => CardRegistrationTabletPhonePage(editCard: true,)),
                                      onRemoveClicked: (){

                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 5.h),
                                  child: ButtonWidget(
                                    hintText: "ADICIONAR",
                                    fontWeight: FontWeight.bold,
                                    widthButton: 75.w,
                                    onPressed: () => Get.to(() => CardRegistrationTabletPhonePage()),
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
                    Paths.Icone_Exibicao_Cartoes_Cadastrados,
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