import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/enums/enums.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../utils/platform_type.dart';
import '../../../../widgetsShared/text_field_widget.dart';
import '../../controller/main_menu_tablet_phone_controller.dart';
import '../../../../../../utils/reorderer_lists.dart';
import '../../../../../stylePages/app_colors.dart';
import 'card_tab_list_tablet_phone_widget.dart';

class AcademicTabListTabletPhoneWidget extends StatefulWidget {
  late final MainMenuTabletPhoneController controller;
  late final academicTabs academicTabType;
  AcademicTabListTabletPhoneWidget({
    Key? key,
    required this.controller,
    required this.academicTabType,
  }) : super(key: key);

  @override
  State<AcademicTabListTabletPhoneWidget> createState() => _AcademicTabListTabletPhoneWidgetState();
}

class _AcademicTabListTabletPhoneWidgetState extends State<AcademicTabListTabletPhoneWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: .5.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: .5.w),
            child: TextFieldWidget(
              controller: widget.academicTabType == academicTabs.curriculum ?
                widget.controller.curriculumSearchController :
                widget.controller.deliveriesSearchController,
              hintText: widget.academicTabType == academicTabs.curriculum ?
                "Pesquisar Matéria" : "Pesquisar Trabalho",
              height: PlatformType.isTablet(context) ? 7.h : 9.h,
              width: double.infinity,
              iconTextField: Icon(
                Icons.search,
                color: AppColors.purpleDefaultColor,
                size: 3.h,
              ),
              keyboardType: TextInputType.name,
            ),
          ),
          Expanded(
            child: ReorderableListView.builder(
              itemCount: widget.academicTabType == academicTabs.curriculum ?
                widget.controller.curriculumTabList.length :
                widget.controller.deliveryTabList.length,
              itemBuilder: (context, index) {
                return CardTabListTabletPhoneWidget(
                  key: Key("${widget.academicTabType == academicTabs.curriculum}$index"),
                  curriculumDeliveryViewController: widget.academicTabType == academicTabs.curriculum ?
                    widget.controller.curriculumTabList[index] :
                    widget.controller.deliveryTabList[index],
                );
              },
              onReorder: (oldIndex, newIndex) {
                var newList = ReorderListHelper.reorderList(
                  oldIndex,
                  newIndex,
                  widget.academicTabType == academicTabs.curriculum ?
                    widget.controller.curriculumTabList :
                    widget.controller.deliveryTabList,
                );
                //TODO Fazer um método para salvar a nova lista
              }
            ),
          ),
        ],
      ),
    );
  }
}
