class TransactionEntity {
  final int id;
  final int userId;
  final DateTime date;
  final String merchant;
  final double amount;
  final String currency;
  final String? description;
  final String fromAccount;
  final String toAccount;
  final String category;

  TransactionEntity({
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
