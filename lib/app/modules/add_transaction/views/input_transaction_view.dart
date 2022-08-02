import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../views/views/text_form_view.dart';
import '../controllers/add_transaction_controller.dart';

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
        TextFormView(
          editingController: controller.amountController,
          inputFormatter: [
            CurrencyTextInputFormatter(
              locale: 'id',
              symbol: 'Rp. ',
              decimalDigits: 0,
            ),
          ],
          inputType: TextInputType.number,
          label: "Amount",
        ),
        const SizedBox(height: 8),
        TextFormView(
          editingController: controller.dateController,
          label: "Date",
          onTap: () async {
            await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(DateTime.now().year - 5),
              lastDate: DateTime(DateTime.now().year + 2),
            ).then((selectedDate) => controller.setSelectedDate(selectedDate));
          },
          isReadOnly: true,
        ),
        const SizedBox(height: 8),
        TextFormView(
          editingController: controller.noteController,
          label: "Note",
        ),
      ],
    );
  }
}
