class ChartTransactionModel {
  final DateTime date;
  final int amount;

  ChartTransactionModel({required this.date, required this.amount});

  static ChartTransactionModel fromJson(Map<String, dynamic> json) {
    return ChartTransactionModel(
      date: DateTime.parse(json["date"] as String),
      amount: json["amount"],
    );
  }
}
