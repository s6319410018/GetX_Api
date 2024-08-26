import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/GetX_controller.dart';
import 'screens/Home/Home_Screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserPage(),
      initialBinding: BindingsBuilder(() {
        Get.put(UserController());
      }),
    ),
  );
}
