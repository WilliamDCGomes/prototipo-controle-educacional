import 'ibase_service_get.dart';

abstract class IBaseServicePostAndGet implements IBaseServiceGet {
  Future<void> postMethod();
}