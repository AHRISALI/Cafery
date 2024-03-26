import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistController extends GetxController {
  static RegistController get instance => Get.find();

  final userName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final passwordCheck = TextEditingController();
  final pref = TextEditingController();

  void registerUser(String email, String password) {}
}
