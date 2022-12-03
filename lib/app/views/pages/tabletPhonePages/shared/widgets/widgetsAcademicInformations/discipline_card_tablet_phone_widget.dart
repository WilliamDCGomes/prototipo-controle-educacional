import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../utils/format_numbers.dart';
import '../../../../widgetsShared/text_button_widget.dart';
import '../../../gradesFault/popup/discipline_information_tablet_phone_popup.dart';
import '../../popups/bottom_sheet_tablet_phone_popup.dart';
import 'discipline_body_card_tablet_phone_widget.dart';
import 'discipline_header_card_tablet_phone_widget.dart';

class DisciplineCardTabletPhoneWidget extends StatelessWidget {
  final String disciplineName;
  final String disciplineWorkload;
  final int firstFaults;
  final int secondFaults;
  final String professorDiscipline;
  final double? firstNote;
  final double? secondNote;
  final bool? approved;
  final int classDuration;
  final String semester;

  const DisciplineCardTabletPhoneWidget(
      { Key? key,
        required this.disciplineName,
        required this.disciplineWorkload,
        required this.firstFaults,
        required this.secondFaults,
        required this.professorDiscipline,
        required this.classDuration,
        required this.semester,
        this.firstNote,
        this.secondNote,
        this.approved,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: TextButtonWidget(
        onTap: (){
          BottomSheetTabletPhonePopup.showAlert(
            context,
            DisciplineInformationTabletPhonePopup.getWidgetList(
              context,
              disciplineName,
              disciplineWorkload,
              firstFaults,
              secondFaults,
              professorDiscipline,
              firstNote,
              secondNote,
              approved,
              classDuration,
            ),
          );
        },
        componentPadding: EdgeInsets.zero,
        widgetCustom: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DisciplineHeaderCardTabletPhoneWidget(
              disciplineName: disciplineName,
              disciplineWorkload: disciplineWorkload,
            ),
            DisciplineBodyCardTabletPhoneWidget(
              firstFaults: firstFaults,
              secondFaults: secondFaults,
              disciplineWorkload: disciplineWorkload,
              classDuration: classDuration,
              noteAverage: firstNote != null && secondNote != null ?
                FormatNumbers.getNumberAverage(firstNote!, secondNote!) : "-",
              approved: approved,
            ),
          ],
        ),
      ),
    );
  }
}