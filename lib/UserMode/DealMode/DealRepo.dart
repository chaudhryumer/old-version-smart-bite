
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DealRepo extends GetxController{
  Future<void>addDeal(Map<String, dynamic> dealData)async {
    try{
      await FirebaseFirestore.instance.collection("AddDeal").add(dealData);

    }
    on Exception catch(e){
      print("Error in Repo: $e");
      throw Exception("Failed to add deal");
    }



  }

}