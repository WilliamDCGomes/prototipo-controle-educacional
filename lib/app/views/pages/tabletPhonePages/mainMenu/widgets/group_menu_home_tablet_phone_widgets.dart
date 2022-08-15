import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/mainMenu/controller/main_menu_tablet_phone_controller.dart';
import 'package:reorderables/reorderables.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../utils/reorderer_lists.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/text_widget.dart';

class GroupMenuHomeTabletPhoneWidget extends StatelessWidget {
  final String groupMenuId;
  final String titleGroupMenu;
  final List<Widget> menuOptionsList;
  final MainMenuTabletPhoneController mainMenuTabletPhoneController;

  const GroupMenuHomeTabletPhoneWidget(
      { Key? key,
        required this.groupMenuId,
        required this.titleGroupMenu,
        required this.menuOptionsList,
        required this.mainMenuTabletPhoneController,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 1.h),
          child: TextWidget(
            titleGroupMenu,
            textColor: AppColors.blackColor,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
            textAlign: TextAlign.start,
            maxLines: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 2.h),
          child: ReorderableWrap(
            alignment: WrapAlignment.spaceBetween,
            children: menuOptionsList,
            onReorder: (oldIndex, newIndex) {
              var newList = ReorderListHelper.reorderWrap(
                oldIndex,
                newIndex,
                menuOptionsList,
              );

              List<String> list = <String>[];
              newList.forEach((element) {
                if(element.runtimeType != SizedBox){
                  list.add(element.id_option);
                }
              });
              mainMenuTabletPhoneController.updateListOfflineAndOnline(
                groupMenuId,
                list,
              );
            }
          ),
        ),
      ],
    );
  }
}