import 'package:get/get.dart';
import '../models/address_information.dart';
import 'base/base_service.dart';
import 'interfaces/iconsult_cep_service.dart';

class ConsultCepService extends BaseService implements IConsultCepService {
  Future<AddressInformation?> searchCep(String cep) async {
    try {
      String urlWebService = "https://viacep.com.br/ws/$cep/json/";
      Response apiReturn = await get(urlWebService).timeout(Duration(minutes: 2));

      if (apiReturn.hasError || apiReturn.unauthorized || apiReturn.body == null) {
        throw Exception();
      }

      return AddressInformation.fromJsonFirebase(apiReturn.body);
    }
    catch (_) {
      return null;
    }
  }
}