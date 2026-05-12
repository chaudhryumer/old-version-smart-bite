
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:project1practice/UserMode/OrderConfirm/OrderRepo.dart';

class OrderVm extends GetxController{
  final  OrderRepo repo=OrderRepo();

  Future<void> addOrder({
    required String name,
    required String number,
    required String email,
    required String? category,
    required String description,
  }) async {
    try {
      // Construct the map INSIDE the function so it uses current values
      Map<String, dynamic> orderData = {
        'orderName': name,
        'OrderNumber': number,
        'Email': email,
        'Category': category,
        'Description': description,
        'CreatedAt': Timestamp.now(),
        'Status': 'Pending',
      };

      await repo.addOrder(orderData);
      Get.back(); // Close the dialog on success
      Get.snackbar("Success", "Order added successfully!");
    } catch (e) {
      print("Error in VM: $e");
      Get.snackbar("Error", "Failed to add order");
    }
  }
  }




