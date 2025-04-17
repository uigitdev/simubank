import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simubank/simubank.dart';

part 'transaction_model.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
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

  @override
  @JsonKey(name: 'from_account')
  String get fromAccount => super.fromAccount;

  @override
  @JsonKey(name: 'to_account')
  String get toAccount => super.toAccount;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson(String sessionId) =>
      _$TransactionModelToJson(this)..putIfAbsent('sessionId', () => sessionId);
}
