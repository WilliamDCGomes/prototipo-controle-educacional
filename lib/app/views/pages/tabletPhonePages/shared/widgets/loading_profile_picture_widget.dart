import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../utils/paths.dart';
import '../../../widgetsShared/lottie_asset_widget.dart';

class LoadingProfilePictureWidget extends StatefulWidget {
  late final RxBool loadingAnimation;
  late final RxBool isLoading;
  late final AnimationController animationController;

  LoadingProfilePictureWidget(
      { Key? key,
        required this.loadingAnimation,
      }) : super(key: key){
    this.isLoading = true.obs;
  }

  @override
  State<LoadingProfilePictureWidget> createState() => _LoadingProfilePictureWidgetState();

  Future startAnimation({Widget? destinationPage, bool? backPage}) async {
    loadingAnimation.value = true;
    animationController.repeat();
  }

  Future stopAnimation() async {
    await Future.delayed(Duration(seconds: 1));
    _resetState();
    return;
  }

  _resetState(){
    loadingAnimation.value = false;
    isLoading.value = true;
    animationController.reset();
  }
}

class _LoadingProfilePictureWidgetState extends State<LoadingProfilePictureWidget> with TickerProviderStateMixin {
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
          child: Center(
            child: LottieAssetWidget(
              height: 40.h,
              width: 40.h,
              animationPath: Paths.Loading3,
              animationController: widget.animationController,
            ),
          ),
        ),
      ),
    );
  }
}