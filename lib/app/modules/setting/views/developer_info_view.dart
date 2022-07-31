import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class DeveloperInfoView extends GetView {
  @override
  final SettingController controller;

  const DeveloperInfoView({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      (() {
        return Column(
          children: [
            const Text("Develop by : "),
            ListTile(
              leading: Card(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
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
    );
  }
}
