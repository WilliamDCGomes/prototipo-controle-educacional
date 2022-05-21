import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/enums/enums.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../controllers/main_menu_tablet_phone_controller.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../text_field_widget.dart';

class AcademicTabListWidget extends StatefulWidget {
  late final MainMenuTabletPhoneController controller;
  late final academicTabs academicTabType;
  AcademicTabListWidget({
    Key? key,
    required this.controller,
    required this.academicTabType,
  }) : super(key: key);

  @override
  State<AcademicTabListWidget> createState() => _AcademicTabListWidgetState();
}

class _AcademicTabListWidgetState extends State<AcademicTabListWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      child: Padding(
        padding: EdgeInsets.only(top: .5.h),
        child: Column(
          children: [
            TextFieldWidget(
              controller: widget.academicTabType == academicTabs.curriculum ?
                widget.controller.curriculumSearchController :
                widget.controller.deliveriesSearchController,
              hintText: widget.academicTabType == academicTabs.curriculum ?
                "Pesquisar Matéria" : "Pesquisar Trabalho",
              height: 6.h,
              width: 90.w,
              iconTextField: Icon(
                Icons.search,
                color: AppColors.purpleDefaultColor,
                size: 3.h,
              ),
              keyboardType: TextInputType.name,
            ),
            SizedBox(
              height: 35.h,
              child: ListView.builder(
                itemCount: widget.academicTabType == academicTabs.curriculum ?
                  widget.controller.curriculumTabList.length :
                  widget.controller.deliveryTabList.length,
                itemBuilder: (context, index) {
                  return widget.academicTabType == academicTabs.curriculum ?
                  widget.controller.curriculumTabList.elementAt(index) :
                  widget.controller.deliveryTabList.elementAt(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
