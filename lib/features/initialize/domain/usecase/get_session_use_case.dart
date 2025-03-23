import 'package:simubank/simubank.dart';

/// Get stored [sessionId] from preferences.
class GetSessionUseCase extends AppUseCase<String?, NoData> {
  @override
  Future<String?> call(NoData params) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('sessionId');
  }
}
