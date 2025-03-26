import 'package:simubank/simubank.dart';

class TransactionEntity extends Equatable {
  final int id;
  final int userId;
  final DateTime date;
  final String merchant;
  final int amount;
  final String currency;
  final String description;
  final String fromAccount;
  final String toAccount;
  final String category;

  const TransactionEntity({
    required this.id,
    required this.userId,
    required this.date,
    required this.merchant,
    required this.amount,
    required this.currency,
    required this.description,
    required this.fromAccount,
    required this.toAccount,
    required this.category,
  });

  @override
  List<Object?> get props => [id, merchant];
}
