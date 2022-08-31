import '../../models/registration_cancellation.dart';

abstract class IRequestRegistrationCancellationService {
  Future<bool> requestRegistrationCancellation(RegistrationCancellation cancellation);

  Future<RegistrationCancellation?> getRegistrationCancellation(String cpf);

  Future<bool> checkRegistrationCancellationAlrightExist(String cpf);

  Future<bool> deleteRegistrationCancellation(String cpf);
}