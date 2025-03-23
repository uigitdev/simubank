import 'package:simubank/simubank.dart';

/// Get stored [sessionId] from preferences.
class GetSessionUseCase extends AppUseCase<String?, NoData> {
  @override
  Future<String?> call(NoData _) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('sessionId');
    } catch (_) {
      return null;
    }
  }
}
