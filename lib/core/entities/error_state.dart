import 'package:simubank/simubank.dart';

@immutable
abstract class ErrorState {
  final String message;
  final Object? error;
  final StackTrace? stackTrace;

  const ErrorState({required this.message, this.error, this.stackTrace});
}
