import 'package:cash_flow/app/data/constants/query_type_enums.dart';
import 'package:cash_flow/app/routes/app_pages.dart';
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
          _buildMenuHome(),
          const SizedBox(height: 16),
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
        Text(
          "Your total amount is ${controller.getAmounAsCurrency(QueryType.getTotalAmount)}",
          style: Theme.of(context).textTheme.subtitle2,
        ),
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
              color: const Color(0xFF7DCE13),
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
                  Text(
                    controller.getAmounAsCurrency(QueryType.getIncome),
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(color: Colors.white),
                  ),
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
              color: const Color(0xFFFF5D5D),
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
                  Text(
                    controller.getAmounAsCurrency(QueryType.getExpanse),
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(color: Colors.white),
                  ),
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

  Widget _buildMenuHome() {
    return Column(
      children: [
        Card(
          child: InkWell(
            child: ListTile(
              title: const Text("Add Income"),
              leading: Container(
                height: 46,
                width: 46,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.camera,
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
            ),
            onTap: () {
              Get.toNamed(Routes.ADD_TRANSACTION, arguments: true);
            },
          ),
        ),
      ],
    );
  }
}
