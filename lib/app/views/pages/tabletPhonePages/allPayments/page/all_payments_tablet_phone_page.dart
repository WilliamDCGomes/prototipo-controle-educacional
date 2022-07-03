import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/enums/enums.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../helpers/date_format_to_brazil.dart';
import '../../../../../helpers/paths.dart';
import '../../../../../helpers/platform_type.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/text_button_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../shared/widgets/title_with_back_button_widget.dart';
import '../controller/all_payments_controller.dart';
import '../widget/card_all_bills_detail_widget.dart';

class AllPaymentsTabletPhonePage extends StatefulWidget {
  const AllPaymentsTabletPhonePage({Key? key}) : super(key: key);

  @override
  State<AllPaymentsTabletPhonePage> createState() => _AllPaymentsTabletPhonePageState();
}

class _AllPaymentsTabletPhonePageState extends State<AllPaymentsTabletPhonePage> {
  late AllPaymentsController controller;

  @override
  void initState() {
    controller = Get.put(AllPaymentsController());
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TitleWithBackButtonWidget(
                                  title: "Todos os Boletos/Lançamentos",
                                ),
                              ),
                              TextButtonWidget(
                                onTap: (){

                                },
                                height: 6.5.w,
                                width: 7.w,
                                componentPadding: EdgeInsets.all(.5.w),
                                widgetCustom: SvgPicture.asset(
                                  Paths.Icone_Filtro,
                                  height: 6.5.w,
                                  width: 6.5.w,
                                  color: AppColors.purpleDefaultColor,
                                  alignment: Alignment.centerRight,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              width: 95.w,
                              margin: EdgeInsets.only(
                                top: PlatformType.isTablet(context) ? 9.h : 7.h,
                                bottom: 3.h,
                              ),
                              padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.h),
                                color: AppColors.purpleDefaultColor,
                              ),
                              child: TextWidget(
                                "Boletos e Lançamentos\ndo ${DateFormatToBrazil.semesterInformation(DateTime.now())}",
                                textColor: AppColors.whiteColor,
                                fontSize: 18.sp,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Obx(
                              () => Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 28.w,
                                    child: Card(
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(1.h),
                                      ),
                                      color: controller.statusOpen.value ? AppColors.whiteColor : AppColors.grayCardBillFilter,
                                      child: InkWell(
                                        onTap: () => controller.setTagFilter(billStatus.open),
                                        borderRadius: BorderRadius.circular(1.h),
                                        child: Padding(
                                          padding: EdgeInsets.all(1.h),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 2.3.h,
                                                    width: .5.h,
                                                    color: AppColors.blueMoneyFinancialCardColor,
                                                  ),
                                                  TextWidget(
                                                    " Abertas",
                                                    textColor: AppColors.arrowBlackColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.sp,
                                                    textAlign: TextAlign.start,
                                                    maxLines: 1,
                                                  ),
                                                ],
                                              ),
                                              SvgPicture.asset(
                                                controller.statusOpen.value ? Paths.Icone_Abertas_Selecionado : Paths.Icone_Abertas_Apagada,
                                                height: 2.h,
                                                alignment: Alignment.bottomRight,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 28.w,
                                    child: Card(
                                      elevation: 3,
                                      color: controller.statusLate.value ? AppColors.whiteColor : AppColors.grayCardBillFilter,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(1.h),
                                      ),
                                      child: InkWell(
                                        onTap: () => controller.setTagFilter(billStatus.late),
                                        borderRadius: BorderRadius.circular(1.h),
                                        child: Padding(
                                          padding:  EdgeInsets.all(1.h),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 2.3.h,
                                                    width: .5.h,
                                                    color: AppColors.redColor,
                                                  ),
                                                  TextWidget(
                                                    " Atrasadas",
                                                    textColor: AppColors.arrowBlackColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.sp,
                                                    textAlign: TextAlign.start,
                                                    maxLines: 1,
                                                  ),
                                                ],
                                              ),
                                              Align(
                                                alignment: Alignment.bottomRight,
                                                child: Icon(
                                                  Icons.calendar_month,
                                                  size: 2.5.h,
                                                  color: controller.statusLate.value ? AppColors.redColor : AppColors.lightRedColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 28.w,
                                    child: Card(
                                      elevation: 3,
                                      color: controller.statusClose.value ? AppColors.whiteColor : AppColors.grayCardBillFilter,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(1.h),
                                      ),
                                      child: InkWell(
                                        onTap: () => controller.setTagFilter(billStatus.close),
                                        borderRadius: BorderRadius.circular(1.h),
                                        child: Padding(
                                          padding: EdgeInsets.all(1.h),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 2.3.h,
                                                    width: .5.h,
                                                    color: AppColors.greenTagFilterColor,
                                                  ),
                                                  TextWidget(
                                                    " Pagas",
                                                    textColor: AppColors.arrowBlackColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.sp,
                                                    textAlign: TextAlign.start,
                                                    maxLines: 1,
                                                  ),
                                                ],
                                              ),
                                              SvgPicture.asset(
                                                controller.statusClose.value ? Paths.Icone_Pagas_Selecionado : Paths.Icone_Pagas_Apagado,
                                                height: 2.h,
                                                alignment: Alignment.bottomRight,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(top: 2.h),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller.cardPaymentList.length,
                                  itemBuilder: (context, index){
                                    return CardAllBillsDetailWidget(
                                      cardPaymentViewController: controller.cardPaymentList[index],
                                    );
                                  },
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
