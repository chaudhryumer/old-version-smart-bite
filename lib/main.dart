import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1practice/AdminMode/Admin.dart';
import 'package:project1practice/Authentication/LogoutVm.dart';
import 'package:project1practice/HomePage/HomePage.dart';
import 'package:project1practice/UserMode/DealMode/AddDeal.dart';
import 'package:project1practice/UserMode/User.dart';

import 'AIDashboard/AiExpert.dart';
import 'Authentication/LoginPage.dart';
import 'Authentication/SignUp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'HomePage/InitializeSession.dart';
import 'UserMode/menuMode/ADD Dish/AddDish.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      title: 'SmartBite',
      debugShowCheckedModeBanner: false,

      initialRoute: '/login',

      getPages: [
        GetPage(
          name: '/login',
          page: () =>  LoginPage(),
        ),
        GetPage(name: '/SignUp', page: ()=>  SignUp()),
        GetPage(name: '/home', page: ()=> HomePage()),
        GetPage(name: '/user', page: ()=> User()),
        GetPage(name: '/Admin', page: ()=> Admin()),
        GetPage(name: '/AddDish', page: ()=> AddDish()),
        GetPage(name: '/AddDeal', page: ()=> AddDeal()),
        GetPage(name: '/AiExpert', page: ()=> AiExpert()),
        GetPage(name: '/InitializeSession', page: ()=> InitializeSession()),



      ],


    ),
  );
}
