import 'package:cash_flow/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class MenuView extends GetView {
  @override
  final HomeController controller;

  const MenuView({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Expanded(
            child: Card(
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.ADD_TRANSACTION, arguments: true)
                      ?.whenComplete(() => controller.refreshData());
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.trending_up),
                    SizedBox(height: 8),
                    Text("Income"),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Card(
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.ADD_TRANSACTION, arguments: false)
                      ?.whenComplete(() => controller.refreshData());
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.trending_down),
                    SizedBox(height: 8),
                    Text("Expense"),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Card(
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.DETAIL_CASH_FLOW, arguments: true)
                      ?.whenComplete(() => controller.refreshData());
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.assessment),
                    SizedBox(height: 8),
                    Text("Cashflow"),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Card(
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.SETTING, arguments: true)
                      ?.whenComplete(() => controller.refreshData());
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.info),
                    SizedBox(height: 8),
                    Text("Setting"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
