import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../utils/paths.dart';
import '../../../../../utils/platform_type.dart';
import '../../../../stylePages/app_colors.dart';
import '../../shared/widgets/information_container_tablet_phone_widget.dart';

class HeaderRegisterStepperTabletPhoneWidget extends StatelessWidget {
  final String firstText;
  final String secondText;
  final String thirdText;

  const HeaderRegisterStepperTabletPhoneWidget(
      { Key? key,
        required this.firstText,
        required this.secondText,
        required this.thirdText,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InformationContainerTabletPhoneWidget(
      iconPath: Paths.Icone_Exibicao_Cadastro_Usuario,
      textColor: AppColors.whiteColor,
      backgroundColor: AppColors.purpleDefaultColor,
      informationText: "",
      marginContainer: EdgeInsets.only(
        left: 2.h,
        top: PlatformType.isTablet(context) ? 7.h : 5.h,
        right: 2.h,
        bottom: 2.h,
      ),
      marginIcon: EdgeInsets.only(
        right: 1.w,
      ),
      customContainer: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextWidget(
            firstText,
            textColor: AppColors.whiteColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.start,
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: TextWidget(
              secondText,
              textColor: AppColors.whiteColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: TextWidget(
              thirdText,
              textColor: AppColors.whiteColor,
              fontSize: 15.sp,
              textAlign: TextAlign.start,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}