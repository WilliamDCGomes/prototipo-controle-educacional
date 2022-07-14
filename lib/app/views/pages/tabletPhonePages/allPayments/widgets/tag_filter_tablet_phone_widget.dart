import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/text_widget.dart';

class TagFilterTabletPhoneWidget extends StatelessWidget {
  final String? selectedSvgPath;
  final String? unselectedSvgPath;
  final Widget? icon;
  final Color cardColor;
  final String cardStatus;
  final RxBool selected;

  const TagFilterTabletPhoneWidget(
      { Key? key,
        this.icon,
        this.selectedSvgPath,
        this.unselectedSvgPath,
        required this.selected,
        required this.cardColor,
        required this.cardStatus,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 8.5.h,
        width: 28.w,
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1.h),
          ),
          color: selected.value ? AppColors.whiteColor : AppColors.grayCardBillFilter,
          child: InkWell(
            onTap: (){
              selected.value = !selected.value;
            },
            borderRadius: BorderRadius.circular(1.h),
            child: Padding(
              padding: EdgeInsets.all(1.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 2.3.h,
                        width: .5.h,
                        color: cardColor,
                      ),
                      TextWidget(
                        " $cardStatus",
                        textColor: AppColors.arrowBlackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  selectedSvgPath != null && unselectedSvgPath != null ? SvgPicture.asset(
                    selected.value ? selectedSvgPath! : unselectedSvgPath!,
                    height: 2.h,
                    alignment: Alignment.bottomRight,
                  ) : icon ?? Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}