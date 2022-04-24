import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controllers/mainMenuTabletPhoneController.dart';
import '../../../helpers/paths.dart';
import '../../stylePages/appColors.dart';

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

    return SafeArea(
      child: Material(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Scaffold(
            body: Container(
              height: 100.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: AppColors().backgroundFirstScreenColor,
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
                color: AppColors().lightGrayColor,
              ),
              child: TabBar(
                controller: controller.tabController,
                indicatorColor: AppColors().purpleDefaultColor,
                indicatorWeight: .3.h,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13.5.sp,
                  overflow: TextOverflow.ellipsis,
                ),
                labelColor: AppColors().purpleTabColor,
                unselectedLabelColor: AppColors().grayTabColor,
                tabs: [
                  Tab(
                    text: "Home",
                    icon: ImageIcon(
                      AssetImage(Paths().imagesPath + "Icone_Home.png"),
                      size: 4.h,
                    ),
                    height: 9.h,
                  ),
                  Tab(
                    text: "Acadêmico",
                    icon: ImageIcon(
                      AssetImage(Paths().imagesPath + "Icone_Academico.png"),
                      size: 4.h,
                    ),
                    height: 9.h,
                  ),
                  Tab(
                    text: "Financeiro",
                    icon: ImageIcon(
                      AssetImage(Paths().imagesPath + "Icone_Financeiro.png"),
                      size: 4.h,
                    ),
                    height: 9.h,
                  ),
                  Tab(
                    text: "Perfil",
                    icon: ImageIcon(
                      AssetImage(Paths().imagesPath + "Icone_Perfil.png"),
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
    );
  }
}
