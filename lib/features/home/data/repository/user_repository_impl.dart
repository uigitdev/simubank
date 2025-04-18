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
      await for (final cachedProfileDetails in _cacheDataSources.getUserProfileDetails()) {
        if(cachedProfileDetails != null && cachedProfileDetails.isNotEmpty) {
          yield cachedProfileDetails;
        }
      }

      await for(final remoteProfileDetails in _remoteDataSources.getUserProfileDetails()) {
        if (remoteProfileDetails != null && remoteProfileDetails.isNotEmpty) {
          await _cacheDataSources.cacheUserProfileDetails(remoteProfileDetails);
          yield remoteProfileDetails;
        }
      }

    } catch (_) {
      yield* _cacheDataSources.getUserProfileDetails();
    }
  }

  @override
  Future<bool> deleteUserProfileDetails() async {
    try {
      return await _cacheDataSources.deleteCachedUserProfileDetails();
    } catch(_) {
      return false;
    }
  }
}
