import '../controllers/login_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FormLoginView extends GetView {
  @override
  final LoginController controller;

  const FormLoginView({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 16,
              right: 16,
            ),
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
                Obx(() {
                  return TextField(
                    obscureText: controller.obscureStatePassword.value,
                    obscuringCharacter: '*',
                    cursorColor: Theme.of(context).primaryColor,
                    style: Theme.of(context).textTheme.bodyText1,
                    decoration: InputDecoration(
                      suffix: getSuffixIcon(),
                      hintText: "Password",
                      border: InputBorder.none,
                      hintStyle: Theme.of(context).textTheme.bodyText1,
                      icon: const Icon(
                        Icons.lock,
                      ),
                      contentPadding: const EdgeInsets.only(
                        bottom: 25 / 2,
                      ),
                    ),
                    controller: controller.passwordController,
                  );
                }),
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

  Widget? getSuffixIcon() => IconButton(
        splashRadius: 1,
        iconSize: 20,
        onPressed: () {
          controller.obscureStatePassword.toggle();
        },
        icon: (controller.obscureStatePassword.value)
            ? const Icon(
                Icons.visibility_off,
              )
            : const Icon(Icons.visibility),
      );
}
