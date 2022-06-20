import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:projeto_tcc/app/helpers/paths.dart';

class FlagCardType {
  static String getFlagCard(CreditCardType? flagCard) {
    if(flagCard != null){
      switch(flagCard){
        case CreditCardType.elo:
          return Paths.elo_flag;
        case CreditCardType.visa:
          return Paths.visa_flag;
        case CreditCardType.hiper:
          return Paths.hiper_flag;
        case CreditCardType.hipercard:
          return Paths.hipercard_flag;
        case CreditCardType.mastercard:
          return Paths.mastercard_flag;
        case CreditCardType.amex:
          return Paths.american_express_flag;
        case CreditCardType.discover:
          // TODO: Handle this case.
          break;
        case CreditCardType.dinersclub:
          // TODO: Handle this case.
          break;
        case CreditCardType.jcb:
          // TODO: Handle this case.
          break;
        case CreditCardType.unionpay:
          // TODO: Handle this case.
          break;
        case CreditCardType.maestro:
          // TODO: Handle this case.
          break;
        case CreditCardType.mir:
          // TODO: Handle this case.
          break;
        case CreditCardType.unknown:
          // TODO: Handle this case.
          break;
      }
    }
    return "";
  }
}