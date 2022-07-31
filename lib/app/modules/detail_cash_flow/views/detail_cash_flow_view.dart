import 'cashflow_list_view.dart';
import '../../../views/views/appbar_view.dart';
import '../../../views/views/empty_transaction_view.dart';

import '../../../data/constants/message_constants.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/detail_cash_flow_controller.dart';

class DetailCashFlowView extends GetView<DetailCashFlowController> {
  const DetailCashFlowView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return _buildBodyDetailCashFlow(context);
        }),
      ),
    );
  }

  Widget _buildBodyDetailCashFlow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppbarView(title: "Detail Cashflow"),
          const SizedBox(height: 32),
          Expanded(
            child: (controller.listTransaction.isNotEmpty)
                ? CashflowListView(controller: controller)
                : EmptyTransactionView(
                    buttonNavigate: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(
                          Routes.ADD_TRANSACTION,
                          arguments: true,
                        )?.whenComplete(() => controller.refreshData());
                      },
                      child: const Text("Click here to add a transaction"),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
