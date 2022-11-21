import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../shared/widgets/title_with_back_button_tablet_phone_widget.dart';
import '../../../../../utils/paths.dart';
import '../../../../stylePages/app_colors.dart';
import '../controller/academic_record_tablet_phone_controller.dart';

class AcademicRecordTabletPhonePage extends StatefulWidget {
  const AcademicRecordTabletPhonePage({Key? key}) : super(key: key);

  @override
  State<AcademicRecordTabletPhonePage> createState() => _AcademicRecordTabletPhonePageState();
}

class _AcademicRecordTabletPhonePageState extends State<AcademicRecordTabletPhonePage> {
  late AcademicRecordTabletPhoneController controller;

  @override
  void initState() {
    controller = Get.put(AcademicRecordTabletPhoneController());
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
                        margin: EdgeInsets.symmetric(horizontal: 2.h),
                        child: TitleWithBackButtonTabletPhoneWidget(
                          title: "Histórico Acadêmico",
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Obx(
                            () => controller.cardAcademicRecordTabletPhoneWidget.value,
                          ),
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