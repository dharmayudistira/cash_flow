const String tableTransaction = "table_transactions";

class TransactionFields {
  static const List<String> transactionColumns = [
    id,
    userId,
    amount,
    isIncome,
    note,
    createdTime,
  ];

  static const String id = "_id";
  static const String userId = "user_id";
  static const String amount = "amount";
  static const String isIncome = "is_income";
  static const String note = "note";
  static const String createdTime = "created_time";
}

//----------------------------------------------------------------------------

const String tableUser = 'table_users';

class UserFields {
  static const List<String> userColumns = [
    id,
    username,
    password,
    name,
  ];

  static const String id = '_id';
  static const String username = 'username';
  static const String password = 'password';
  static const String name = 'name';
}