import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../utils/logged_user.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/text_widget.dart';

class ProfilePictureTabletPhoneWidget extends StatefulWidget {
  late final double? fontSize;
  late final RxBool loadingPicture;
  late final RxBool hasPicture;
  late final RxString profileImagePath;

  ProfilePictureTabletPhoneWidget({
    Key? key,
    this.fontSize,
    required this.loadingPicture,
    required this.hasPicture,
    required this.profileImagePath,
  }) : super(key: key);

  @override
  State<ProfilePictureTabletPhoneWidget> createState() => _ProfilePictureTabletPhoneWidgetState();
}

class _ProfilePictureTabletPhoneWidgetState extends State<ProfilePictureTabletPhoneWidget> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => widget.loadingPicture.value ?
      SizedBox(
        height: 20.h,
        width: 20.h,
        child: CircularProgressIndicator(),
      ) :
      widget.hasPicture.value ?
      Container(
        height: 20.h,
        width: 20.h,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              widget.profileImagePath.value,
            ),
            fit: BoxFit.contain,
          ),
          shape: BoxShape.circle,
          color: AppColors.grayBackgroundPictureColor,
        ),
      ) :
      Container(
        height: 20.h,
        width: 20.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.h),
          color: AppColors.purpleDefaultColor,
        ),
        child: Center(
          child: TextWidget(
            LoggedUser.nameInitials,
            textColor: AppColors.backgroundColor,
            fontWeight: FontWeight.bold,
            fontSize: widget.fontSize ?? 30.sp,
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}
