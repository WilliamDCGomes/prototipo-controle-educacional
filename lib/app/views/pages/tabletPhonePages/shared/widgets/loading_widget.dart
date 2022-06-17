import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../helpers/paths.dart';
import '../../../../stylePages/app_colors.dart';

class LoadingWidget extends StatefulWidget {
  late RxBool loadingAnimetion;
  late final AnimationController animationController;

  LoadingWidget(
      { Key? key,
        required this.loadingAnimetion,
      }) : super(key: key);

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();

  Future iniciaAnimacao({Widget? destinationPage, bool? backPage}) async {
    loadingAnimetion.value = true;
    animationController.repeat();
    await Future.delayed(Duration(seconds: 5));
    animationController.dispose();
    if(destinationPage != null) {
      Get.offAll(() => destinationPage);
    }
    else if(backPage != null && backPage){
      Get.back();
    }
    else{
      loadingAnimetion.value = false;
      animationController.reset();
    }
  }
}

class _LoadingWidgetState extends State<LoadingWidget> with TickerProviderStateMixin {
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
    return Obx(
      () => Visibility(
        visible: widget.loadingAnimetion.value,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 100.h,
            width: 100.w,
            color: AppColors.blackTransparentColor,
            child: Center(
              child: true ? SizedBox(
                height: 15.h,
                width: 15.h,
                child: CircularProgressIndicator(
                  color: AppColors.purpleDefaultColor,
                  backgroundColor: AppColors.grayColor,
                  strokeWidth: .5.h,
                ),
              ) : Container(
                decoration: BoxDecoration(
                  color: AppColors.purpleDefaultColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.h),
                  ),
                ),
                padding: EdgeInsets.all(1.h),
                child: Lottie.asset(
                  Paths.Loading,
                  height: 20.h,
                  width: 20.h,
                  fit: BoxFit.fill,
                  controller: widget.animationController,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}