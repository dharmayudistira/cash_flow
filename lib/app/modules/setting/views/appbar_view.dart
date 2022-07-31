import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AppbarView extends GetView {
  const AppbarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
