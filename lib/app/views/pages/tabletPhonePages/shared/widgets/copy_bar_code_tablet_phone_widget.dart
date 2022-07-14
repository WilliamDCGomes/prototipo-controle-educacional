import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/shared/widgets/snackbar_tablet_phone_widget.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_button_widget.dart';
import 'package:flutter/services.dart';
import 'package:projeto_tcc/app/views/stylePages/app_colors.dart';

class CopyBarCodeTabletPhoneWidget extends StatelessWidget {
  final String successText;
  final String valueCopy;
  final Widget widgetCustom;

  const CopyBarCodeTabletPhoneWidget(
      { Key? key,
        required this.successText,
        required this.valueCopy,
        required this.widgetCustom,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButtonWidget(
      onTap: (){
        Clipboard.setData(ClipboardData(text: valueCopy));
        SnackbarTabletPhoneWidget(
          warningText: "Sucesso",
          informationText: successText,
          backgrondColor: AppColors.purpleDefaultColorWithOpacity
        );
      },
      componentPadding: EdgeInsets.zero,
      widgetCustom: widgetCustom,
    );
  }
}