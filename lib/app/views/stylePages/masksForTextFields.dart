import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MasksForTextFields {
  static final MasksForTextFields _masksForTextFields = MasksForTextFields._internal();
  factory MasksForTextFields() {
    return _masksForTextFields;
  }
  MasksForTextFields._internal();

  final MaskTextInputFormatter phoneNumberMask = MaskTextInputFormatter(
      mask: '(##) ####-####',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );
  final MaskTextInputFormatter phoneNumberAcceptExtraNumberMask = MaskTextInputFormatter(
      mask: '(##) ####-#####',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );
  final MaskTextInputFormatter cellPhoneNumberMask = MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );
  final MaskTextInputFormatter cepMask = MaskTextInputFormatter(
      mask: '#####-###',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );
  final MaskTextInputFormatter cpfMask = MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );
  final MaskTextInputFormatter birthDateMask = MaskTextInputFormatter(
      mask: '##/##/####',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );
}