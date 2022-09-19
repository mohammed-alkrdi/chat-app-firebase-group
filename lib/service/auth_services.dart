import 'package:chat_fire_base/helper/helpers_fuctions.dart';
import 'package:chat_fire_base/service/database_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //Login

  Future loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password))
          .user!;
      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //Register

  Future registerUserWithEmailAndPassword(
      String fullName, String email, String phoneNumber, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;
      if (user != null) {
        // call our database service to update the user data
        await DatabaseService(uid: user.uid).savingUserData(fullName, email, phoneNumber);

        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }



  //SignOut

  Future signOut() async {
    try {
      await HelperFunctions.saveUserLoggedInStatus(false);
      await HelperFunctions.saveUserEmailSF("");
      await HelperFunctions.saveUserNameSF("");
      await HelperFunctions.saveUserPhoneNumberSF("");
      await firebaseAuth.signOut();

    } catch(e) {
      return null;
    }
  }
}
