import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'discipline_body_card_widget.dart';
import 'discipline_header_card_widget.dart';

class DisciplineCardWidget extends StatelessWidget {
  final String disciplineCode;
  final String disciplineName;
  final String disciplineWorkload;
  final String firstCardInformation;
  final String noteAverage;
  final bool? approved;

  const DisciplineCardWidget(
      { Key? key,
        required this.disciplineCode,
        required this.disciplineName,
        required this.disciplineWorkload,
        required this.firstCardInformation,
        required this.noteAverage,
        this.approved,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DisciplineHeaderCardWidget(
            disciplineCode: disciplineCode,
            disciplineName: disciplineName,
            disciplineWorkload: disciplineWorkload,
          ),
          DisciplineBodyCardWidget(
            firstCardInformation: firstCardInformation,
            noteAverage: noteAverage,
            approved: approved,
          ),
        ],
      ),
    );
  }
}