import '../../../views/views/text_form_view.dart';

import '../controllers/setting_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FormUpdatePasswordView extends GetView {
  @override
  final SettingController controller;

  const FormUpdatePasswordView({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          return TextFormView(
            editingController: controller.oldPasswordController,
            label: "Old Password",
            isReadOnly: true,
            isObscured: true,
            obscureState: controller.obscureStateOldPassword.value,
            onSuffixTap: () {
              controller.obscureStateOldPassword.toggle();
            },
          );
        }),
        const SizedBox(height: 8),
        Obx(() {
          return TextFormView(
            editingController: controller.newPasswordController,
            label: "New Password",
            isObscured: true,
            obscureState: controller.obscureStateNewPassword.value,
            onSuffixTap: () {
              controller.obscureStateNewPassword.toggle();
            },
          );
        }),
      ],
    );
  }
}
