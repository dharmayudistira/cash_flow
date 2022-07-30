import 'package:cash_flow/app/data/constants/query_type_enums.dart';
import 'package:cash_flow/app/data/models/transaction_model.dart';
import 'package:cash_flow/app/utils/currency_formatter.dart';

import '../../../data/local_storage/auth_pref.dart';
import '../../../data/local_storage/db_helper.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentUser = AuthPref().getCurrentUser().obs;
  var totalAmount = 0.obs;
  var totalIncome = 0.obs;
  var totalExpanse = 0.obs;
  var listTransaction = <TransactionModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await _getListTransaction();
  }

  Future<void> _getListTransaction() async {
    final userId = currentUser.value?.id;
    listTransaction.value =
        await CashFlowDatabase.instance.readAllTransaction(userId!);
  }

  String getAmounAsCurrency(QueryType type) {
    final amount = _getOverview(type);
    return CurrencyFormatter().getRupiahFull(amount);
  }

  int _getOverview(QueryType type) {
    var income = 0;
    var expanse = 0;
    for (var element in listTransaction) {
      if (element.isIncome) {
        income += element.amount;
      } else {
        expanse += element.amount;
      }
    }

    totalAmount.value = income - expanse;
    totalIncome.value = income;
    totalExpanse.value = expanse;

    switch (type) {
      case QueryType.getTotalAmount:
        return totalAmount.value;
      case QueryType.getIncome:
        return totalIncome.value;
      case QueryType.getExpanse:
        return totalExpanse.value;
    }
  }
}
