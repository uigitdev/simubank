import 'package:simubank/simubank.dart';

class UserCacheDataSourcesImpl extends UserDataSources {
  @override
  Stream<List<UserProfileDetailsModel>?> getUserProfileDetails() async* {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonProfile = prefs.getString('${sessionState.sessionId}');

      if (jsonProfile != null) {
      final jsonList = jsonDecode(jsonProfile);

       yield (jsonList as List)
           .map((jsonItem) => UserProfileDetailsModel.fromJson(jsonItem))
           .toList();
      } else {
        yield null;
      }

    } catch(_) {
      yield null;
    }
  }

  @override
  Future<bool> cacheUserProfileDetails(List<UserProfileDetailsModel> profileDetails,) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      List<Map<String, dynamic>> jsonList = profileDetails.map((profile) => profile.toJson()).toList();
      final jsonProfile = jsonEncode(jsonList);

      return await prefs.setString('${sessionState.sessionId}', jsonProfile);
    } catch(_) {
      return false;
    }
  }

  @override
  Future<bool> deleteCachedUserProfileDetails() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.remove('${sessionState.sessionId}');
      return true;
    } catch(_) {
      return false;
    }
  }
}
