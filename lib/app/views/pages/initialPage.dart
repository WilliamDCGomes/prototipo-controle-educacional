import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/helpers/platformType.dart';
import 'package:projeto_tcc/app/views/stylePages/appColors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../controllers/initialPageController.dart';
import '../../helpers/paths.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Future.delayed(
          Duration(
              milliseconds: 2500
          ),
          () {
            InitialPageController().loadFirstScreen(context);
          }
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            '${Paths().imagesPath}background.png',
            fit: BoxFit.fitHeight,
            height: 100.h,
            width: 100.w,
            cacheHeight: 700,
            cacheWidth: 700,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 7.h),
                  child: Image.asset(
                    '${Paths().imagesPath}logo_pce.png',
                    height: PlatformType().isPhone(context) ? 18.h : 12.h,
                  ),
                ),
                SizedBox(
                  height: 6.h,
                  width: 6.h,
                  child: CircularProgressIndicator(
                    color: AppColors().whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}