import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppbarView extends GetView {
  final String title;
  final Function()? darkModeOnTap;
  final bool? darkModeState;

  const AppbarView({
    Key? key,
    required this.title,
    this.darkModeOnTap,
    this.darkModeState,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
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
              title,
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
        (darkModeOnTap != null && darkModeState != null)
            ? Row(
                children: [
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: darkModeOnTap,
                    child: Icon(
                      (darkModeState!) ? Icons.dark_mode : Icons.light_mode,
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  Container(),
                ],
              ),
      ],
    );
  }
}
