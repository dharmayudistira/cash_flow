import '../controllers/setting_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class InputButtonView extends GetView {
  @override
  final SettingController controller;

  const InputButtonView({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.greenAccent,
            ),
            onPressed: () async {
              await controller.updateUser();
            },
            child: const Text(
              "Save Password",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("Back"),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.redAccent,
            ),
            onPressed: () async {
              await controller.logout();
            },
            child: const Text(
              "Logout",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
