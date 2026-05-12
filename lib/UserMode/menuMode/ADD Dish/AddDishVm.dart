
import 'package:get/get.dart';

import 'AddDishRepo.dart';

class AddDishVm extends GetxController{
  final AddDshRepo repo=AddDshRepo();
  Future<void>addDish({
    required String DishName,
    required String Price,
    required String Category,
    required String Description,
}) async {
    try{
      Map<String, dynamic> dishData = {
        'DishName': DishName,
        'Price': Price,
        'Category': Category,
        'Description': Description,
      };
      await repo.addDish(dishData);
      Get.back();
      Get.snackbar("Success", "Dish added successfully!");

    }
    on Exception catch(e){
      print("Error in VM: $e");
      Get.snackbar("Error", "Failed to add dish");

    }

  }


}