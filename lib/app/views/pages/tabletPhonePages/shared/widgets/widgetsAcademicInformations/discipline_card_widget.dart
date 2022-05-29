import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../helpers/format_numbers.dart';
import '../../../../widgetsShared/text_button_widget.dart';
import '../../../gradesFault/popup/discipline_information_popup_widget.dart';
import '../../popups/bottom_sheet_popup.dart';
import 'discipline_body_card_widget.dart';
import 'discipline_header_card_widget.dart';

class DisciplineCardWidget extends StatelessWidget {
  final String disciplineCode;
  final String disciplineName;
  final String disciplineWorkload;
  final String firstCardInformation;
  final String professorDiscipline;
  final double? firstNote;
  final double? secondNote;
  final bool? approved;

  const DisciplineCardWidget(
      { Key? key,
        required this.disciplineCode,
        required this.disciplineName,
        required this.disciplineWorkload,
        required this.firstCardInformation,
        required this.professorDiscipline,
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
          BottomSheetPopup.showAlert(
            context,
            DisciplineInformationPopupWidget.getWidgetList(
              context,
              disciplineCode,
              disciplineName,
              disciplineWorkload,
              firstCardInformation,
              professorDiscipline,
              firstNote,
              secondNote,
              approved,
            ),
          );
        },
        componentPadding: EdgeInsets.zero,
        widgetCustom: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DisciplineHeaderCardWidget(
              disciplineCode: disciplineCode,
              disciplineName: disciplineName,
              disciplineWorkload: disciplineWorkload,
            ),
            DisciplineBodyCardWidget(
              firstCardInformation: firstCardInformation,
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