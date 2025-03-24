import 'package:simubank/simubank.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserProfileDetailsUseCase _getUserProfileDetailsUseCase;

  UserBloc(this._getUserProfileDetailsUseCase) : super(UserNone()) {
    on<UserGetProfileDetails>(_onGetProfileDetails);
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
}
