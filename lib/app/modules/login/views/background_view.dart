import 'package:cash_flow/app/modules/login/controllers/login_controller.dart';
import 'package:cash_flow/app/modules/login/views/logo_app_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

class BackgroundView extends GetView {
  final LoginController controller;
  const BackgroundView({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(),
        SvgPicture.asset('assets/dots_rectangle.svg'),
        Positioned(
          top: 0,
          right: 0,
          child: SvgPicture.asset('assets/background_circles.svg'),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: SvgPicture.asset('assets/striped_oval.svg'),
        ),
        LogoAppView(
          controller: controller,
        ),
      ],
    );
  }
}
