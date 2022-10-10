import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../utils/date_format_to_brazil.dart';
import '../../../../../utils/paths.dart';
import '../../../../../utils/platform_type.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/text_field_widget.dart';
import '../../shared/widgets/information_container_tablet_phone_widget.dart';
import '../../shared/widgets/title_with_back_button_tablet_phone_widget.dart';
import '../controller/news_and_events_tablet_phone_controller.dart';
import '../widget/news_and_events_card_tablet_phone_widget.dart';

class NewsAndEventsTabletPhonePage extends StatefulWidget {
  const NewsAndEventsTabletPhonePage({Key? key}) : super(key: key);

  @override
  State<NewsAndEventsTabletPhonePage> createState() => _NewsAndEventsTabletPhonePageState();
}

class _NewsAndEventsTabletPhonePageState extends State<NewsAndEventsTabletPhonePage> {
  late NewsAndEventsTabletPhoneController controller;

  @override
  void initState() {
    controller = Get.put(NewsAndEventsTabletPhoneController());

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller.getDataSource();
      setState(() {
        controller.newsAndEventsOnScreen;
      });
    });
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
                          title: "Notícias e Eventos",
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InformationContainerTabletPhoneWidget(
                              iconPath: Paths.Icone_Exibicao_Noticias_e_Eventos,
                              textColor: AppColors.whiteColor,
                              backgroundColor: AppColors.purpleDefaultColor,
                              informationText: "Últimas Notícias e Eventos do mês de ${DateFormatToBrazil.mounth(DateTime.now())}",
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.h,),
                              child: TextFieldWidget(
                                controller: controller.searchNewsAndEventsController,
                                hintText: "Pesquisar Notícias e Eventos",
                                height: PlatformType.isTablet(context) ? 7.h : 9.h,
                                width: double.infinity,
                                iconTextField: Icon(
                                  Icons.search,
                                  color: AppColors.purpleDefaultColor,
                                  size: 3.h,
                                ),
                                keyboardType: TextInputType.name,
                                onChanged: (value) {
                                  controller.searchNewsAndEvents(value);
                                  setState(() {
                                    controller.newsAndEventsOnScreen;
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 2.h,
                                  top: 1.h,
                                  right: 2.h,
                                ),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    itemCount: controller.newsAndEventsOnScreen.length,
                                    itemBuilder: (context, index){
                                      return NewsAndEventsCardTabletPhoneWidget(
                                        newsAndEvents: controller.newsAndEventsOnScreen[index],
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
                controller.loadingWithSuccessOrErrorTabletPhoneWidget,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
