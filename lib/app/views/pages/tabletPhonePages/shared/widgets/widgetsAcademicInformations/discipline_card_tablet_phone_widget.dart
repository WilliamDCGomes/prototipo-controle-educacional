import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../helpers/format_numbers.dart';
import '../../../../widgetsShared/text_button_widget.dart';
import '../../../gradesFault/popup/discipline_information_tablet_phone_popup.dart';
import '../../popups/bottom_sheet_tablet_phone_popup.dart';
import 'discipline_body_card_tablet_phone_widget.dart';
import 'discipline_header_card_tablet_phone_widget.dart';

class DisciplineCardTabletPhoneWidget extends StatelessWidget {
  final String disciplineCode;
  final String disciplineName;
  final String disciplineWorkload;
  final String firstCardInformation;
  final String professorDiscipline;
  final double? firstNote;
  final double? secondNote;
  final bool? approved;

  const DisciplineCardTabletPhoneWidget(
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
          BottomSheetTabletPhonePopup.showAlert(
            context,
            DisciplineInformationTabletPhonePopup.getWidgetList(
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
            .65,
          );
        },
        componentPadding: EdgeInsets.zero,
        widgetCustom: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DisciplineHeaderCardTabletPhoneWidget(
              disciplineCode: disciplineCode,
              disciplineName: disciplineName,
              disciplineWorkload: disciplineWorkload,
            ),
            DisciplineBodyCardTabletPhoneWidget(
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