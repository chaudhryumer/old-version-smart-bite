
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AccountRepo extends GetxController{

  Future<String?> getUserRole(String uid) async {
    final doc = await FirebaseFirestore.instance.collection('admin').doc(uid).get();
    return doc.data()?['role'] as String?;
  }

}