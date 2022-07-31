import '../../../data/constants/message_constants.dart';
import '../../../data/models/chart_transaction_model.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: _buildBodyHome(context),
        ),
      ),
    );
  }

  Widget _buildBodyHome(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildGreetingHome(context),
        const SizedBox(height: 16),
        _buildOverviewHome(context),
        const SizedBox(height: 8),
        _buildMenuHome(context),
        const SizedBox(height: 16),
        _buildGraphHome(context),
      ],
    );
  }

  Widget _buildGreetingHome(BuildContext context) {
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

  Widget _buildOverviewHome(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: SizedBox(
            height: 100,
            width: double.infinity,
            child: Card(
              color: Colors.greenAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Your total income",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Colors.white),
                  ),
                  Obx(() {
                    final amount = controller.totalIncome.value;
                    return Text(
                      controller.getAmountAsCurrency(amount),
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(color: Colors.white),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: SizedBox(
            height: 100,
            width: double.infinity,
            child: Card(
              color: Colors.redAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Your total expanse",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Colors.white),
                  ),
                  Obx(() {
                    final amount = controller.totalExpanse.value;
                    return Text(
                      controller.getAmountAsCurrency(amount),
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(color: Colors.white),
                    );
                  }),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildGraphHome(BuildContext context) {
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
                "Your cashflow charts",
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
                  controller.listExpanseSum.isEmpty) {
                return SizedBox(
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
                    ],
                  ),
                );
              } else {
                return SfCartesianChart(
                  tooltipBehavior: controller.tooltipBehavior,
                  legend: Legend(isVisible: true),
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
                      name: 'Expanse',
                      dataSource: controller.listExpanseSum,
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

  Widget _buildMenuHome(BuildContext context) {
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
                    Text("Expanse"),
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
