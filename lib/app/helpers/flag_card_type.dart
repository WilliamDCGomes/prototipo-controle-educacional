import 'package:projeto_tcc/app/enums/enums.dart';
import 'package:projeto_tcc/app/helpers/paths.dart';

class FlagCardType {
  static String getFlagCard(flagCards? flagCard) {
    if(flagCard != null){
      switch(flagCard){
        case flagCards.eloFlag:
          return Paths.elo_flag;
        case flagCards.visaFlag:
          return Paths.visa_flag;
        case flagCards.hiperFlag:
          return Paths.hiper_flag;
        case flagCards.hipercardFlag:
          return Paths.hipercard_flag;
        case flagCards.mastercardFlag:
          return Paths.mastercard_flag;
        case flagCards.americanExpressFlag:
          return Paths.american_express_flag;
      }
    }
    return "";
  }
}