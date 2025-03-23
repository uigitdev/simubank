sealed class InitializeState {
  const InitializeState();
}

class InitializeNone extends InitializeState {}

class InitializeAuthenticated extends InitializeState {
  final String sessionId;

  const InitializeAuthenticated(this.sessionId);
}

class InitializeUnauthenticated extends InitializeState {}
