import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../utils/paths.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/lottie_asset_widget.dart';

class LoadingWithSuccessOrErrorTabletPhoneWidget extends StatefulWidget {
  late final RxBool loadingAnimation;
  late final RxBool isLoading;
  late final RxBool success;
  late final AnimationController animationController;

  LoadingWithSuccessOrErrorTabletPhoneWidget(
      { Key? key,
        required this.loadingAnimation,
      }) : super(key: key){
    this.isLoading = true.obs;
    this.success = false.obs;
  }

  @override
  State<LoadingWithSuccessOrErrorTabletPhoneWidget> createState() => _LoadingWithSuccessOrErrorTabletPhoneWidgetState();

  Future startAnimation({Widget? destinationPage, bool? backPage}) async {
    loadingAnimation.value = true;
    animationController.repeat();
  }

  Future stopAnimation({Widget? destinationPage, bool? backPage, bool? justLoading, bool? fail, int? duration}) async {
    if(justLoading != null && justLoading){
      await Future.delayed(Duration(seconds: 1));
      _resetStateWithoutSuccessOrFail();
      return;
    }
    else if(destinationPage != null) {
      isLoading.value = false;
      success.value = true;
      await Future.delayed(Duration(seconds: duration ?? 3));
      Get.offAll(() => destinationPage);
    }
    else if(backPage != null && backPage){
      isLoading.value = false;
      success.value = true;
      await Future.delayed(Duration(seconds: duration ?? 3));
      Get.back();
    }
    else if(fail != null && fail){
      isLoading.value = false;
      success.value = false;
      await Future.delayed(Duration(seconds: duration ?? 3));
    }
    else{
      isLoading.value = false;
      success.value = true;
      await Future.delayed(Duration(seconds: duration ?? 3));
    }
    _resetState();
  }

  _resetState(){
    isLoading.value = true;
    success.value = false;
    loadingAnimation.value = false;
    animationController.reset();
  }

  _resetStateWithoutSuccessOrFail(){
    loadingAnimation.value = false;
    isLoading.value = true;
    animationController.reset();
  }
}

class _LoadingWithSuccessOrErrorTabletPhoneWidgetState extends State<LoadingWithSuccessOrErrorTabletPhoneWidget> with TickerProviderStateMixin {
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
                child: Obx(
                  () => Visibility(
                    visible: widget.isLoading.value,
                    replacement: widget.success.value ?
                      LottieAssetWidget(
                        animationPath: Paths.Success_Animation,
                        repeat: false,
                      ) :
                      LottieAssetWidget(
                        animationPath: Paths.Error,
                        repeat: false,
                      ) ,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: LottieAssetWidget(
                        height: 40.h,
                        width: 40.h,
                        animationPath: Paths.Loading3,
                        animationController: widget.animationController,
                      ),
                    ),
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