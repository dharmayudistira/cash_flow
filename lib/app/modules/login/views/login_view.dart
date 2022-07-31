import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          return LoadingWidget(child: _buildBodyLogin(context));
        } else {
          return _buildBodyLogin(context);
        }
      }),
    );
  }

  Widget _buildBodyLogin(BuildContext context) {
    return Stack(
      children: [
        Container(),
        SvgPicture.asset('assets/dots_rectangle.svg'),
        Positioned(
          top: 0,
          right: 0,
          child: SvgPicture.asset('assets/background_circles.svg'),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: SvgPicture.asset('assets/striped_oval.svg'),
        ),
        _buildLogoLogin(context),
      ],
    );
  }

  Widget _buildLogoLogin(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 80),
          SvgPicture.asset('assets/sample_logo.svg'),
          const SizedBox(height: 8),
          Text(
            "Cashflow App!",
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            "Where you can track your cash flow easily",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          const SizedBox(height: 32),
          _buildFormLogin(context),
        ],
      ),
    );
  }

  Widget _buildFormLogin(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  cursorColor: Theme.of(context).primaryColor,
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: InputDecoration(
                    hintText: "Username",
                    border: InputBorder.none,
                    hintStyle: Theme.of(context).textTheme.bodyText1,
                    icon: const Icon(
                      Icons.person,
                    ),
                  ),
                  controller: controller.usernameController,
                ),
                const Divider(),
                TextField(
                  cursorColor: Theme.of(context).primaryColor,
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: InputBorder.none,
                    hintStyle: Theme.of(context).textTheme.bodyText1,
                    icon: const Icon(
                      Icons.lock,
                    ),
                  ),
                  controller: controller.passwordController,
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Login",
              style: Theme.of(context).textTheme.headline2,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: FloatingActionButton(
                onPressed: () async {
                  final username = controller.usernameController.text;
                  final password = controller.passwordController.text;
                  controller.doLogin(username, password);
                },
                child: const Icon(Icons.arrow_forward),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
