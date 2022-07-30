import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/detail_cash_flow_controller.dart';

class DetailCashFlowView extends GetView<DetailCashFlowController> {
  const DetailCashFlowView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailCashFlowView'),
        centerTitle: false,
      ),
      body: Container(),
    );
  }
}
