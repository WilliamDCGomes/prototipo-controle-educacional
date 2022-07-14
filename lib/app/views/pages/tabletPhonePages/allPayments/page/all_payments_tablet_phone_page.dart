import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../helpers/date_format_to_brazil.dart';
import '../../../../../helpers/paths.dart';
import '../../../../../helpers/platform_type.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/text_button_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../shared/widgets/title_with_back_button_tablet_phone_widget.dart';
import '../controller/all_payments_tablet_phone_controller.dart';
import '../widgets/card_all_bills_detail_tablet_phone_widget.dart';

class AllPaymentsTabletPhonePage extends StatefulWidget {
  const AllPaymentsTabletPhonePage({Key? key}) : super(key: key);

  @override
  State<AllPaymentsTabletPhonePage> createState() => _AllPaymentsTabletPhonePageState();
}

class _AllPaymentsTabletPhonePageState extends State<AllPaymentsTabletPhonePage> {
  late AllPaymentsTabletPhoneController controller;

  @override
  void initState() {
    controller = Get.put(AllPaymentsTabletPhoneController());
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TitleWithBackButtonTabletPhoneWidget(
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
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
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
                            SizedBox(
                              width: 95.w,
                              child: Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                children: controller.tagsFilterList,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(top: 2.h),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller.cardPaymentList.length,
                                  itemBuilder: (context, index){
                                    return CardAllBillsDetailTabletPhoneWidget(
                                      cardPaymentViewTabletPhoneController: controller.cardPaymentList[index],
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
