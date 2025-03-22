import 'package:simubank/simubank.dart';

class InitializeBloc extends Bloc<InitializeEvent, InitializeState> {
  final GetSessionUseCase _getSessionUseCase;

  InitializeBloc(this._getSessionUseCase) : super(InitializeNone()) {
    on<InitializeStart>(_onInitializeStart);
  }

  /// Check current user [sessionId]
  ///
  /// Get stored [sessionId] and add it to [sessionState] if exists otherwise
  /// send Unauthenticated event.
  void _onInitializeStart(
    InitializeEvent event,
    Emitter<InitializeState> emit,
  ) async {
    final sessionId = await _getSessionUseCase.call();
    sessionState.setSessionId(sessionId);

    // Set duration to show indicator.
    await Future.delayed(const Duration(milliseconds: 200));

    if (sessionId != null && sessionId.isNotEmpty) {
      emit(InitializeAuthenticated(sessionId));
    } else {
      emit(InitializeUnauthenticated());
    }
  }
}
