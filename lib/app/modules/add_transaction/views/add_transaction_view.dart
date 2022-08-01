import 'input_transaction_view.dart';
import '../../../views/views/appbar_view.dart';

import '../../../views/views/loading_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_transaction_controller.dart';

class AddTransactionView extends GetView<AddTransactionController> {
  const AddTransactionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isAddLoading.value) {
          return LoadingWidget(child: _buildBodyAddTransaction(context));
        } else {
          return SafeArea(child: _buildBodyAddTransaction(context));
        }
      }),
    );
  }

  Widget _buildBodyAddTransaction(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppbarView(
            title: controller.isAddIncome
                ? "Add Income Transaction"
                : "Add Expense Transaction",
          ),
          const SizedBox(height: 32),
          InputTransactionView(controller: controller),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: (controller.isAddIncome)
                      ? Colors.greenAccent
                      : Colors.redAccent,
                ),
                onPressed: () async {
                  await controller.addTransaction();
                },
                child: Text(
                  (controller.isAddIncome) ? "Add Income" : "Add Expense",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
