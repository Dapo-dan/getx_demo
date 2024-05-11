import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final emailTC = TextEditingController();
  final phoneTC = TextEditingController();
  final firstNameTC = TextEditingController();
  final lastNameTC = TextEditingController();
  final passwordTC = TextEditingController();
  final confirmpassTC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final _status = Rx<RxStatus>(RxStatus.empty());

  RxStatus get status => _status.value;

// Input validatorLogic
  bool isValidEmail = true;
  bool isValidFname = true;
  bool isValidLName = true;
  bool isValidPassword = true;
  bool isValidCPassword = true;

  @override
  void onClose() {
    emailTC.dispose();
    phoneTC.dispose();
    firstNameTC.dispose();
    lastNameTC.dispose();
    passwordTC.dispose();
    confirmpassTC.dispose();
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

  String? validateFirstName(String? val) {
    if (val!.isEmpty) {
      isValidFname = false;
      return "First name is required";
    } else if (val.length < 3) {
      isValidFname = false;
      return "First name short";
    } else {
      isValidFname = true;
      return null;
    }
  }

  String? validateLastName(String? val) {
    if (val!.isEmpty) {
      isValidLName = false;
      return "Last name is required";
    } else if (val.length < 3) {
      isValidLName = false;
      return "Last name short";
    } else {
      isValidLName = true;
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

  String? validateCPassword(String? val) {
    if (val != passwordTC.text) {
      isValidCPassword = false;
      return "Passwords do not match";
    } else {
      isValidCPassword = true;
      return null;
    }
  }

  Future<void> onSignUp() async {
    if (formKey.currentState!.validate()) {
      _status.value = RxStatus.loading();
      try {
        //Perform login logic here
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
