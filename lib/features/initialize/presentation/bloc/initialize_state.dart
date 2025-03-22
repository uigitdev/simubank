sealed class InitializeState {}

class InitializeNone extends InitializeState {}

class InitializeAuthenticated extends InitializeState {
  final String sessionId;

  InitializeAuthenticated(this.sessionId);
}

class InitializeUnauthenticated extends InitializeState {}
