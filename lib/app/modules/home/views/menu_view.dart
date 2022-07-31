import '../controllers/home_controller.dart';
import '../../../views/views/menu_item_view.dart';
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
          MenuItemView(
            navigate: () {
              Get.toNamed(Routes.ADD_TRANSACTION, arguments: true)
                  ?.whenComplete(() => controller.refreshData());
            },
            title: "Income",
            icon: Icons.trending_up,
          ),
          MenuItemView(
            navigate: () {
              Get.toNamed(Routes.ADD_TRANSACTION, arguments: false)
                  ?.whenComplete(() => controller.refreshData());
            },
            title: "Expense",
            icon: Icons.trending_down,
          ),
          MenuItemView(
            navigate: () {
              Get.toNamed(Routes.DETAIL_CASH_FLOW)
                  ?.whenComplete(() => controller.refreshData());
            },
            title: "Cashflow",
            icon: Icons.assessment,
          ),
          MenuItemView(
              navigate: () {
                Get.toNamed(Routes.SETTING)
                    ?.whenComplete(() => controller.refreshData());
              },
              title: "Setting",
              icon: Icons.info),
        ],
      ),
    );
  }
}
