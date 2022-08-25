

import '../../models/user.dart';

abstract class IUserService {
  Future<bool> sendNewUser(Users newUser);

  Future<Users?> getUser(String cpf);

  Future<bool> registerNewUser(int ra, String password);

  Future<bool> loggedUser();

  Future<bool> loginUser(String ra, String password);

  Future<bool> logoutUser();
}