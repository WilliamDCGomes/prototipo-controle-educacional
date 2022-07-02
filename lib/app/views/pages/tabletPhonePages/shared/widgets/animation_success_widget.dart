import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../helpers/paths.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/lottie_asset_widget.dart';

class AnimationSuccessWidget extends StatefulWidget {
  late final RxBool animationSuccess;
  late final AnimationController animationController;

  AnimationSuccessWidget(
  { Key? key,
    required this.animationSuccess,
  }) : super(key: key);

  @override
  State<AnimationSuccessWidget> createState() => _AnimationSuccessWidgetState();

  Future startAnimation({Widget? destinationPage, bool? backPage}) async {
    animationSuccess.value = true;
    animationController.forward();
    await Future.delayed(Duration(seconds: 2));
    animationController.reset();
    if(destinationPage != null) {
      Get.offAll(() => destinationPage);
    }
    else if(backPage != null && backPage){
      Get.back();
    }
    else{
      animationSuccess.value = false;
    }
  }
}

class _AnimationSuccessWidgetState extends State<AnimationSuccessWidget> with TickerProviderStateMixin {
  @override
  void initState() {
    widget.animationController = AnimationController(vsync: this);
    widget.animationController.duration = Duration(seconds: 2);
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
        visible: widget.animationSuccess.value,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 100.h,
            width: 100.w,
            color: AppColors.blackTransparentColor,
            child: Center(
              child: LottieAssetWidget(
                animationPath: Paths.Success_Animation,
                repeat: false,
                animationController: widget.animationController
              ),
            ),
          ),
        ),
      ),
    );
  }
}