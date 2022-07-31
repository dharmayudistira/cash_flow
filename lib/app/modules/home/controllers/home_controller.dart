import '../../../data/models/chart_transaction_model.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../data/models/transaction_model.dart';
import '../../../utils/currency_formatter.dart';

import '../../../data/local_storage/auth_pref.dart';
import '../../../data/local_storage/db_helper.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final TooltipBehavior tooltipBehavior = TooltipBehavior(enable: true);

  var currentUser = AuthPref().getCurrentUser().obs;
  var totalAmount = 0.obs;
  var totalIncome = 0.obs;
  var totalExpanse = 0.obs;
  var listTransaction = <TransactionModel>[].obs;
  var listIncomeSum = <ChartTransactionModel>[].obs;
  var listExpanseSum = <ChartTransactionModel>[].obs;

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
    var incomeTransactions = <TransactionModel>[];
    var expanseTransactions = <TransactionModel>[];

    for (var element in listTransaction) {
      if (element.isIncome) {
        income += element.amount;
        incomeTransactions.add(element);
      } else {
        expanse += element.amount;
        expanseTransactions.add(element);
      }
    }

    totalAmount.value = income - expanse;
    totalIncome.value = income;
    totalExpanse.value = expanse;

    listIncomeSum.value = _getSum(incomeTransactions, isIncome: true);
    listExpanseSum.value = _getSum(expanseTransactions, isIncome: false);
  }

  List<ChartTransactionModel> _getSum(
    List<TransactionModel> transaction, {
    required bool isIncome,
  }) {
    Map<String, dynamic> sums = {};
    for (var item in transaction) {
      final dateString = DateFormat('yyyy-MM-dd').format(item.createdTime);
      if (sums.containsKey(dateString)) {
        sums[dateString] += item.amount;
      } else {
        sums[dateString] = item.amount;
      }
    }

    List<Map<String, dynamic>> sumMaps = [];
    sums.forEach((key, value) {
      sumMaps.add({
        "date": key,
        "amount": value,
      });
    });

    return sumMaps.map((e) => ChartTransactionModel.fromJson(e)).toList();
  }

  String getAmountAsCurrency(int amount) {
    return CurrencyFormatter().getRupiahFull(amount);
  }
}
