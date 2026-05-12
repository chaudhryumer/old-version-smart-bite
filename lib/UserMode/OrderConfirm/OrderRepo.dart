
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class OrderRepo {
  Future<void> addOrder(Map<String, dynamic> orderData) async {
    try {
      // Logic to add order to Firestore goes here
      await FirebaseFirestore.instance.collection('orders').add(orderData);

    }
    on Exception catch (e) {
      print(e);
    }

  }


}