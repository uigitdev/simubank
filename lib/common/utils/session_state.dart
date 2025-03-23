class SessionState {
  static final _instance = SessionState._internal();

  SessionState._internal();

  factory SessionState() => _instance;

  /// [SessionId] is the current user's [id]
  String? sessionId;

  void setSessionId(String? sessionId) {
    this.sessionId = sessionId;
  }

  void clearSessionId() {
    sessionId = null;
  }
}
