import 'package:simubank/simubank.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserProfileDetailsUseCase _getUserProfileDetailsUseCase;

  UserBloc(this._getUserProfileDetailsUseCase) : super(UserNone()) {
    on<UserGetProfileDetails>(_onGetProfileDetails);
  }

  void _onGetProfileDetails(
    UserGetProfileDetails event,
    Emitter<UserState> emit,
  ) async {
    try {
      final profile = await _getUserProfileDetailsUseCase.call(NoData());

      if (profile != null) {
        emit(UserGetProfileDetailsSuccess(profile));
      } else {
        emit(UserGetProfileDetailsFailed(message: AppStrings.profileNotFound));
      }
    } catch (error) {
      emit(UserGetProfileDetailsFailed(message: '$error'));
    }
  }
}
