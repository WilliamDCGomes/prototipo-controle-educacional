import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reorderables/reorderables.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../helpers/reorderer_lists.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/text_widget.dart';

class GroupMenuHomeTabletPhoneWidget extends StatelessWidget {
  final String titleGroupMenu;
  final List<Widget> menuOptionsList;

  const GroupMenuHomeTabletPhoneWidget(
      { Key? key,
        required this.titleGroupMenu,
        required this.menuOptionsList,
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
              //TODO Fazer um método para salvar a nova lista
            }
          ),
        ),
      ],
    );
  }
}