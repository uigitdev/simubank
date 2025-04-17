import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simubank/simubank.dart';

part 'search_transaction_entity.freezed.dart';

@immutable
@Freezed(makeCollectionsUnmodifiable: true)
class SearchTransactionEntity with _$SearchTransactionEntity {
  @override
  final String searched;
  @override
  final List<TransactionEntity> transactions;

  const SearchTransactionEntity({
    required this.searched,
    required this.transactions,
  });
}
