import '../controllers/home_controller.dart';
import '../../../views/views/empty_transaction_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../data/models/chart_transaction_model.dart';

class GraphCashflowView extends GetView {
  @override
  final HomeController controller;

  const GraphCashflowView({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 6,
                height: 16,
                color: Colors.greenAccent,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "Your cashflow chart",
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: Obx(() {
              if (controller.listIncomeSum.isEmpty &&
                  controller.listExpenseSum.isEmpty) {
                return const EmptyTransactionView();
              } else {
                return SfCartesianChart(
                  tooltipBehavior: controller.tooltipBehavior,
                  legend: Legend(isVisible: true),
                  trackballBehavior: controller.trackballBehavior,
                  primaryXAxis: DateTimeAxis(
                    intervalType: DateTimeIntervalType.days,
                    interval: 1,
                    axisLine: const AxisLine(width: 1),
                    majorGridLines: const MajorGridLines(width: 0),
                  ),
                  primaryYAxis: NumericAxis(
                    numberFormat:
                        NumberFormat.compactSimpleCurrency(locale: 'id'),
                    axisLine: const AxisLine(width: 1),
                    majorGridLines: const MajorGridLines(width: 0),
                  ),
                  series: <SplineSeries<ChartTransactionModel, DateTime>>[
                    SplineSeries(
                      color: Colors.greenAccent,
                      name: 'Income',
                      dataSource: controller.listIncomeSum,
                      xValueMapper: (ChartTransactionModel data, _) =>
                          data.date,
                      yValueMapper: (ChartTransactionModel data, _) =>
                          data.amount,
                    ),
                    SplineSeries(
                      color: Colors.redAccent,
                      name: 'Expense',
                      dataSource: controller.listExpenseSum,
                      xValueMapper: (ChartTransactionModel data, _) =>
                          data.date,
                      yValueMapper: (ChartTransactionModel data, _) =>
                          data.amount,
                    ),
                  ],
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
