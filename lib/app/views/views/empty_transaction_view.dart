import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../data/constants/message_constants.dart';
import '../../routes/app_pages.dart';

class EmptyTransactionView extends GetView {
  final ElevatedButton? buttonNavigate;

  const EmptyTransactionView({
    Key? key,
    this.buttonNavigate,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
          const SizedBox(height: 16),
          (buttonNavigate != null)
              ? buttonNavigate!
              : Container(),
        ],
      ),
    );
  }
}
