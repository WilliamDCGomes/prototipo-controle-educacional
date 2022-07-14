import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../helpers/paths.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/lottie_asset_widget.dart';

class LoadingWithSuccessOrErrorTabletPhoneWidget extends StatefulWidget {
  late final RxBool loadingAnimetion;
  late final RxBool isLoading;
  late final RxBool success;
  late final AnimationController animationController;

  LoadingWithSuccessOrErrorTabletPhoneWidget(
      { Key? key,
        required this.loadingAnimetion,
      }) : super(key: key){
    this.isLoading = true.obs;
    this.success = false.obs;
  }

  @override
  State<LoadingWithSuccessOrErrorTabletPhoneWidget> createState() => _LoadingWithSuccessOrErrorTabletPhoneWidgetState();

  Future startAnimation({Widget? destinationPage, bool? backPage}) async {
    loadingAnimetion.value = true;
    animationController.repeat();
    await Future.delayed(Duration(seconds: 5));
    if(destinationPage != null) {
      isLoading.value = false;
      success.value = true;
      await Future.delayed(Duration(seconds: 3));
      Get.offAll(() => destinationPage);
    }
    else if(backPage != null && backPage){
      isLoading.value = false;
      success.value = true;
      await Future.delayed(Duration(seconds: 3));
      Get.back();
    }
    else{
      isLoading.value = false;
      success.value = true;
      await Future.delayed(Duration(seconds: 3));
    }
    _resetState();
  }

  _resetState(){
    isLoading.value = true;
    success.value = false;
    loadingAnimetion.value = false;
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
        return !widget.loadingAnimetion.value;
      },
      child: Obx(
        () => Visibility(
          visible: widget.loadingAnimetion.value,
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