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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildGreetingHome(context),
          const SizedBox(height: 16),
          _buildOverviewHome(context),
          const SizedBox(height: 8),
          _buildGraphHome(),
          const SizedBox(height: 8),
          _buildMenuHome(context),
        ],
      ),
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

  Widget _buildGraphHome() {
    return const Placeholder(
      fallbackHeight: 300,
      fallbackWidth: double.infinity,
    );
  }

  Widget _buildMenuHome(BuildContext context) {
    return Column(
      children: [
        Card(
          child: InkWell(
            child: ListTile(
              title: Text(
                "Add Income",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              leading: const Icon(
                Icons.trending_up,
                size: 28,
              ),
              trailing: const Icon(Icons.chevron_right),
            ),
            onTap: () {
              Get.toNamed(Routes.ADD_TRANSACTION, arguments: true)
                  ?.whenComplete(() => controller.refreshData());
            },
          ),
        ),
        Card(
          child: InkWell(
            child: ListTile(
              title: Text(
                "Add Expanse",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              leading: const Icon(
                Icons.trending_down,
                size: 28,
              ),
              trailing: const Icon(Icons.chevron_right),
            ),
            onTap: () {
              Get.toNamed(Routes.ADD_TRANSACTION, arguments: false)
                  ?.whenComplete(() => controller.refreshData());
            },
          ),
        ),
        Card(
          child: InkWell(
            child: ListTile(
              title: Text(
                "Detail Cashflow",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              leading: const Icon(
                Icons.assessment,
                size: 28,
              ),
              trailing: const Icon(Icons.chevron_right),
            ),
            onTap: () {
              Get.toNamed(Routes.DETAIL_CASH_FLOW, arguments: false)
                  ?.whenComplete(() => controller.refreshData());
            },
          ),
        ),
        Card(
          child: InkWell(
            child: ListTile(
              title: Text(
                "Setting",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              leading: const Icon(
                Icons.info_outline,
                size: 28,
              ),
              trailing: const Icon(Icons.chevron_right),
            ),
            onTap: () {
              Get.toNamed(Routes.SETTING, arguments: false)
                  ?.whenComplete(() => controller.refreshData());
            },
          ),
        )
      ],
    );
  }
}
