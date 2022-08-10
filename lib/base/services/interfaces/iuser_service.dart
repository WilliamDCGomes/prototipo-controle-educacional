abstract class IUserService {
  Future<bool> registerNewUser(int ra, String password);

  Future<bool> loggedUser();

  Future<bool> loginUser(String ra, String password);

  Future<bool> logoutUser();
}