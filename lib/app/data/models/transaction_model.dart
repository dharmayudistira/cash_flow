import '../constants/db_field_constants.dart';

class TransactionModel {
  final int? id;
  final int userId;
  final int amount;
  final bool isIncome;
  final String note;
  final DateTime createdTime;

  const TransactionModel({
    this.id,
    required this.userId,
    required this.amount,
    required this.isIncome,
    required this.note,
    required this.createdTime,
  });

  TransactionModel copy({
    int? id,
    int? userId,
    int? amount,
    bool? isIncome,
    String? note,
    DateTime? createdTime,
  }) =>
      TransactionModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        amount: amount ?? this.amount,
        isIncome: isIncome ?? this.isIncome,
        note: note ?? this.note,
        createdTime: createdTime ?? this.createdTime,
      );

  static TransactionModel fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json[TransactionFields.id] as int?,
        userId: json[TransactionFields.userId] as int,
        amount: json[TransactionFields.amount] as int,
        isIncome: json[TransactionFields.isIncome] == 1,
        note: json[TransactionFields.note] as String,
        createdTime: DateTime.parse(
          json[TransactionFields.createdTime] as String,
        ),
      );

  Map<String, dynamic> toJson() => {
        TransactionFields.id: id,
        TransactionFields.userId: userId,
        TransactionFields.amount: amount,
        TransactionFields.isIncome: isIncome ? 1 : 0,
        TransactionFields.note: note,
        TransactionFields.createdTime: createdTime.toIso8601String(),
      };
}
