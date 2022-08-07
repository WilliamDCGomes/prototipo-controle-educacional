import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../utils/app_close_controller.dart';
import '../controller/main_menu_tablet_phone_controller.dart';
import '../../../../../utils/paths.dart';
import '../../../../stylePages/app_colors.dart';

class MainMenuTabletPhonePage extends StatefulWidget {
  const MainMenuTabletPhonePage({Key? key}) : super(key: key);

  @override
  State<MainMenuTabletPhonePage> createState() => _MainMenuTabletPhonePageState();
}

class _MainMenuTabletPhonePageState extends State<MainMenuTabletPhonePage> with SingleTickerProviderStateMixin{
  late MainMenuTabletPhoneController controller;

  @override
  void initState() {
    controller = Get.put(MainMenuTabletPhoneController());
    controller.tabController = TabController(
      length: 4,
      vsync: this,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        return AppCloseController.verifyCloseScreen();
      },
      child: SafeArea(
        child: Material(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Scaffold(
              body: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: AppColors.backgroundFirstScreenColor,
                  ),
                ),
                child: TabBarView(
                  controller: controller.tabController,
                  children: controller.tabMainMenuList,
                ),
              ),
              bottomNavigationBar: Container(
                height: 9.h,
                padding: EdgeInsets.fromLTRB(.5.h, 0, .5.h, .5.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4.5.h),
                    topLeft: Radius.circular(4.5.h),
                  ),
                  color: AppColors.backgroundColor,
                ),
                child: TabBar(
                  controller: controller.tabController,
                  indicatorColor: AppColors.purpleDefaultColor,
                  indicatorWeight: .3.h,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.5.sp,
                    overflow: TextOverflow.ellipsis,
                  ),
                  labelColor: AppColors.purpleTabColor,
                  unselectedLabelColor: AppColors.grayTabColor,
                  tabs: [
                    Tab(
                      text: "Home",
                      icon: ImageIcon(
                        AssetImage(Paths.Icone_Home),
                        size: 4.h,
                      ),
                      height: 9.h,
                    ),
                    Tab(
                      text: "Acadêmico",
                      icon: ImageIcon(
                        AssetImage(Paths.Icone_Academico),
                        size: 4.h,
                      ),
                      height: 9.h,
                    ),
                    Tab(
                      text: "Financeiro",
                      icon: ImageIcon(
                        AssetImage(Paths.Icone_Financeiro),
                        size: 4.h,
                      ),
                      height: 9.h,
                    ),
                    Tab(
                      text: "Perfil",
                      icon: ImageIcon(
                        AssetImage(Paths.Icone_Perfil),
                        size: 4.h,
                      ),
                      height: 9.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
