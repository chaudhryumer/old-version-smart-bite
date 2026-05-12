
 import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project1practice/UserMode/menuMode/ADD%20Dish/AddDish.dart';
import 'package:project1practice/UserMode/menuMode/menuModeVm.dart';

import '../Authentication/AuthRepo.dart';

class MenuModeBnding{

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(menuModeVm());
    Get.put(AddDish());
    Get.put(AuthRepo());


  }
 }