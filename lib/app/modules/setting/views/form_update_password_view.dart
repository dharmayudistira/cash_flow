import 'package:cash_flow/app/modules/setting/controllers/setting_controller.dart';
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
        TextField(
          controller: controller.oldPasswordController,
          readOnly: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            labelText: "Current Password",
            filled: true,
            labelStyle: TextStyle(
              fontFamily: 'Decker',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller.newPasswordController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            labelText: "New Password",
            filled: true,
            labelStyle: TextStyle(
              fontFamily: 'Decker',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
