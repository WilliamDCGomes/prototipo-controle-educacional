import 'package:dio/dio.dart';
import 'internet_connection.dart';

class BrazilAddressInformations {
  static List<String> _getStates() {
    return [
      "AC",
      "AL",
      "AM",
      "AP",
      "BA",
      "CE",
      "DF",
      "ES",
      "GO",
      "MA",
      "MG",
      "MS",
      "MT",
      "PA",
      "PB",
      "PE",
      "PI",
      "PR",
      "RJ",
      "RN",
      "RO",
      "RR",
      "RS",
      "SC",
      "SE",
      "SP",
      "TO",
    ];
  }

  static Future<List<String>> getUfsNames() async {
    try{
      if(await InternetConnection.checkConnection()){
        List<String> ufsList = [];
        final dio = Dio();
        Response response = await dio.get(
            "https://servicodados.ibge.gov.br/api/v1/localidades/estados/"
        );

        if (response.data != null) {
          for (var states in response.data) {
            ufsList.add(states["sigla"]);
          }
          ufsList.sort((a, b) => a.compareTo(b));
          return ufsList;
        }
      }
      return _getStates();
    }
    catch(e){
      return _getStates();
    }
  }

  static Future<List<String>> getCityNames(String uf) async {
    try{
      if(await InternetConnection.checkConnection()){
        List<String> citysList = [];
        final dio = Dio();
        Response response = await dio.get(
            "https://servicodados.ibge.gov.br/api/v1/localidades/estados/${uf.toLowerCase()}/distritos"
        );

        if (response.data != null) {
          for (var citys in response.data) {
            citysList.add(citys["nome"]);
          }
          citysList.sort((a, b) => a.compareTo(b));
        }
        else
          citysList.add("Selecione um Estado");

        return citysList;
      }
      return ["Sem conexão com a internet"];
    }
    catch(e){
      return ["Sem dados"];
    }
  }
}