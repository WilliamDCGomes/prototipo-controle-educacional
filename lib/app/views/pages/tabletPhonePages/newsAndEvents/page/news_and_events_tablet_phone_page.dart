import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../helpers/date_format_to_brazil.dart';
import '../../../../../helpers/paths.dart';
import '../../../../../helpers/platform_type.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/text_field_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../shared/widgets/title_with_back_button_widget.dart';
import '../controller/news_and_events_controller.dart';
import '../widget/news_and_events_card_widget.dart';

class NewsAndEventsTabletPhonePage extends StatefulWidget {
  const NewsAndEventsTabletPhonePage({Key? key}) : super(key: key);

  @override
  State<NewsAndEventsTabletPhonePage> createState() => _NewsAndEventsTabletPhonePageState();
}

class _NewsAndEventsTabletPhonePageState extends State<NewsAndEventsTabletPhonePage> {
  late NewsAndEventsController controller;

  @override
  void initState() {
    controller = Get.put(NewsAndEventsController());
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
                        title: "Notícias e Eventos",
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(
                                top: PlatformType.isTablet(context) ? 9.h : 7.h,
                                bottom: 3.h,
                              ),
                              padding: EdgeInsets.symmetric(vertical: 3.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.h),
                                color: AppColors.purpleDefaultColor,
                              ),
                              child: TextWidget(
                                "Últimas Notícias e Eventos do mês de ${DateFormatToBrazil.mounth(DateTime.now())}",
                                textColor: AppColors.whiteColor,
                                fontSize: 18.sp,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextFieldWidget(
                              controller: controller.searchNewsAndEventsController,
                              hintText: "Pesquisar Notícias e Eventos",
                              height: 6.h,
                              width: double.infinity,
                              iconTextField: Icon(
                                Icons.search,
                                color: AppColors.purpleDefaultColor,
                                size: 3.h,
                              ),
                              keyboardType: TextInputType.name,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 1.h,
                                ),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    itemCount: controller.newsAndEventsList.length,
                                    itemBuilder: (context, index){
                                      return NewsAndEventsCardWidget(
                                        newsAndEventsViewController: controller.newsAndEventsList[index],
                                      );
                                    },
                                  ),
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
