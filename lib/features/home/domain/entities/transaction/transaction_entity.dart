import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_entity.freezed.dart';

@immutable
@freezed
class TransactionEntity with _$TransactionEntity {
  @override
  final int id;
  @override
  final int userId;
  @override
  final DateTime date;
  @override
  final String merchant;
  @override
  final int amount;
  @override
  final String currency;
  @override
  final String description;
  @override
  final String fromAccount;
  @override
  final String toAccount;
  @override
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
}
