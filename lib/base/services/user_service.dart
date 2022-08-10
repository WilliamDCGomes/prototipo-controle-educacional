import 'package:firebase_auth/firebase_auth.dart';
import 'interfaces/iuser_service.dart';

class UserService implements IUserService {
  Future<bool> registerNewUser(int ra, String password) async {
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: "$ra@pce.com",
      password: password,
    ).then((value){
      print("Sucesso " + value.user.toString());
      return true;
    }).catchError((error){
      print("Erro " + error.toString());
      return false;
    });
  }

  Future<bool> loggedUser() async {
    try{
      var user = await FirebaseAuth.instance.currentUser;
      return user != null;
    }
    catch(_){
      return false;
    }
  }

  Future<bool> loginUser(String ra, String password) async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: "$ra@pce.com",
      password: password,
    ).then((value){
      return true;
    }).catchError((error){
      return false;
    });
  }

  Future<bool> logoutUser() async {
    try{
      await FirebaseAuth.instance.signOut();
      return true;
    }
    catch(_){
      return false;
    }
  }
}