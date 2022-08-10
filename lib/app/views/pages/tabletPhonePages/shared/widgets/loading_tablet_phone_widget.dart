import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../utils/paths.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/lottie_asset_widget.dart';

class LoadingTabletPhoneWidget extends StatefulWidget {
  late final RxBool loadingAnimation;
  late final AnimationController animationController;

  LoadingTabletPhoneWidget(
      { Key? key,
        required this.loadingAnimation,
      }) : super(key: key);

  @override
  State<LoadingTabletPhoneWidget> createState() => _LoadingTabletPhoneWidgetState();

  Future startAnimation({Widget? destinationPage, bool? backPage}) async {
    loadingAnimation.value = true;
    animationController.repeat();
  }

  Future stopAnimation({Widget? destinationPage, bool? backPage, bool? justLoading}) async {
    if(justLoading != null && justLoading){
      await Future.delayed(Duration(seconds: 1));
      _resetState();
      return;
    }
    else if(destinationPage != null) {
      await Future.delayed(Duration(seconds: 3));
      Get.offAll(() => destinationPage);
    }
    else if(backPage != null && backPage){
      await Future.delayed(Duration(seconds: 3));
      Get.back();
    }
    else{
      await Future.delayed(Duration(seconds: 3));
    }
    _resetState();
  }

  _resetState(){
    loadingAnimation.value = false;
    animationController.reset();
  }
}

class _LoadingTabletPhoneWidgetState extends State<LoadingTabletPhoneWidget> with TickerProviderStateMixin {
  @override
  void initState() {
    widget.animationController = AnimationController(vsync: this);
    widget.animationController.duration = Duration(seconds: 3);
    super.initState();
  }

  @override
  void dispose() {
    widget.animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async {
        return !widget.loadingAnimation.value;
      },
      child: Obx(
        () => Visibility(
          visible: widget.loadingAnimation.value,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 100.h,
              width: 100.w,
              color: AppColors.blackTransparentColor,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.purpleDefaultColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.h),
                    ),
                  ),
                  padding: EdgeInsets.all(1.h),
                  child: LottieAssetWidget(
                    animationPath: Paths.Loading,
                    animationController: widget.animationController,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}