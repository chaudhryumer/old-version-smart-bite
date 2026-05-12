
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo extends GetxController{

  Future<UserCredential> login(String email, String Password) async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: Password
    );
  }
  void signUp(){

  }
  Future<void> Logout() async {
    return await FirebaseAuth.instance.signOut();


  }


}