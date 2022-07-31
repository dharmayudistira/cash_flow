import 'package:cash_flow/app/views/views/appbar_view.dart';
import 'package:cash_flow/app/modules/setting/views/developer_info_view.dart';
import 'package:cash_flow/app/modules/setting/views/form_update_password_view.dart';
import 'package:cash_flow/app/modules/setting/views/input_button_view.dart';

import '../../../views/views/loading_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(() {
        if (controller.isUpdateLogin.value) {
          return LoadingWidget(child: _buildBodySetting(context));
        } else {
          return _buildBodySetting(context);
        }
      }),
    );
  }

  Widget _buildBodySetting(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  const AppbarView(title: "Setting",),
                  const SizedBox(height: 32),
                  FormUpdatePasswordView(controller: controller),
                  const SizedBox(height: 16),
                  InputButtonView(controller: controller),
                ],
              ),
            ),
            DeveloperInfoView(controller: controller),
          ],
        ),
      ),
    );
  }
}
