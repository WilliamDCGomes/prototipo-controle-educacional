import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../helpers/date_format_to_brazil.dart';
import '../../../../../helpers/paths.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/text_button_widget.dart';
import '../../shared/widgets/information_container_tablet_phone_widget.dart';
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
                        margin: EdgeInsets.symmetric(horizontal: 2.h,),
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
                            InformationContainerTabletPhoneWidget(
                              iconPath: Paths.Icone_Exibicao_Todos_os_Boletos_e_Lancamentos,
                              textColor: AppColors.whiteColor,
                              backgroundColor: AppColors.purpleDefaultColor,
                              informationText: "Boletos e Lançamentos\ndo ${DateFormatToBrazil.semesterInformation(DateTime.now())}",
                            ),
                            Container(
                              width: 95.w,
                              margin: EdgeInsets.symmetric(horizontal: 2.h,),
                              child: Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                children: controller.tagsFilterList,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(top: 2.h),
                                margin: EdgeInsets.symmetric(horizontal: 2.h,),
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
