import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../utils/platform_type.dart';
import 'information_student_card_tablet_phone_widget.dart';

class StudentCardTabletPhoneWidget extends StatelessWidget {
  final String imageBasePath;
  final String cardNumber;
  final String raNumber;
  final String nameStudent;
  final String validateCard;

  const StudentCardTabletPhoneWidget(
      { Key? key,
        required this.imageBasePath,
        required this.cardNumber,
        required this.raNumber,
        required this.nameStudent,
        required this.validateCard,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.asset(
            imageBasePath,
            height: PlatformType.isPhone(context) ? 24.h : 27.h,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        InformationStudentCardTabletPhoneWidget(
          cardNumber: cardNumber,
          raNumber: raNumber,
          nameStudent: nameStudent,
          validateCard: validateCard,
        ),
      ],
    );
  }
}