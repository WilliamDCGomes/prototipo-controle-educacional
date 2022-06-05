import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../helpers/paths.dart';
import '../../../../stylePages/app_colors.dart';

class AnimationSuccessWidget extends StatefulWidget {
  late RxBool animationSuccess;
  late final AnimationController animationController;

  AnimationSuccessWidget(
  { Key? key,
    required this.animationSuccess,
  }) : super(key: key);

  @override
  State<AnimationSuccessWidget> createState() => _AnimationSuccessWidgetState();

  iniciaAnimacao(Widget destinationPage) async {
    animationSuccess.value = true;
    animationController.forward();
    await Future.delayed(Duration(seconds: 2));
    Get.offAll(() => destinationPage);
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
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: widget.animationSuccess.value,
        child: Container(
          height: 100.h,
          width: 100.w,
          color: AppColors.blackTransparentColor,
          child: Center(
            child: Lottie.asset(
              Paths.Success_Animation,
              repeat: false,
              height: 20.h,
              width: 20.h,
              fit: BoxFit.fill,
              controller: widget.animationController
            ),
          ),
        ),
      ),
    );
  }
}