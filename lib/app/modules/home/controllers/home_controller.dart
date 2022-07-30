import '../../../data/constants/query_type_enums.dart';
import '../../../data/models/transaction_model.dart';
import '../../../utils/currency_formatter.dart';

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

  Future<void> refreshData() async {
    await _getListTransaction();
  }

  Future<void> _getListTransaction() async {
    final userId = currentUser.value?.id;
    listTransaction.value =
        await CashFlowDatabase.instance.readAllTransaction(userId!);

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
  }

  String getAmountAsCurrency(int amount) {
    return CurrencyFormatter().getRupiahFull(amount);
  }
}
