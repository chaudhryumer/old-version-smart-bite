


import 'package:get/get.dart';
import 'package:project1practice/UserMode/DealMode/DealRepo.dart';

class AddDealVm extends GetxController{
  final DealRepo repo=DealRepo();
  Future<void>addDeal({
    required String DealName,
    required String Price,
    required String Category,
    required String Description,
    required String DealItems,


})async {
    try{
      Map<String, dynamic> dealData={
        'DealName':DealName,
        'Price':Price,
        'Category':Category,
        'Description':Description,
        'DealItems':DealItems,


      };
      await repo.addDeal(dealData);
      Get.back();
      Get.snackbar("Success", "Deal added successfully!");


    }
    on Exception catch(e){
      print("Error in VM: $e");
      Get.snackbar("Error", "Failed to add dish");


    }


  }
}