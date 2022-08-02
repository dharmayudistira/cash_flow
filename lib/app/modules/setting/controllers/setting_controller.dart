import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constants/message_constants.dart';
import '../../../data/local_storage/auth_pref.dart';
import '../../../data/local_storage/db_helper.dart';
import '../../../data/models/user_model.dart';
import '../../../routes/app_pages.dart';

class SettingController extends GetxController {
  final currentUser = AuthPref().getCurrentUser().obs;

  var isUpdateLogin = false.obs;
  var isDarkModeState = false.obs;
  var obscureStateOldPassword = true.obs;
  var obscureStateNewPassword = true.obs;

  late TextEditingController oldPasswordController;
  late TextEditingController newPasswordController;

  @override
  void onInit() {
    super.onInit();
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();

    oldPasswordController.text = currentUser.value!.password;
  }

  @override
  void onClose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    super.onClose();
  }

  Future<void> updateUser() async {
    isUpdateLogin.toggle();

    await Future.delayed(const Duration(milliseconds: 500));

    if (_validateInput()) {
      _handleInputIsNotEmpty();
    }
  }

  Future<void> _handleInputIsNotEmpty() async {
    final newPassword = newPasswordController.text;

    final newUser = UserModel(
      id: currentUser.value!.id,
      username: currentUser.value!.username,
      password: newPassword,
      name: currentUser.value!.name,
    );

    final result = await CashFlowDatabase.instance.updateUser(newUser);

    if (result > 0) {
      AuthPref().setCurrentUser(newUser);
      oldPasswordController.text = newPassword;
      newPasswordController.clear();
      isUpdateLogin.toggle();
    } else {
      isUpdateLogin.toggle();
      Get.snackbar(somethingWentWrong, databaseError);
    }
  }

  bool _validateInput() {
    final oldPassword = oldPasswordController.text;
    final newPassword = newPasswordController.text;

    if (oldPassword.isEmpty && newPassword.isEmpty) {
      isUpdateLogin.toggle();
      Get.snackbar(somethingWentWrong, allInputAreRequired);
      return false;
    } else if (newPassword.isEmpty) {
      isUpdateLogin.toggle();
      Get.snackbar(somethingWentWrong, loginPasswordIsRequired);
      return false;
    } else if (oldPassword == newPassword) {
      isUpdateLogin.toggle();
      Get.snackbar(somethingWentWrong, updateProfileNewPasswordSame);
      return false;
    } else {
      return true;
    }
  }

  void setTheme() {
    AuthPref().setDarkMode(isDarkModeState.toggle().value);
    Get.changeThemeMode(
      (isDarkModeState.value) ? ThemeMode.dark : ThemeMode.light,
    );
  }

  Future<void> logout() async {
    isUpdateLogin.toggle();
    AuthPref().logout();
    await Future.delayed(const Duration(milliseconds: 500));
    isUpdateLogin.toggle();
    Get.offAllNamed(Routes.LOGIN);
  }
}
