import 'package:intl/intl.dart';

class CurrencyFormatter {
  String getRupiahFull(int amount) {
    return NumberFormat.currency(
      locale: 'id',
      decimalDigits: 0,
      symbol: 'Rp. ',
    ).format(amount);
  }

  String getRupiahCompact(int amount) {
    return NumberFormat.compactCurrency(
      locale: 'id',
      decimalDigits: 0,
      symbol: 'Rp. ',
    ).format(amount);
  }
}
