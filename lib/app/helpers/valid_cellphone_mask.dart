import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ValidCellPhoneMask {
  static TextEditingValue updateCellPhoneMask(String cellPhoneTyped, MaskTextInputFormatter maskCellPhoneFormatter){
    if(cellPhoneTyped.length > 14)
      return maskCellPhoneFormatter.updateMask(mask: "(##) #####-####");
    else
      return maskCellPhoneFormatter.updateMask(mask: "(##) ####-#####");
  }
}