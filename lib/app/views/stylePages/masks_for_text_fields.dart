import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MasksForTextFields {
  static final MaskTextInputFormatter phoneNumberMask = MaskTextInputFormatter(
      mask: '(##) ####-####',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );
  static final MaskTextInputFormatter phoneNumberAcceptExtraNumberMask = MaskTextInputFormatter(
      mask: '(##) ####-#####',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );
  static final MaskTextInputFormatter cellPhoneNumberMask = MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );
  static final MaskTextInputFormatter cepMask = MaskTextInputFormatter(
      mask: '#####-###',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );
  static final MaskTextInputFormatter cpfMask = MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );
  static final MaskTextInputFormatter birthDateMask = MaskTextInputFormatter(
      mask: '##/##/####',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );
  static final MaskTextInputFormatter shirtDateMask = MaskTextInputFormatter(
      mask: '##/##',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );
  static final MaskTextInputFormatter cardNumberMask = MaskTextInputFormatter(
      mask: '#### #### #### ####',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );
  static final MaskTextInputFormatter cvcCodeMask = MaskTextInputFormatter(
      mask: '###',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );
}