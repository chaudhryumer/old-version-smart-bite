import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1practice/Authentication/AuthRepo.dart';

class LoginVm extends GetxController{

  final isLoading = false.obs;

  // Optional: store error message if you want to show it in UI
  final errorMessage = ''.obs;

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;
      errorMessage.value = ''; // clear previous error

      // Assuming AuthRepo().login returns Future<UserCredential>
      final userCredential = await AuthRepo().login(email, password);

      // Success
      isLoading.value = false;

      // Optional: save user info if needed
      print("Login successful → UID: ${userCredential.user?.uid}");

      // Navigate to home
      Get.offAllNamed('/home'); // offAll = clear stack, better for auth flow

    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      errorMessage.value = e.message ?? 'Authentication failed';

      Get.snackbar(
        'Login Failed',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[700],
        colorText: Colors.white,
        duration: const Duration(seconds: 4),
      );
    } catch (e) {
      // Catch other unexpected errors (network, etc.)
      isLoading.value = false;
      errorMessage.value = 'Something went wrong: $e';

      Get.snackbar(
        'Error',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[800],
        colorText: Colors.white,
      );
    }
  }
}