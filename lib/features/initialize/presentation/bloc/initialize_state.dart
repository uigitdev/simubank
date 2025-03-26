import 'package:simubank/simubank.dart';

sealed class InitializeState extends Equatable{
  const InitializeState();

  @override
  List<Object?> get props => [];
}

class InitializeNone extends InitializeState {}

class InitializeAuthenticated extends InitializeState {
  final String sessionId;

  const InitializeAuthenticated(this.sessionId);

  @override
  List<Object?> get props => [sessionId];
}

class InitializeUnauthenticated extends InitializeState {}
