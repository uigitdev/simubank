import 'package:simubank/simubank.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserProfileDetailsUseCase _getUserProfileDetailsUseCase;
  final DeleteCachedUserProfileUseCase _deleteUserProfileUseCase;

  StreamSubscription<dynamic>? _eventSubscription;

  UserBloc(this._getUserProfileDetailsUseCase, this._deleteUserProfileUseCase) : super(UserNone()) {
    on<UserGetProfileDetails>(_onGetProfileDetails);
    _observeEventDispatcher();
  }

  void _observeEventDispatcher() {
    _eventSubscription = EventDispatcher().stream.listen((event) {
      if (event is AuthLogout) {
        _onDeleteCachedUserProfileDetails();
      }
    });
  }

  /// Starts listening to profile details.
  ///
  /// If profile details exist, updates the state
  /// otherwise, emits an error event.
  void _onGetProfileDetails(
    UserGetProfileDetails event,
    Emitter<UserState> emit,
  ) async {
    try {
      await for (final profile in _getUserProfileDetailsUseCase.call(NoData())) {
        if (profile != null) {
          emit(UserGetProfileDetailsSuccess(profile));
        } else {
          emit(
            UserGetProfileDetailsFailed(message: AppStrings.profileNotFound),
          );
        }
      }
    } catch (error) {
      emit(UserGetProfileDetailsFailed(message: '$error'));
    }
  }

  void _onDeleteCachedUserProfileDetails() async {
    try {
      await _deleteUserProfileUseCase.call(NoData());
    } catch (_) {
      // unused
    }
  }

  @override
  Future<void> close() async {
    await _eventSubscription?.cancel();
    super.close();
  }
}
