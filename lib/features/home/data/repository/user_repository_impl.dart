import 'package:simubank/simubank.dart';

class UserRepositoryImpl extends UserRepository {
  final UserDataSources _remoteDataSources;
  final UserDataSources _cacheDataSources;

  UserRepositoryImpl(this._remoteDataSources, this._cacheDataSources);

  /// Fetches user profile details
  ///
  /// First returning cached data.
  /// Then, continuously listens for new data from the remote data source.
  /// If new data is received, it updates the cache and yields the remote data.
  /// If any error occurs, it falls back to returning cached data.
  @override
  Stream<List<UserProfileDetailsEntity>?> getUserProfileDetails() async* {
    try {
      yield* _cacheDataSources.getUserProfileDetails();

      await for(final remoteProfileDetails in _remoteDataSources.getUserProfileDetails()) {
        if (remoteProfileDetails != null) {
          await _cacheDataSources.cacheUserProfileDetails(remoteProfileDetails);
          yield remoteProfileDetails;
        }
      }

    } catch (_) {
      yield* _cacheDataSources.getUserProfileDetails();
    }
  }
}
