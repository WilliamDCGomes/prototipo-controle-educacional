import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto_tcc/base/models/student.dart';
import '../models/user.dart';
import 'interfaces/iuser_service.dart';

class UserService implements IUserService {
  Future<bool> sendNewUser(Users newUser) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(newUser.cpf)
          .set(newUser.toJson())
          .timeout(Duration(minutes: 2));

      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> updateUser(Users user) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user.cpf)
          .update(user.toJson())
          .timeout(Duration(minutes: 2));

      return true;
    } catch (_) {
      return false;
    }
  }

  Future<Users?> getUser(String cpf) async {
    try {
      var lastRaRegistered = await FirebaseFirestore.instance
          .collection("users")
          .where("cpf", isEqualTo: cpf)
          .get()
          .timeout(Duration(minutes: 2));

      if(lastRaRegistered.size > 0) {
        return Users.fromJsonFirebase(lastRaRegistered.docs.first.data());
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  Future<String> getCpf(int studentRa) async {
    try {
      var student = await FirebaseFirestore.instance
          .collection("student")
          .where("ra", isEqualTo: studentRa)
          .get()
          .timeout(Duration(minutes: 2));

      if(student.size > 0) {
        return Student.fromJsonFirebase(student.docs.first.data()).cpf;
      }
      return "";
    } catch (_) {
      return "";
    }
  }

  Future<String> getEmail(String userCpf) async {
    try {
      var student = await FirebaseFirestore.instance
          .collection("users")
          .where("cpf", isEqualTo: userCpf)
          .get()
          .timeout(Duration(minutes: 2));

      if(student.size > 0) {
        return Users.fromJsonFirebase(student.docs.first.data()).email;
      }
      return "";
    } catch (_) {
      return "";
    }
  }

  Future<bool> registerNewUser(String email, String password) async {
    return await FirebaseAuth.instance
      .createUserWithEmailAndPassword(
          email: email,
          password: password,
      )
      .timeout(Duration(minutes: 2))
      .then((value){
          return true;
      })
      .catchError((error){
          return false;
      });
  }

  Future<bool> updatePassword(String newPassword) async {
    bool result = false;
    if(FirebaseAuth.instance.currentUser != null){
      await FirebaseAuth.instance.currentUser?.updatePassword(
        newPassword,
      )
      .timeout(Duration(minutes: 2))
      .then((value){
        result = true;
      })
      .catchError((error){
        result = false;
      });
    }

    return result;
  }

  Future<bool> resetPassword(String email) async {
    bool result = false;

    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email)
        .timeout(Duration(minutes: 2))
        .then((value){
          result = true;
        })
        .catchError((error){
          result = false;
        });

    return result;
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

  Future<bool> loginUser(String email, String password) async {
    return await FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
        .timeout(Duration(minutes: 2))
        .then((value){
          return true;
        })
        .catchError((error){
          return false;
        });
  }

  Future<bool> logoutUser() async {
    try{
      await FirebaseAuth.instance
          .signOut()
          .timeout(Duration(minutes: 2));

      return true;
    }
    catch(_){
      return false;
    }
  }
}