import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MenuItemView extends GetView {
  final Function() navigate;
  final String title;
  final IconData icon;

  const MenuItemView({
    Key? key,
    required this.navigate,
    required this.title,
    required this.icon
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: InkWell(
          onTap: navigate,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              const SizedBox(height: 8),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
