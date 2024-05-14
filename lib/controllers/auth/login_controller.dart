import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailTC = TextEditingController();
  final passwordTC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final _status = Rx<RxStatus>(RxStatus.empty());

  RxStatus get status => _status.value;

// Input validatorLogic
  bool isValidEmail = true;
  bool isValidPassword = true;

  @override
  void onClose() {
    emailTC.dispose();
    passwordTC.dispose();
  }

  String? validateEmail(String? val) {
    if (val!.isEmpty) {
      isValidEmail = false;
      return "Email is required";
    } else if (!EmailValidator.validate(val)) {
      isValidEmail = false;
      return "Email address is not valid";
    } else {
      isValidEmail = true;
      return null;
    }
  }

  String? validatePassword(String? val) {
    if (val!.isEmpty) {
      isValidPassword = false;
      return "Password is required";
    } else if (!RegExp(
            r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[-_@$!%*#?&()])[A-Za-z\d\-_@$!%^*.,~`#?&()]{8,}$")
        .hasMatch(val)) {
      isValidPassword = false;
      return "Password cannot be less than 8 characters and must contain\nat least one capital letter\nat least one lowercase letter\nat least a number and a special character";
    } else {
      isValidPassword = true;
      return null;
    }
  }


  Future<void> onLogin() async {
    if (formKey.currentState!.validate()) {
      _status.value = RxStatus.loading();

      // to show loader
      await Future.delayed(const Duration(seconds: 5));
      try {
        Get.snackbar(
          "Login Successful",
          "Display the message here",
          colorText: Colors.black,
          backgroundColor: Colors.green,
          icon: const Icon(Icons.done),
        );
        _status.value = RxStatus.success();
      } catch (e) {
        e.printError();
        Get.snackbar(
          "Login Failed",
          "Display the message here",
          colorText: Colors.black,
          backgroundColor: Colors.red,
          icon: const Icon(Icons.error),
        );
        _status.value = RxStatus.error(e.toString());
      }
    }
  }
}
