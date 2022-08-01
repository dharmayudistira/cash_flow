import 'background_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../views/views/loading_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(() {
        if (controller.isLoginLoading.value) {
          return LoadingWidget(
              child: BackgroundView(
            controller: controller,
          ));
        } else {
          return BackgroundView(
            controller: controller,
          );
        }
      }),
    );
  }
}
