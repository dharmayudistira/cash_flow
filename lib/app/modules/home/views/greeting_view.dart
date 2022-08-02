import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class GreetingView extends GetView {
  @override
  final HomeController controller;

  const GreetingView({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello, ${controller.currentUser.value?.name}!",
          style: Theme.of(context).textTheme.headline3,
        ),
        Obx(() {
          final amount = controller.totalAmount.value;
          return Text(
            "Your total amount is ${controller.getAmountAsCurrency(amount)}",
            style: Theme.of(context).textTheme.subtitle2,
          );
        }),
      ],
    );
  }
}
