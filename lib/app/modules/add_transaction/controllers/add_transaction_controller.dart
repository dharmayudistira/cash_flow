import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/constants/message_constants.dart';
import '../../../data/local_storage/auth_pref.dart';
import '../../../data/local_storage/db_helper.dart';
import '../../../data/models/transaction_model.dart';

class AddTransactionController extends GetxController {
  final isAddIncome = Get.arguments as bool;

  var currentUser = AuthPref().getCurrentUser().obs;
  var isAddLoading = false.obs;

  late TextEditingController amountController;
  late TextEditingController dateController;
  late TextEditingController noteController;

  @override
  void onInit() {
    super.onInit();

    amountController = TextEditingController();
    dateController = TextEditingController();
    noteController = TextEditingController();
  }

  @override
  void onClose() {
    amountController.dispose();
    super.onClose();
  }

  void setSelectedDate(DateTime? selectedDate) {
    if (selectedDate != null) {
      dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
    } else {
      Get.snackbar(somethingWentWrong, addTransactionDateIsRequired);
    }
  }

  Future<void> addTransaction() async {
    final amount = amountController.text;
    final date = dateController.text;
    final note = noteController.text;

    isAddLoading.toggle();
    await Future.delayed(const Duration(milliseconds: 500));

    if (_validateInput(amount, date, note)) {
      await _handleInputIsNotEmpty(amount, date, note);
    }
  }

  Future<void> _handleInputIsNotEmpty(
    String amount,
    String date,
    String note,
  ) async {
    const symbolRp = "Rp. ";
    final symbolIndex = amount.indexOf(symbolRp);
    final amountValue = amount
        .substring(symbolIndex + symbolRp.length, amount.length)
        .replaceAll(".", "");

    final newTransactionModel = TransactionModel(
      userId: currentUser.value!.id!,
      amount: int.parse(amountValue),
      isIncome: isAddIncome,
      note: note,
      createdTime: DateTime.parse(date),
    );

    final inserted =
        await CashFlowDatabase.instance.createTransaction(newTransactionModel);

    if (inserted > 0) {
      isAddLoading.toggle();
      Get.back();
    } else {
      isAddLoading.toggle();
      Get.snackbar(somethingWentWrong, databaseError);
      amountController.clear();
      dateController.clear();
      noteController.clear();
    }
  }

  bool _validateInput(String amount, String date, String note) {
    if (amount.isEmpty && date.isEmpty && note.isEmpty) {
      isAddLoading.toggle();
      Get.snackbar(somethingWentWrong, allInputAreRequired);
      return false;
    } else if (amount.isEmpty) {
      isAddLoading.toggle();
      Get.snackbar(somethingWentWrong, addTransactionAmountIsRequired);
      return false;
    } else if (date.isEmpty) {
      isAddLoading.toggle();
      Get.snackbar(somethingWentWrong, addTransactionDateIsRequired);
      return false;
    } else if (note.isEmpty) {
      isAddLoading.toggle();
      Get.snackbar(somethingWentWrong, addTransactionNoteIsRequired);
      return false;
    } else {
      return true;
    }
  }
}
