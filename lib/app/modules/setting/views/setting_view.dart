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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(Icons.arrow_back_ios),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        "Setting",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
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
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.greenAccent,
                      ),
                      onPressed: () async {
                        await controller.updateUser();
                      },
                      child: const Text("Save Password"),
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
              ),
            ),
            Obx(
              (() {
                return Column(
                  children: [
                    const Text("Develop by : "),
                    ListTile(
                      leading: Card(
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          child: Image.asset(
                            "assets/photo_dharma.jpg",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      title: Text(
                        controller.currentUser.value!.name,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      subtitle: Text(
                        "1841720028",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
