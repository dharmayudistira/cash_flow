import '../../../data/constants/message_constants.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/currency_formatter.dart';
import '../../../views/views/loading_view.dart';
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
                "Detail Cashflow",
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
          const SizedBox(height: 32),
          Expanded(
            child: (controller.listTransaction.isNotEmpty)
                ? ListView.separated(
                    itemCount: controller.listTransaction.length,
                    itemBuilder: (context, index) {
                      final item = controller.listTransaction[index];
                      final itemAmount =
                          CurrencyFormatter().getRupiahFull(item.amount);
                      final itemDate =
                          DateFormat.MMMEd().format(item.createdTime);
                      return ListTile(
                        trailing: Icon(
                          (item.isIncome)
                              ? Icons.trending_up
                              : Icons.trending_down,
                          color: (item.isIncome)
                              ? Colors.greenAccent
                              : Colors.redAccent,
                        ),
                        title: Text(itemAmount),
                        subtitle: Text("${item.note} · $itemDate"),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                  )
                : SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.data_exploration,
                          color: Colors.greenAccent,
                          size: 64,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          emptyListTransaction,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            Get.toNamed(
                              Routes.ADD_TRANSACTION,
                              arguments: true,
                            )?.whenComplete(() => controller.refreshData());
                          },
                          child: const Text("Click here to add a transaction"),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
