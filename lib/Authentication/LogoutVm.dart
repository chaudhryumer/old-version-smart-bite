import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:project1practice/Authentication/AuthRepo.dart';

class LogoutVm extends GetxController{

  Future<void> logout() async {
    try{
      await AuthRepo().Logout();
      Get.offAllNamed('/login');

    }
    on FirebaseAuthException catch (e){
      Get.snackbar("Error", e.message ?? "Something went wrong");
    }
    catch(e){
      Get.snackbar("Error", "Something went wrong");
    }
  }
}