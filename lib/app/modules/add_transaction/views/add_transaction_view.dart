import 'package:cash_flow/app/views/views/loading_view.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_transaction_controller.dart';

class AddTransactionView extends GetView<AddTransactionController> {
  const AddTransactionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          (controller.isAddIncome) ? "Add Income" : "Add Expanse",
          style: Theme.of(context).textTheme.headline3,
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          if (controller.isAddLoading.value) {
            return LoadingWidget(child: _buildBodyAddTransaction(context));
          } else {
            return _buildBodyAddTransaction(context);
          }
        }),
      ),
    );
  }

  Widget _buildBodyAddTransaction(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  controller.addTransaction();
                },
                child: Text(
                  "Add",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
