import 'package:get/get_connect.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseService extends GetConnect {
  SharedPreferences? sharedPreferences;

  BaseService() {
    httpClient.timeout = const Duration(seconds: 30);
    allowAutoSignedCert = true;
  }

  @override
  Future<Response<T>> get<T>(String url, {Map<String, String>? headers, String? contentType, Map<String, dynamic>? query, Decoder<T>? decoder}) async {
    final response = await httpClient.get<T>(
      url,
      headers: headers,
      contentType: contentType,
      query: query,
      decoder: decoder,
    );

    if (!response.unauthorized) {
      return response;
    }

    return httpClient.get<T>(
      url,
      contentType: contentType,
      query: query,
      decoder: decoder,
    );
  }
}