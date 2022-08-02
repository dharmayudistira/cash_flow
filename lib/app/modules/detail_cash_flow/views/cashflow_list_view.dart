import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../utils/currency_formatter.dart';
import '../controllers/detail_cash_flow_controller.dart';

class CashflowListView extends GetView {
  @override
  final DetailCashFlowController controller;

  const CashflowListView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: controller.listTransaction.length,
      itemBuilder: (context, index) {
        final item = controller.listTransaction[index];
        final itemAmount = CurrencyFormatter().getRupiahFull(item.amount);
        final itemDate = DateFormat.MMMEd().format(item.createdTime);
        return ListTile(
          trailing: Icon(
            (item.isIncome) ? Icons.trending_up : Icons.trending_down,
            color: (item.isIncome) ? Colors.greenAccent : Colors.redAccent,
          ),
          title: Text(itemAmount),
          subtitle: Text("${item.note} · $itemDate"),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}
