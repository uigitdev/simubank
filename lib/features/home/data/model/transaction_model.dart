import 'package:simubank/simubank.dart';

class TransactionModel extends TransactionEntity {

  const TransactionModel({
    required super.id,
    required super.userId,
    required super.date,
    required super.merchant,
    required super.amount,
    required super.currency,
    required super.description,
    required super.fromAccount,
    required super.toAccount,
    required super.category,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json['id'],
        userId: json['userId'],
        date: DateTime.parse(json['date']),
        merchant: json['merchant'],
        amount: json['amount'],
        currency: json['currency'],
        description: json['description'],
        fromAccount: json['from_account'],
        toAccount: json['to_account'],
        category: json['category'],
      );

  Map<String, dynamic> toJson(String sessionId) => {
    'id': id,
    'userId': userId,
    'date': date.toIso8601String(),
    'merchant': merchant,
    'amount': amount,
    'currency': currency,
    'description': description,
    'from_account': fromAccount,
    'to_account': toAccount,
    'category': category,
    'sessionId': sessionId,
  };
}
