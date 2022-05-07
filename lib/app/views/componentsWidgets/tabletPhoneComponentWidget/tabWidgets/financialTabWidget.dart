import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../controllers/mainMenuTabletPhoneController.dart';
import '../../../../helpers/paths.dart';
import '../../../stylePages/appColors.dart';

class FinancialTabWidget extends StatefulWidget {
  late final MainMenuTabletPhoneController controller;
  FinancialTabWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<FinancialTabWidget> createState() => _FinancialTabWidgetState();
}

class _FinancialTabWidgetState extends State<FinancialTabWidget> {
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
                  colors: AppColors.backgroundFirstScreenColor,
                ),
              ),
              child: TabBarView(
                controller: widget.controller.tabController,
                children: widget.controller.tabMainMenuList,
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
                color: AppColors.lightGrayColor,
              ),
              child: TabBar(
                controller: widget.controller.tabController,
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
    );
  }
}
