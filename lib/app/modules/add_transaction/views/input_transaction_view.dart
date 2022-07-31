import 'package:cash_flow/app/modules/add_transaction/controllers/add_transaction_controller.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class InputTransactionView extends GetView {
  @override
  final AddTransactionController controller;

  const InputTransactionView({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller.amountController,
          inputFormatters: [
            CurrencyTextInputFormatter(
              locale: 'id',
              symbol: 'Rp. ',
              decimalDigits: 0,
            ),
          ],
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            labelText: "Amount",
            filled: true,
            labelStyle: TextStyle(
              fontFamily: 'Decker',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller.dateController,
          onTap: () async {
            final selectedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2023),
            );
            controller.setSelectedDate(selectedDate);
          },
          readOnly: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            labelText: "Date",
            suffixIcon: Icon(Icons.date_range),
            filled: true,
            labelStyle: TextStyle(
              fontFamily: 'Decker',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller.noteController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            labelText: "Note",
            filled: true,
            labelStyle: TextStyle(
              fontFamily: 'Decker',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
