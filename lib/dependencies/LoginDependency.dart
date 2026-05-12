

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project1practice/Authentication/LogoutVm.dart';
import 'package:project1practice/Authentication/SignUpVm.dart';

import '../Authentication/AuthRepo.dart';
import '../Authentication/LoginVm.dart';

class LoginBinding{
  @override
void dependencies() {
  // TODO: implement dependencies
  Get.put(LoginVm());
  Get.put(LogoutVm());
  Get.put(AuthRepo());
  Get.put(SignUpVm());

}
}