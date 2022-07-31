import 'graph_cashflow_view.dart';
import 'greeting_view.dart';
import 'menu_view.dart';
import 'overview_cashflow_view.dart';

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
        GreetingView(controller: controller),
        const SizedBox(height: 16),
        OverviewCashflowView(controller: controller),
        const SizedBox(height: 8),
        MenuView(controller: controller),
        const SizedBox(height: 16),
        GraphCashflowView(controller: controller),
      ],
    );
  }
}
