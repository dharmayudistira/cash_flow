import '../controllers/login_controller.dart';
import 'form_login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

class LogoAppView extends GetView {
  @override
  final LoginController controller;

  const LogoAppView({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 80),
          SvgPicture.asset('assets/sample_logo.svg'),
          const SizedBox(height: 8),
          Text(
            "Cashflow App!",
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            "Where you can track your cash flow easily",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          const SizedBox(height: 32),
          FormLoginView(
            controller: controller,
          ),
        ],
      ),
    );
  }
}
