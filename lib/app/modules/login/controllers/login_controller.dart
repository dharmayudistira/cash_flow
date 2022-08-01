import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constants/message_constants.dart';
import '../../../data/local_storage/auth_pref.dart';
import '../../../data/local_storage/db_helper.dart';
import '../../../data/models/user_model.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  var isLoginLoading = false.obs;
  var obscureStatePassword = true.obs;

  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void onInit() async {
    super.onInit();
    usernameController = TextEditingController();
    passwordController = TextEditingController();

    await _checkLoginPref();
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> doLogin(String username, String password) async {
    isLoginLoading.toggle();
    await Future.delayed(const Duration(seconds: 1));

    if (_validateInput(username, password)) {
      await _handleInputIfNotEmpty(username, password);
    }
  }

  Future<void> _handleInputIfNotEmpty(String username, String password) async {
    try {
      final user =
          await CashFlowDatabase.instance.readUserByUsernameAndPassword(
        username,
        password,
      );

      if (user.username == username && user.password == password) {
        setLoginPref(user);
        isLoginLoading.toggle();
        Get.offAllNamed(Routes.HOME);
      } else {
        isLoginLoading.toggle();
        Get.snackbar(somethingWentWrong, loginErrorMessage(username));
      }
    } on Exception {
      isLoginLoading.toggle();
      Get.snackbar(somethingWentWrong, loginErrorMessage(username));
    }
  }

  void setLoginPref(UserModel userModel) {
    AuthPref().setLoginState(true);
    AuthPref().setCurrentUser(userModel);
  }

  Future<void> _checkLoginPref() async {
    isLoginLoading.toggle();
    await Future.delayed(const Duration(milliseconds: 500));
    if (AuthPref().getCurrentUser() != null) {
      isLoginLoading.toggle();
      Get.offAllNamed(Routes.HOME);
    } else {
      isLoginLoading.toggle();
    }
  }

  bool _validateInput(String username, String password) {
    if (username.isEmpty && password.isEmpty) {
      isLoginLoading.toggle();
      Get.snackbar(somethingWentWrong, allInputAreRequired);
      return false;
    } else if (username.isEmpty) {
      isLoginLoading.toggle();
      Get.snackbar(somethingWentWrong, loginUsernameIsRequired);
      return false;
    } else if (password.isEmpty) {
      isLoginLoading.toggle();
      Get.snackbar(somethingWentWrong, loginPasswordIsRequired);
      return false;
    } else {
      return true;
    }
  }
}
