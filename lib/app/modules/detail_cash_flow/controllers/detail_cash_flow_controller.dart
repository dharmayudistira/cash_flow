import '../../../data/local_storage/auth_pref.dart';
import '../../../data/local_storage/db_helper.dart';
import '../../../data/models/transaction_model.dart';
import 'package:get/get.dart';

class DetailCashFlowController extends GetxController {
  final currentUser = AuthPref().getCurrentUser().obs;
  final listTransaction = <TransactionModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    _getListTransaction();
  }

  Future<void> refreshData() async {
    await _getListTransaction();
  }

  Future<void> _getListTransaction() async {
    final userId = currentUser.value!.id!;
    listTransaction.value =
        await CashFlowDatabase.instance.readAllTransaction(userId);
  }
}
